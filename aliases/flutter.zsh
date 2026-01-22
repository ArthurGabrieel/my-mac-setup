# ============================================================================
# FLUTTER & iOS ALIASES
# ============================================================================

# Flutter: Básico
alias fl='flutter'
alias flr='flutter run'
alias flrd='flutter run --debug'
alias flrr='flutter run --release'
alias flb='flutter build'
alias flba='flutter build apk'
alias flbaa='flutter build appbundle'
alias flbi='flutter build ios'
alias flp='flutter pub'
alias flpg='flutter pub get'
alias flpu='flutter pub upgrade'
alias flpo='flutter pub outdated'
alias flc='flutter clean'
alias fld='flutter doctor'
alias fldv='flutter doctor -v'
alias flt='flutter test'
alias fla='flutter analyze'
alias flf='flutter format'
alias fldev='flutter devices'
alias flcg='flutter create'
alias flhot='flutter run --hot'

# Flutter: iOS
alias flios='flutter run -d iphone'
alias flipad='flutter run -d ipad'
alias fliosdev='flutter run --debug -d iphone'
alias fliosrel='flutter run --release -d iphone'
alias flbios='flutter build ios'
alias flbiosrel='flutter build ios --release'
alias flbiosdebug='flutter build ios --debug'
alias flxcode='open ios/Runner.xcworkspace'
alias flxproj='open ios/Runner.xcodeproj'

# CocoaPods
alias pod='pod'
alias pi='pod install'
alias pu='pod update'
alias pru='pod repo update'
alias poutdated='pod outdated'
alias psearch='pod search'
alias pclean='rm -rf Pods/ Podfile.lock && pod install'
alias pdeint='pod deintegrate'
alias pcache='rm -rf ~/Library/Caches/CocoaPods'

# Simulador iOS
alias simlist='xcrun simctl list devices'
alias simboot='xcrun simctl boot'
alias simshutdown='xcrun simctl shutdown all'
alias simerase='xcrun simctl erase all'
alias simopen='open -a Simulator'

# Xcode
alias xbuild='xcodebuild -workspace ios/Runner.xcworkspace -scheme Runner -configuration Debug build'
alias xclean='xcodebuild -workspace ios/Runner.xcworkspace -scheme Runner clean'
alias xarchive='xcodebuild -workspace ios/Runner.xcworkspace -scheme Runner archive'
alias xderived='rm -rf ~/Library/Developer/Xcode/DerivedData/*'
alias xcleanall='rm -rf ~/Library/Developer/Xcode/DerivedData/* && flutter clean && cd ios && pod deintegrate && pod install && cd ..'

# Workflows Flutter iOS
alias fliosfirst='fliossetup && flxcode'
alias fliosfix='flnuke && fliossetup && fliosbuild'
alias flioupdate='cd ios && pod update && cd .. && flios'
alias flboth='flios & flipad'
alias flrelease='flutter clean && flutter build ios --release && flxcode'
