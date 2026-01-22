# ============================================================================
# FUNÇÕES DE DESENVOLVIMENTO
# ============================================================================

# Criar e entrar em diretório
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Extrair arquivos
extract() {
  if [ -f $1 ]; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)           echo "'$1' não pode ser extraído" ;;
    esac
  else
    echo "'$1' não é um arquivo válido"
  fi
}

# Matar processo na porta
unalias killport 2>/dev/null
killport() {
  if [ -z "$1" ]; then
    echo "Usage: killport <port-number>"
    return 1
  fi
  lsof -ti:$1 | xargs kill -9
  echo "Processo na porta $1 finalizado"
}

# Ver o que está rodando em uma porta
whatsport() {
  if [ -z "$1" ]; then
    echo "Usage: whatsport <port>"
    return 1
  fi
  lsof -i :$1
}

# Listar todas as portas em uso
portsused() {
  lsof -i -P -n | grep LISTEN | awk '{print $9}' | sed 's/.*://' | sort -u
}

# Backup rápido de arquivo
backup() {
  cp "$1"{,.backup-$(date +%Y%m%d-%H%M%S)}
}

# Criar branch git e já fazer checkout
unalias gcbn 2>/dev/null
gcbn() {
  git checkout -b "$1" && git push -u origin "$1"
}

# Commit e push em um comando
unalias gcp 2>/dev/null
gcp() {
  git add .
  git commit -m "$1"
  git push
}

# Inicializar repositório git
gitinit() {
  git init
  git add .
  git commit -m "chore: initial commit"
  echo "✓ Repositório inicializado"
}

# Atualizar todos os repositórios git em subdiretórios
gitupall() {
  find . -type d -name .git -exec sh -c 'cd "{}" && cd .. && pwd && git pull' \;
}

# Ver tamanho de diretórios no diretório atual
dirsize() {
  du -sh */ | sort -hr
}

# Abrir arquivo específico no CotEditor
cotedit() {
  if [ -z "$1" ]; then
    echo "Usage: cotedit <file>"
    return 1
  fi
  open -a CotEditor "$1"
}

# Função de help
myhelp() {
  cat << 'EOF'
🚀 Comandos Principais - Arthur Gabriel

GIT:
  gcp "msg"          - Add, commit e push
  gcbn <branch>      - Criar e push nova branch
  gitshow            - Ver configuração git atual
  
NPM/NODE:
  ni                 - npm install
  nd                 - npm run dev
  nuke               - Limpar tudo e reinstalar
  
NESTJS:
  nestdev            - npm run start:dev
  nestg              - nest generate
  
DOCKER:
  dcud               - docker-compose up -d
  dclf               - docker-compose logs -f
  dprune             - Limpar tudo do Docker
  
FLUTTER:
  flios              - Rodar no iPhone
  fliosfix           - Fix completo do iOS
  flnuke             - Limpar cache completo
  fldoctorio         - Verificar config iOS
  
POSTGRESQL:
  pgstart/pgstop     - Iniciar/parar PostgreSQL
  pgdump <db>        - Criar backup
  pgrestore <f> <db> - Restaurar backup
  pgclone <s> <t>    - Clonar banco
  listdbs            - Listar bancos
  
UTILIDADES:
  killport <porta>   - Matar processo na porta
  mkcd <dir>         - Criar e entrar em diretório
  backup <file>      - Backup rápido de arquivo
  extract <file>     - Extrair arquivo comprimido
  
Digite 'alias | grep <termo>' para buscar aliases específicos
EOF
}
