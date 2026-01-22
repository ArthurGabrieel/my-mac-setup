# ============================================================================
#
# Estrutura modular:
#   ~/.zsh/config/      - Configurações (oh-my-zsh, fzf, exports)
#   ~/.zsh/aliases/     - Aliases organizados por tecnologia
#   ~/.zsh/functions/   - Funções utilitárias
# ============================================================================

# ============================================================================
# 1. CONFIGURAÇÕES INICIAIS
# ============================================================================

# Histórico de comandos
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Opções do histórico
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt CORRECT
setopt CORRECT_ALL

# ============================================================================
# 2. CARREGAR VARIÁVEIS DE AMBIENTE
# ============================================================================

source ~/.zsh/config/exports.zsh

# ============================================================================
# 3. CARREGAR OH MY ZSH
# ============================================================================

source ~/.zsh/config/oh-my-zsh.zsh

# ============================================================================
# 4. CARREGAR FZF
# ============================================================================

source ~/.zsh/config/fzf.zsh

# ============================================================================
# 5. CARREGAR ALIASES
# ============================================================================

source ~/.zsh/aliases/git.zsh
source ~/.zsh/aliases/node.zsh
source ~/.zsh/aliases/docker.zsh
source ~/.zsh/aliases/java.zsh
source ~/.zsh/aliases/flutter.zsh
source ~/.zsh/aliases/postgres.zsh
source ~/.zsh/aliases/system.zsh

# ============================================================================
# 6. CARREGAR FUNÇÕES
# ============================================================================

source ~/.zsh/functions/dev.zsh
source ~/.zsh/functions/flutter-ios.zsh
source ~/.zsh/functions/postgres.zsh
source ~/.zsh/functions/env.zsh

# ============================================================================
# 7. MENSAGEM DE BOAS-VINDAS (OPCIONAL)
# ============================================================================

# Descomente para ver uma mensagem ao abrir o terminal
# echo "👋 Olá Arthur! Digite 'help' para ver comandos principais"

# ============================================================================
# FIM DO .ZSHRC
# ============================================================================
