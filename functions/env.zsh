# ============================================================================
# FUNÇÕES DE GERENCIAMENTO DE .ENV
# ============================================================================

# Criar .env de exemplo
envexample() {
  if [ ! -f .env ]; then
    echo "DATABASE_URL=postgresql://user:pass@localhost:5432/db
REDIS_URL=redis://localhost:6379
JWT_SECRET=your-secret-key
NODE_ENV=development
PORT=3000" > .env.example
    cp .env.example .env
    echo "✓ .env.example e .env criados"
  else
    echo ".env já existe"
  fi
}

# Comparar .env com .env.example
envdiff() {
  if [ -f .env ] && [ -f .env.example ]; then
    echo "📋 Variáveis em .env.example mas não em .env:"
    comm -23 <(grep -v '^#' .env.example | cut -d= -f1 | sort) <(grep -v '^#' .env | cut -d= -f1 | sort)
  else
    echo "Arquivos .env ou .env.example não encontrados"
  fi
}

# Listar variáveis de ambiente do projeto
envlist() {
  if [ -f .env ]; then
    echo "📝 Variáveis em .env:"
    grep -v '^#' .env | grep -v '^$'
  else
    echo ".env não encontrado"
  fi
}
