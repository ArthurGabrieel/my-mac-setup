# ============================================================================
# OH MY ZSH CONFIGURAÇÃO
# ============================================================================

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Plugins
plugins=(
  # Versionamento
  git
  
  # Node.js Stack
  node
  npm
  yarn
  
  # Containers
  docker
  docker-compose
  
  # Java Stack
  mvn
  gradle
  spring
  
  # Mobile
  flutter
  
  # Banco de dados
  postgres
  
  # Navegação e produtividade
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
  zsh-history-substring-search
  zsh-autocomplete
  web-search
  history
  sudo
  copypath
)

# Autocomplete configurações
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select

source $ZSH/oh-my-zsh.sh
