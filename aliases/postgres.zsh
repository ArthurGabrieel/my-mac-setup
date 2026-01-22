# ============================================================================
# POSTGRESQL ALIASES
# ============================================================================

# PostgreSQL: Serviço
alias pgstart='brew services start postgresql@17'
alias pgstop='brew services stop postgresql@17'
alias pgrestart='brew services restart postgresql@17'
alias pgstatus='brew services list | grep postgres'
alias psql='psql -U postgres'
alias pg='psql -U postgres'

# PostgreSQL: Logs e Config
alias pglog='tail -f /opt/homebrew/var/log/postgresql@17.log'
alias pgconfig='code /opt/homebrew/var/postgresql@17/postgresql.conf'
alias pghba='code /opt/homebrew/var/postgresql@17/pg_hba.conf'

# PostgreSQL: Comandos úteis
alias listdbs='psql -U postgres -c "\l"'
