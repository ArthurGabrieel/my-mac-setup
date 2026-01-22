# ============================================================================
# SISTEMA E NAVEGAÇÃO ALIASES
# ============================================================================

# Navegação
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ~='cd ~'
alias -- -='cd -'
alias c='clear'
alias h='history'
alias j='jobs'

# Listagem com eza
alias l='eza -1 --icons'
alias ls='eza -a --icons'
alias ll='eza -lah --icons --git'
alias lt='eza --tree --level=2 --icons'
alias ltt='eza --tree --level=3 --icons'
alias ltree='eza --tree --icons'
alias lsize='eza -lah --icons --sort=size'
alias ldate='eza -lah --icons --sort=modified'
alias ldir='eza -D --icons'
alias lfile='eza -f --icons'
alias lgit='eza -lah --icons --git --git-ignore'
alias lll='eza -lah --icons --git --header --group'
alias llg='eza -lah --icons --git --header --group --git-repos'

# Busca
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias find-file='find . -type f -name'
alias find-dir='find . -type d -name'
alias find-code='grep -r --include="*.ts" --include="*.tsx" --include="*.js" --include="*.jsx"'

# Editores
alias code='code .'
alias vscode='code'
alias cot='open -a CotEditor'
alias edit='open -a CotEditor'
alias txt='open -a CotEditor'

# Sistema
alias ports='lsof -i -P -n | grep LISTEN'
alias myip='curl ifconfig.me'
alias localip='ipconfig getifaddr en0'
alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'

# Produtividade
alias reload='source ~/.zshrc'
alias zshconfig='code ~/.zshrc'
alias editaliases='code ~/.zsh/aliases'
alias aliases='alias | grep'
alias path='echo $PATH | tr ":" "\n"'
alias duh='du -h --max-depth=1 | sort -hr'
alias sizeof='du -sh'
alias dev='cd ~/dev'
alias weather='curl wttr.in'
alias epoch='date +%s'
alias now='date +"%Y-%m-%d %H:%M:%S"'
alias week='date +%V'

# Help
alias help='myhelp'
alias ajuda='myhelp'

# ============================================================================
# DOTFILES / GITHUB SYNC
# ============================================================================

# Sync dotfiles para GitHub
alias dotsync='cd ~/zsh-dotfiles 2>/dev/null && cp ~/.zshrc . && cp -r ~/.zsh/* .zsh/ && git add . && git commit -m "chore: update config $(date +%Y-%m-%d)" && git push && cd - && echo "✅ Dotfiles sincronizados com GitHub!"'

# Pull dotfiles do GitHub
alias dotpull='cd ~/zsh-dotfiles 2>/dev/null && git pull && cp .zshrc ~/.zshrc && cp -r .zsh/* ~/.zsh/ && cd - && source ~/.zshrc && echo "✅ Dotfiles atualizados do GitHub!"'

# Status dos dotfiles
alias dotstatus='cd ~/zsh-dotfiles 2>/dev/null && git status && cd -'

# Ver diff dos dotfiles
alias dotdiff='cd ~/zsh-dotfiles 2>/dev/null && git diff && cd -'

# Abrir repo no GitHub
alias dotgithub='open https://github.com/$(cd ~/zsh-dotfiles 2>/dev/null && git remote get-url origin | sed "s/.*github.com[:/]\(.*\)\.git/\1/")'

# Editar dotfiles diretamente no repo
alias dotedit='code ~/zsh-dotfiles'
