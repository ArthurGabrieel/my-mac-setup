# ============================================================================
# JAVA / SPRING BOOT ALIASES
# ============================================================================

# Maven
alias mvn='./mvnw'
alias mvnc='./mvnw clean'
alias mvni='./mvnw install'
alias mvnci='./mvnw clean install'
alias mvnp='./mvnw package'
alias mvncp='./mvnw clean package'
alias mvnt='./mvnw test'
alias mvnct='./mvnw clean test'
alias mvnr='./mvnw spring-boot:run'
alias mvnskip='./mvnw clean install -DskipTests'

# Gradle
alias gw='./gradlew'
alias gwc='./gradlew clean'
alias gwb='./gradlew build'
alias gwcb='./gradlew clean build'
alias gwt='./gradlew test'
alias gwct='./gradlew clean test'
alias gwr='./gradlew bootRun'
alias gwskip='./gradlew build -x test'

# Spring Boot
alias springrun='./mvnw spring-boot:run'
alias springdev='./mvnw spring-boot:run -Dspring-boot.run.profiles=dev'
alias springtest='./mvnw spring-boot:run -Dspring-boot.run.profiles=test'

# Java/JDK
alias j='java'
alias jv='java -version'
alias jc='javac'
alias jenv-list='jenv versions'
alias jenv-global='jenv global'
alias jenv-local='jenv local'
alias jenv17='jenv global 17'
alias jenv21='jenv global 21'
alias jenv11='jenv global 11'
