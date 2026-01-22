# ============================================================================
# NODE.JS / NPM / YARN / PNPM ALIASES
# ============================================================================

# NPM: Instalação
alias ni='npm install'
alias nis='npm install --save'
alias nid='npm install --save-dev'
alias nig='npm install -g'
alias nu='npm uninstall'
alias nug='npm uninstall -g'
alias nup='npm update'
alias nci='npm ci'
alias nout='npm outdated'
alias nls='npm list --depth=0'

# NPM: Scripts
alias ns='npm start'
alias nd='npm run dev'
alias nb='npm run build'
alias nt='npm test'
alias ntw='npm test -- --watch'
alias nl='npm run lint'
alias nlf='npm run lint:fix'
alias nf='npm run format'
alias nprod='npm run start:prod'

# NPM: Limpeza
alias ncc='npm cache clean --force'
alias nrn='rm -rf node_modules package-lock.json && npm install'
alias nuke='rm -rf node_modules package-lock.json dist build .next && npm install'

# Yarn
alias y='yarn'
alias ya='yarn add'
alias yad='yarn add --dev'
alias yr='yarn remove'
alias yi='yarn install'
alias yup='yarn upgrade'
alias ys='yarn start'
alias yd='yarn dev'
alias yb='yarn build'
alias yt='yarn test'
alias ytw='yarn test --watch'
alias yl='yarn lint'
alias ylf='yarn lint:fix'

# PNPM
alias pn='pnpm'
alias pni='pnpm install'
alias pna='pnpm add'
alias pnad='pnpm add -D'
alias pnr='pnpm remove'
alias pnup='pnpm update'
alias pns='pnpm start'
alias pnd='pnpm dev'
alias pnb='pnpm build'
alias pnt='pnpm test'

# NestJS
alias nestdev='npm run start:dev'
alias nestbuild='npm run build'
alias nestprod='npm run start:prod'
alias nesttest='npm run test'
alias nestwatch='npm run test:watch'
alias nestcov='npm run test:cov'
alias nestlint='npm run lint'
alias nestformat='npm run format'
alias nestg='nest generate'
alias nestgs='nest g service'
alias nestgc='nest g controller'
alias nestgm='nest g module'
alias nestgr='nest g resolver'

# Next.js
alias nextdev='npm run dev'
alias nextbuild='npm run build'
alias nextstart='npm run start'
alias nextlint='npm run lint'
alias nextclean='rm -rf .next out'

# React
alias cra='npx create-react-app'
alias reactdev='npm start'
alias reactbuild='npm run build'
alias reacttest='npm test'
alias reacteject='npm run eject'

# TypeScript
alias tsc='npx tsc'
alias tscw='npx tsc --watch'
alias tscb='npx tsc --build'
alias tsnode='npx ts-node'

# Prisma
alias prisma='npx prisma'
alias pmig='npx prisma migrate dev'
alias pgen='npx prisma generate'
alias pstudio='npx prisma studio'
alias pseed='npx prisma db seed'
alias preset='npx prisma migrate reset'
alias ppush='npx prisma db push'
