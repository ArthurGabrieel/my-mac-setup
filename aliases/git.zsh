# ============================================================================
# GIT ALIASES
# ============================================================================

# Git: Básico
alias g='git'
alias gs='git status'
alias gss='git status -s'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit -m'
alias gca='git commit --amend'
alias gcane='git commit --amend --no-edit'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gf='git fetch'
alias gfa='git fetch --all'

# Git: Branches
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout main'
alias gcod='git checkout develop'
alias gcm='git checkout main'
alias gcd='git checkout develop'

# Git: Logs
alias gl='git log --oneline --graph --decorate'
alias gla='git log --oneline --graph --decorate --all'
alias glg='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gll='git log --pretty=format:"%C(yellow)%h%Cred%d %Creset%s%Cblue [%cn]" --decorate --numstat'
alias gld='git log --pretty=format:"%C(yellow)%h %C(blue)%ad %C(red)%d %Creset%s%Cblue [%cn]" --decorate --date=short'

# Git: Diff e Stash
alias gd='git diff'
alias gdc='git diff --cached'
alias gds='git diff --staged'
alias gst='git stash'
alias gsta='git stash apply'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstd='git stash drop'

# Git: Merge e Rebase
alias gm='git merge'
alias gma='git merge --abort'
alias gr='git rebase'
alias gri='git rebase -i'
alias gra='git rebase --abort'
alias grc='git rebase --continue'

# Git: Reset e Clean
alias grh='git reset HEAD'
alias grhh='git reset --hard HEAD'
alias grst='git restore'
alias gclean='git clean -fd'
alias gundo='git reset --soft HEAD~1'

# Git: Remote
alias grv='git remote -v'
alias grma='git remote add'
alias grmr='git remote remove'
alias grmu='git remote update'

# Git: Configuração de contas
alias gitpersonal='git config user.name "Arthur Gabriel" && git config user.email "arthurelgg@gmail.com"'
alias gitwork='git config user.name "Arthur Gabriel" && git config user.email "arthur.gomes@sortech.com.br"'
alias gitoctoluna='git config user.name "Octoluna Tech" && git config user.email "octoluna.tech@gmail.com"'
alias gitshow='echo "Nome: $(git config user.name)" && echo "Email: $(git config user.email)"'
