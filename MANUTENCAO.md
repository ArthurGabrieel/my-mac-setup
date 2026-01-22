# 🔧 Comandos de Manutenção - ZSH Modular

## 📝 Edição Rápida

```bash
# Editar arquivo principal
code ~/.zshrc

# Editar pasta completa no VS Code
code ~/.zsh

# Editar aliases específicos
code ~/.zsh/aliases/git.zsh
code ~/.zsh/aliases/node.zsh
code ~/.zsh/aliases/docker.zsh
code ~/.zsh/aliases/java.zsh
code ~/.zsh/aliases/flutter.zsh
code ~/.zsh/aliases/postgres.zsh
code ~/.zsh/aliases/system.zsh

# Editar funções específicas
code ~/.zsh/functions/dev.zsh
code ~/.zsh/functions/flutter-ios.zsh
code ~/.zsh/functions/postgres.zsh
code ~/.zsh/functions/env.zsh

# Editar configurações
code ~/.zsh/config/exports.zsh
code ~/.zsh/config/oh-my-zsh.zsh
code ~/.zsh/config/fzf.zsh
```

## 🔄 Recarregar Configuração

```bash
# Método 1: Usar alias
reload

# Método 2: Source manual
source ~/.zshrc

# Método 3: Reiniciar terminal
# Fechar e abrir novamente
```

## 🔍 Buscar e Verificar

```bash
# Buscar alias específico
alias | grep git
alias | grep docker
alias | grep flutter

# Listar todos os aliases
alias

# Ver função específica
type pgdump
type flnuke
type killport

# Listar todas as funções
declare -f
```

## 🧪 Testar Alterações

```bash
# Testar sem salvar permanentemente
source ~/.zsh/aliases/git.zsh

# Verificar se alias existe
type gs
type nd
type dcud

# Verificar se função existe
type pgdump
type fliosreset
```

## 📦 Backup e Versionamento

```bash
# Criar backup manual
cp ~/.zshrc ~/.zshrc.backup
cp -r ~/.zsh ~/.zsh.backup

# Inicializar Git (recomendado)
cd ~
git init
git add .zshrc .zsh/
git commit -m "feat: configuração zsh modular"

# Criar repositório remoto e push
git remote add origin git@github.com:seu-usuario/dotfiles.git
git push -u origin main

# Atualizar configuração versionada
cd ~
git add .zsh/
git commit -m "feat: adicionar novos aliases"
git push
```

## 🗑️ Remover ou Desabilitar Módulos

```bash
# Desabilitar módulo (comentar no .zshrc)
code ~/.zshrc
# Adicionar # antes da linha source

# Exemplo: desabilitar aliases Java
# source ~/.zsh/aliases/java.zsh  →  # source ~/.zsh/aliases/java.zsh

# Remover módulo completamente
rm ~/.zsh/aliases/java.zsh

# Depois recarregar
reload
```

## ➕ Adicionar Novo Módulo

```bash
# Criar novo arquivo de aliases
code ~/.zsh/aliases/python.zsh

# Adicionar aliases nele
# alias py='python3'
# alias pip='pip3'

# Incluir no .zshrc
echo "source ~/.zsh/aliases/python.zsh" >> ~/.zshrc

# Recarregar
reload
```

## 📊 Análise e Otimização

```bash
# Ver tamanho dos arquivos
du -sh ~/.zsh/*
du -sh ~/.zsh/aliases/*
du -sh ~/.zsh/functions/*

# Contar linhas por arquivo
wc -l ~/.zsh/aliases/*.zsh
wc -l ~/.zsh/functions/*.zsh

# Ver aliases mais usados (com histórico)
history | awk '{print $2}' | sort | uniq -c | sort -rn | head -20
```

## 🔐 Permissões

```bash
# Verificar permissões
ls -la ~/.zshrc
ls -la ~/.zsh/

# Corrigir permissões se necessário
chmod 644 ~/.zshrc
chmod -R 644 ~/.zsh/*.zsh
chmod 755 ~/.zsh/
```

## 🚨 Troubleshooting

```bash
# Se algo não funcionar após mudanças:

# 1. Verificar erros de sintaxe
zsh -n ~/.zshrc

# 2. Carregar em modo debug
zsh -xv

# 3. Verificar qual arquivo tem erro
source ~/.zsh/config/exports.zsh
source ~/.zsh/config/oh-my-zsh.zsh
# ... testar um por um

# 4. Restaurar backup
cp ~/.zshrc.backup ~/.zshrc
source ~/.zshrc

# 5. Ver logs de erro
cat ~/.zsh_history | tail -50
```

## 🧹 Limpeza

```bash
# Limpar histórico antigo
echo "" > ~/.zsh_history

# Remover arquivos de backup antigos
find ~ -name "*.backup" -mtime +30 -delete

# Limpar cache do Oh My Zsh
rm -rf ~/.oh-my-zsh/cache/*
```

## 📱 Sincronização entre Máquinas

```bash
# Máquina 1: Criar repositório
cd ~
git init
git add .zshrc .zsh/
git commit -m "Initial config"
git remote add origin <seu-repo>
git push -u origin main

# Máquina 2: Clonar
cd ~
git clone <seu-repo> dotfiles-temp
cp dotfiles-temp/.zshrc ~/.zshrc
cp -r dotfiles-temp/.zsh ~/.zsh
rm -rf dotfiles-temp
source ~/.zshrc

# Manter sincronizado
cd ~/dotfiles-temp
git pull
```

## 📈 Performance

```bash
# Medir tempo de carregamento do .zshrc
time zsh -i -c exit

# Otimizar: desabilitar plugins pesados
# Editar ~/.zsh/config/oh-my-zsh.zsh
# Remover plugins não usados

# Ver o que demora no carregamento
zsh -xv 2>&1 | ts -i "%.s"
```

## 💾 Export/Import Seletivo

```bash
# Exportar apenas aliases Git
cat ~/.zsh/aliases/git.zsh > ~/git-aliases.zsh

# Importar em outra máquina
cp ~/git-aliases.zsh ~/.zsh/aliases/
echo "source ~/.zsh/aliases/git-aliases.zsh" >> ~/.zshrc
source ~/.zshrc

# Compartilhar com colega
tar -czf meus-aliases.tar.gz ~/.zsh/aliases/
# Enviar arquivo e descompactar no destino
```

## 🎯 Quick Reference

| Comando | Ação |
|---------|------|
| `reload` | Recarregar .zshrc |
| `code ~/.zsh` | Abrir pasta no VS Code |
| `alias \| grep <termo>` | Buscar alias |
| `type <funcao>` | Ver definição de função |
| `zsh -n ~/.zshrc` | Verificar sintaxe |
| `git add ~/.zsh && git commit` | Versionar mudanças |

---

**Dica:** Adicione este arquivo aos favoritos para consulta rápida!
