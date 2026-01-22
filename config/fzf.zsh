# ============================================================================
# FZF (FUZZY FINDER) CONFIGURAÇÃO
# ============================================================================

export FZF_DEFAULT_OPTS='
  --height 40% 
  --layout=reverse 
  --border
  --preview "([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | head -200))"
  --preview-window=right:50%:wrap
'

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Aliases FZF
alias fzfp='fzf --preview "bat --style=numbers --color=always {}"'
alias fzfkill='ps aux | fzf | awk "{print \$2}" | xargs kill -9'

# Carregar FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
