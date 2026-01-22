# ============================================================================
# FUNÇÕES FLUTTER iOS
# ============================================================================

# Limpar tudo do Flutter iOS e reinstalar
fliosreset() {
  echo "🧹 Limpando cache do Flutter iOS..."
  flutter clean
  rm -rf ios/Pods ios/Podfile.lock ios/.symlinks
  rm -rf ~/Library/Developer/Xcode/DerivedData/*
  
  echo "📦 Reinstalando CocoaPods..."
  cd ios
  pod deintegrate
  pod install
  cd ..
  
  echo "✓ Reset completo finalizado!"
}

# Rodar Flutter iOS com device específico
flrun() {
  if [ -z "$1" ]; then
    echo "Dispositivos disponíveis:"
    flutter devices
    echo ""
    echo "Usage: flrun <device-id>"
    return 1
  fi
  flutter run -d "$1"
}

# Listar simuladores iOS disponíveis
ioslist() {
  xcrun simctl list devices available | grep "iPhone\|iPad"
}

# Abrir simulador iOS específico
iosopen() {
  if [ -z "$1" ]; then
    echo "Usage: iosopen <simulator-name>"
    echo "Example: iosopen 'iPhone 15 Pro'"
    echo ""
    echo "Simuladores disponíveis:"
    ioslist
    return 1
  fi
  xcrun simctl boot "$1"
  open -a Simulator
}

# Capturar screenshot do simulador
iosscreenshot() {
  local filename="${1:-screenshot-$(date +%Y%m%d-%H%M%S).png}"
  xcrun simctl io booted screenshot "$filename"
  echo "✓ Screenshot salvo: $filename"
}

# Gravar vídeo do simulador
iosrecord() {
  local filename="${1:-recording-$(date +%Y%m%d-%H%M%S).mov}"
  echo "🎥 Gravando... Pressione Ctrl+C para parar"
  xcrun simctl io booted recordVideo "$filename"
}

# Ver logs do simulador
ioslogs() {
  local bundle_id="$1"
  if [ -z "$bundle_id" ]; then
    echo "Usage: ioslogs <bundle-id>"
    echo "Example: ioslogs com.example.myapp"
    return 1
  fi
  xcrun simctl spawn booted log stream --predicate "processImagePath contains \"$bundle_id\""
}

# Resetar todos os simuladores
iosresetall() {
  echo "⚠️  Isso vai apagar TODOS os dados dos simuladores!"
  read "response?Continuar? (y/N): "
  if [[ "$response" =~ ^[Yy]$ ]]; then
    xcrun simctl shutdown all
    xcrun simctl erase all
    echo "✓ Todos os simuladores foram resetados"
  fi
}

# Setup inicial do projeto iOS Flutter
fliossetup() {
  echo "🔧 Configurando projeto iOS..."
  
  if [ ! -d "ios" ]; then
    echo "✗ Diretório ios não encontrado. Execute dentro de um projeto Flutter."
    return 1
  fi
  
  cd ios
  echo "📦 Instalando CocoaPods..."
  pod install
  cd ..
  
  echo "✓ Setup iOS completo!"
  echo "💡 Use 'flxcode' para abrir no Xcode"
}

# Flutter clean completo (incluindo iOS)
flnuke() {
  echo "💣 Executando limpeza completa..."
  flutter clean
  cd ios
  rm -rf Pods Podfile.lock .symlinks
  pod cache clean --all
  cd ..
  rm -rf ~/Library/Developer/Xcode/DerivedData/*
  echo "✓ Limpeza completa executada!"
}

# Checar problemas comuns do Flutter iOS
fldoctorio() {
  echo "🔍 Verificando configuração iOS..."
  echo ""
  echo "Flutter Doctor:"
  flutter doctor -v
  echo ""
  echo "CocoaPods:"
  pod --version
  echo ""
  echo "Xcode:"
  xcodebuild -version
  echo ""
  echo "Simuladores disponíveis:"
  ioslist
}

# Ver Bundle ID do app
flbundleid() {
  if [ -f "ios/Runner/Info.plist" ]; then
    /usr/libexec/PlistBuddy -c "Print :CFBundleIdentifier" ios/Runner/Info.plist
  else
    echo "Info.plist não encontrado"
  fi
}

# Alterar Bundle ID
flsetbundle() {
  if [ -z "$1" ]; then
    echo "Usage: flsetbundle <bundle-id>"
    echo "Example: flsetbundle com.exemplo.meuapp"
    return 1
  fi
  
  if [ -f "ios/Runner/Info.plist" ]; then
    /usr/libexec/PlistBuddy -c "Set :CFBundleIdentifier $1" ios/Runner/Info.plist
    echo "✓ Bundle ID alterado para: $1"
  else
    echo "Info.plist não encontrado"
  fi
}

# Build iOS com mais logs
fliosbuild() {
  flutter build ios --verbose
}
