# Étape de build
FROM maven:3.8.6-eclipse-temurin-17-alpine AS build
WORKDIR /app

# Copier les fichiers de configuration Maven pour télécharger les dépendances
COPY pom.xml .
COPY src ./src

# Compiler l'application
RUN mvn clean package -DskipTests

# Étape finale avec juste le JRE
FROM eclipse-temurin:17-jre-jammy

WORKDIR /app

# Copier le JAR de l'application depuis l'étape de build
COPY --from=build /app/target/*.jar app.jar

# Port sur lequel l'application sera exposée
ENV PORT=8080
EXPOSE ${PORT}


# Commande pour démarrer l'application
ENTRYPOINT ["sh", "-c", "java -jar app.jar --server.port=${PORT}"]