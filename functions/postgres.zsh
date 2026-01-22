# ============================================================================
# FUNÇÕES POSTGRESQL BACKUP/RESTORE
# ============================================================================

# Criar dump de banco (formato custom comprimido)
pgdump() {
  if [ -z "$1" ]; then
    echo "Usage: pgdump <database-name> [output-file] [host] [port] [user]"
    echo "Example: pgdump sportickets"
    echo "Example: pgdump sportickets backup.dump localhost 5432 postgres"
    return 1
  fi
  
  local dbname=$1
  local output=${2:-"dump_${dbname}_$(date +%Y%m%d_%H%M%S).dump"}
  local host=${3:-localhost}
  local port=${4:-5432}
  local user=${5:-postgres}
  
  echo "📦 Criando dump de $dbname..."
  pg_dump -h "$host" -p "$port" -U "$user" -d "$dbname" -Fc -f "$output"
  
  if [ $? -eq 0 ]; then
    local size=$(du -h "$output" | cut -f1)
    echo "✓ Dump criado: $output ($size)"
  else
    echo "✗ Erro ao criar dump"
    return 1
  fi
}

# Restaurar dump (formato custom)
pgrestore() {
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: pgrestore <dump-file> <database-name> [host] [port] [user]"
    echo "Example: pgrestore backup.dump sportickets"
    echo "Example: pgrestore dump.dump sportickets localhost 5450 admin"
    return 1
  fi
  
  local dumpfile=$1
  local dbname=$2
  local host=${3:-localhost}
  local port=${4:-5432}
  local user=${5:-postgres}
  
  if [ ! -f "$dumpfile" ]; then
    echo "✗ Arquivo $dumpfile não encontrado"
    return 1
  fi
  
  echo "⚠️  Isso vai LIMPAR e RESTAURAR o banco $dbname!"
  echo "Host: $host:$port"
  echo "User: $user"
  echo "Dump: $dumpfile"
  echo ""
  read "response?Continuar? (y/N): "
  
  if [[ "$response" =~ ^[Yy]$ ]]; then
    echo "🔄 Restaurando dump..."
    pg_restore -h "$host" -p "$port" -U "$user" -d "$dbname" -Fc "$dumpfile" \
      --no-owner --no-privileges --clean 2>&1 | grep -v "already exists\|does not exist"
    
    echo "✓ Restauração concluída!"
  else
    echo "Operação cancelada"
  fi
}

# Clonar banco de dados
pgclone() {
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: pgclone <source-db> <target-db> [host] [port] [user]"
    echo "Example: pgclone sportickets sportickets_backup"
    return 1
  fi
  
  local source=$1
  local target=$2
  local host=${3:-localhost}
  local port=${4:-5432}
  local user=${5:-postgres}
  
  echo "📋 Clonando $source → $target..."
  
  # Criar banco de destino
  psql -h "$host" -p "$port" -U "$user" -c "CREATE DATABASE $target;" 2>/dev/null
  
  # Fazer dump e restore
  local tempfile="/tmp/clone_${source}_$(date +%s).dump"
  pg_dump -h "$host" -p "$port" -U "$user" -d "$source" -Fc -f "$tempfile"
  pg_restore -h "$host" -p "$port" -U "$user" -d "$target" -Fc "$tempfile" \
    --no-owner --no-privileges --clean 2>&1 | grep -v "already exists\|does not exist"
  rm "$tempfile"
  
  echo "✓ Clone concluído: $target"
}

# Dump apenas do schema (estrutura)
pgdumpschema() {
  if [ -z "$1" ]; then
    echo "Usage: pgdumpschema <database-name> [output-file] [host] [port] [user]"
    return 1
  fi
  
  local dbname=$1
  local output=${2:-"schema_${dbname}_$(date +%Y%m%d_%H%M%S).sql"}
  local host=${3:-localhost}
  local port=${4:-5432}
  local user=${5:-postgres}
  
  echo "📦 Criando dump do schema..."
  pg_dump -h "$host" -p "$port" -U "$user" -d "$dbname" -s -f "$output" \
    --no-owner --no-privileges
  
  echo "✓ Schema salvo: $output"
}

# Dump apenas dos dados
pgdumpdata() {
  if [ -z "$1" ]; then
    echo "Usage: pgdumpdata <database-name> [output-file] [host] [port] [user]"
    return 1
  fi
  
  local dbname=$1
  local output=${2:-"data_${dbname}_$(date +%Y%m%d_%H%M%S).sql"}
  local host=${3:-localhost}
  local port=${4:-5432}
  local user=${5:-postgres}
  
  echo "📦 Criando dump dos dados..."
  pg_dump -h "$host" -p "$port" -U "$user" -d "$dbname" -a -f "$output" \
    --no-owner --no-privileges
  
  echo "✓ Dados salvos: $output"
}

# Dump de uma tabela específica
pgdumptable() {
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: pgdumptable <database-name> <table-name> [output-file] [host] [port] [user]"
    echo "Example: pgdumptable sportickets users users_backup.sql"
    return 1
  fi
  
  local dbname=$1
  local table=$2
  local output=${3:-"${table}_$(date +%Y%m%d_%H%M%S).sql"}
  local host=${4:-localhost}
  local port=${5:-5432}
  local user=${6:-postgres}
  
  echo "📦 Criando dump da tabela $table..."
  pg_dump -h "$host" -p "$port" -U "$user" -d "$dbname" -t "$table" -f "$output" \
    --no-owner --no-privileges
  
  echo "✓ Tabela salva: $output"
}

# Listar dumps no diretório atual
pglistdumps() {
  echo "📦 Dumps disponíveis:"
  ls -lh *.dump *.sql 2>/dev/null | awk '{print $9, "("$5")"}'
  
  if [ $? -ne 0 ]; then
    echo "Nenhum dump encontrado no diretório atual"
  fi
}

# Restaurar dump SQL (formato texto)
pgrestoresql() {
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: pgrestoresql <sql-file> <database-name> [host] [port] [user]"
    echo "Example: pgrestoresql backup.sql sportickets"
    return 1
  fi
  
  local sqlfile=$1
  local dbname=$2
  local host=${3:-localhost}
  local port=${4:-5432}
  local user=${5:-postgres}
  
  if [ ! -f "$sqlfile" ]; then
    echo "✗ Arquivo $sqlfile não encontrado"
    return 1
  fi
  
  echo "⚠️  Isso vai executar o SQL no banco $dbname!"
  read "response?Continuar? (y/N): "
  
  if [[ "$response" =~ ^[Yy]$ ]]; then
    echo "🔄 Restaurando SQL..."
    psql -h "$host" -p "$port" -U "$user" -d "$dbname" -f "$sqlfile"
    echo "✓ SQL executado"
  fi
}
