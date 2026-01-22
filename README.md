# Configuração ZSH - Arthur Gabriel

Estrutura modular para facilitar manutenção e organização.

## 📁 Estrutura de Arquivos

```
~/.zshrc                    # Arquivo principal (carrega todos os módulos)
~/.zsh/
├── config/                 # Configurações gerais
│   ├── exports.zsh        # Variáveis de ambiente (PATH, NVM, PostgreSQL)
│   ├── oh-my-zsh.zsh      # Configuração do Oh My Zsh e plugins
│   └── fzf.zsh            # Configuração do Fuzzy Finder
│
├── aliases/               # Aliases organizados por tecnologia
│   ├── git.zsh           # Aliases do Git
│   ├── node.zsh          # NPM, Yarn, PNPM, NestJS, Next.js, Prisma
│   ├── docker.zsh        # Docker e Docker Compose
│   ├── java.zsh          # Maven, Gradle, Spring Boot, JDK
│   ├── flutter.zsh       # Flutter, CocoaPods, Xcode
│   ├── postgres.zsh      # PostgreSQL
│   └── system.zsh        # Sistema, navegação, editores
│
└── functions/             # Funções utilitárias
    ├── dev.zsh           # Funções gerais de desenvolvimento
    ├── flutter-ios.zsh   # Funções específicas Flutter/iOS
    ├── postgres.zsh      # Funções de backup/restore PostgreSQL
    └── env.zsh           # Gerenciamento de .env
```

## 🚀 Como Usar

### Aplicar alterações
```bash
source ~/.zshrc
# ou simplesmente
reload
```

### Editar configurações
```bash
# Editar o arquivo principal
code ~/.zshrc

# Editar aliases específicos
code ~/.zsh/aliases/git.zsh
code ~/.zsh/aliases/node.zsh

# Editar funções
code ~/.zsh/functions/dev.zsh
```

### Ver comandos disponíveis
```bash
help          # Lista comandos principais
ajuda         # Mesmo que help
aliases       # Ver todos os aliases
```

## ✏️ Como Adicionar Novos Aliases

### 1. Edite o arquivo correspondente
```bash
code ~/.zsh/aliases/node.zsh
```

### 2. Adicione seu alias
```bash
alias myalias='comando'
```

### 3. Recarregue
```bash
reload
```

## 📦 Como Adicionar Novas Funções

### 1. Escolha o arquivo apropriado ou crie um novo
```bash
code ~/.zsh/functions/dev.zsh
```

### 2. Adicione sua função
```bash
myfunc() {
  echo "Hello World"
}
```

### 3. Se criou um novo arquivo, adicione no .zshrc
```bash
# No ~/.zshrc, adicione:
source ~/.zsh/functions/meu-arquivo.zsh
```

### 4. Recarregue
```bash
reload
```

## 🔧 Vantagens desta Estrutura

- ✅ **Organização**: Fácil encontrar e editar aliases/funções específicas
- ✅ **Manutenibilidade**: Mudanças isoladas não afetam outros módulos
- ✅ **Performance**: Carrega apenas o necessário
- ✅ **Legibilidade**: Código limpo e bem estruturado
- ✅ **Reutilização**: Fácil copiar módulos entre máquinas
- ✅ **Versionamento**: Pode versionar arquivos individuais no Git

## 🎯 Principais Comandos

### Git
- `gcp "msg"` - Add, commit e push
- `gcbn <branch>` - Criar branch e push
- `gitshow` - Ver configuração atual

### Node.js
- `nd` - npm run dev
- `nuke` - Limpar node_modules e reinstalar
- `nestdev` - NestJS dev mode

### Docker
- `dcud` - docker-compose up -d
- `dclf` - docker-compose logs -f
- `dprune` - Limpar sistema Docker

### Flutter
- `flios` - Run no iPhone
- `flnuke` - Limpar cache completo
- `fldoctorio` - Verificar setup iOS

### PostgreSQL
- `pgstart` / `pgstop` - Controlar serviço
- `pgdump <db>` - Criar backup
- `pgrestore <dump> <db>` - Restaurar backup

### Utilitários
- `killport <porta>` - Matar processo
- `mkcd <dir>` - Criar e entrar em dir
- `extract <file>` - Extrair arquivo

## 🔒 Backup

Recomendo versionar sua configuração:

```bash
cd ~
git init
git add .zshrc .zsh/
git commit -m "Configuração ZSH"
git remote add origin <seu-repo>
git push
```

## 📝 Notas

- Todos os aliases e funções estão documentados nos próprios arquivos
- Use `alias | grep <termo>` para buscar aliases específicos
- O arquivo `.zshrc` principal é minimalista e apenas carrega os módulos
- Personalize conforme necessário editando os arquivos em `~/.zsh/`

---

**Desenvolvedor:** Arthur Gabriel  
**Stack:** Node.js, NestJS, Next.js, Spring Boot, Flutter
