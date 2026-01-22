#!/bin/bash

echo "🔍 Verificando estrutura ZSH..."
echo ""

# Verificar se os diretórios existem
echo "📁 Verificando diretórios:"
[ -d ~/.zsh ] && echo "✓ ~/.zsh" || echo "✗ ~/.zsh FALTANDO"
[ -d ~/.zsh/config ] && echo "✓ ~/.zsh/config" || echo "✗ ~/.zsh/config FALTANDO"
[ -d ~/.zsh/aliases ] && echo "✓ ~/.zsh/aliases" || echo "✗ ~/.zsh/aliases FALTANDO"
[ -d ~/.zsh/functions ] && echo "✓ ~/.zsh/functions" || echo "✗ ~/.zsh/functions FALTANDO"

echo ""
echo "📄 Verificando arquivos de configuração:"
[ -f ~/.zsh/config/exports.zsh ] && echo "✓ exports.zsh" || echo "✗ exports.zsh FALTANDO"
[ -f ~/.zsh/config/oh-my-zsh.zsh ] && echo "✓ oh-my-zsh.zsh" || echo "✗ oh-my-zsh.zsh FALTANDO"
[ -f ~/.zsh/config/fzf.zsh ] && echo "✓ fzf.zsh" || echo "✗ fzf.zsh FALTANDO"

echo ""
echo "🔗 Verificando arquivos de aliases:"
[ -f ~/.zsh/aliases/git.zsh ] && echo "✓ git.zsh" || echo "✗ git.zsh FALTANDO"
[ -f ~/.zsh/aliases/node.zsh ] && echo "✓ node.zsh" || echo "✗ node.zsh FALTANDO"
[ -f ~/.zsh/aliases/docker.zsh ] && echo "✓ docker.zsh" || echo "✗ docker.zsh FALTANDO"
[ -f ~/.zsh/aliases/java.zsh ] && echo "✓ java.zsh" || echo "✗ java.zsh FALTANDO"
[ -f ~/.zsh/aliases/flutter.zsh ] && echo "✓ flutter.zsh" || echo "✗ flutter.zsh FALTANDO"
[ -f ~/.zsh/aliases/postgres.zsh ] && echo "✓ postgres.zsh" || echo "✗ postgres.zsh FALTANDO"
[ -f ~/.zsh/aliases/system.zsh ] && echo "✓ system.zsh" || echo "✗ system.zsh FALTANDO"

echo ""
echo "⚙️  Verificando arquivos de funções:"
[ -f ~/.zsh/functions/dev.zsh ] && echo "✓ dev.zsh" || echo "✗ dev.zsh FALTANDO"
[ -f ~/.zsh/functions/flutter-ios.zsh ] && echo "✓ flutter-ios.zsh" || echo "✗ flutter-ios.zsh FALTANDO"
[ -f ~/.zsh/functions/postgres.zsh ] && echo "✓ postgres.zsh" || echo "✗ postgres.zsh FALTANDO"
[ -f ~/.zsh/functions/env.zsh ] && echo "✓ env.zsh" || echo "✗ env.zsh FALTANDO"

echo ""
echo "📚 Verificando README:"
[ -f ~/.zsh/README.md ] && echo "✓ README.md" || echo "✗ README.md FALTANDO"

echo ""
echo "✅ Verificação completa!"
echo ""
echo "Para aplicar as mudanças, execute:"
echo "  source ~/.zshrc"
echo ""
echo "Ou simplesmente feche e abra o terminal novamente."
