# Use small JRE image for runtime
FROM eclipse-temurin:17-jre-alpine as runtime

# Optional: create a non-root user
RUN addgroup -S app && adduser -S app -G app

WORKDIR /app

# Copy the JAR built by Maven (adjust the name if your artifact-version differs)
# By default Maven creates target/demo-app-1.0-SNAPSHOT.jar with your given pom.xml
ARG JAR_FILE=target/demo-app-1.0-SNAPSHOT.jar
COPY ${JAR_FILE} app.jar

USER app

EXPOSE 8080

ENTRYPOINT ["java","-jar","/app/app.jar"]
