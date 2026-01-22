# ============================================================================
# DOCKER ALIASES
# ============================================================================

# Docker: Básico
alias d='docker'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias drm='docker rm'
alias drmi='docker rmi'
alias dstop='docker stop'
alias dstart='docker start'
alias drestart='docker restart'
alias dexec='docker exec -it'
alias dlogs='docker logs -f'
alias dinspect='docker inspect'
alias dprune='docker system prune -af'

# Docker: Build e Run
alias db='docker build'
alias dbt='docker build -t'
alias dr='docker run'
alias drit='docker run -it'
alias drrm='docker run --rm'
alias drmit='docker run --rm -it'

# Docker Compose
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcud='docker-compose up -d'
alias dcd='docker-compose down'
alias dcb='docker-compose build'
alias dcr='docker-compose restart'
alias dcl='docker-compose logs'
alias dclf='docker-compose logs -f'
alias dcps='docker-compose ps'
alias dcexec='docker-compose exec'
alias dcstop='docker-compose stop'
alias dcstart='docker-compose start'
alias dcpull='docker-compose pull'
alias dcdown='docker-compose down -v --remove-orphans'
