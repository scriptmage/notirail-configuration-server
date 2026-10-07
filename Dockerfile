# Build stage
FROM eclipse-temurin:25-jdk AS build

WORKDIR /app

COPY gradlew .
COPY gradle ./gradle
COPY build.gradle.kts settings.gradle.kts ./

RUN chmod +x gradlew
RUN ./gradlew dependencies --no-daemon

COPY src ./src
RUN ./gradlew bootJar --no-daemon

# Runtime stage
FROM eclipse-temurin:25-jre-noble

WORKDIR /app

RUN addgroup --system app \
    && adduser --system --ingroup app app

COPY --from=build /app/build/libs/*.jar app.jar

RUN chown app:app app.jar

USER app

EXPOSE 8888

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
