FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY target/webhook-trigger-v1.0-SNAPSHOT.jar app.jar
ENTRYPOINT [ "java", "-jar", "/app/app.jar"]
