# Stage 1: Build stage
FROM maven:3.8.6-amazoncorretto-17 AS build
# Set the working directory inside the container
WORKDIR /app
# Copy the Maven project descriptor file (pom.xml) to the working directory
COPY pom.xml /app
# Resolve and download project dependencies, caching them for future builds
RUN mvn dependency:go-offline
# Copy the application source code to the working directory
COPY src /app/src
# Package the application, skipping tests
RUN mvn package -DskipTests

# Stage 2: Run stage
# Use the Amazon Corretto 17 base image for the runtime environment
FROM amazoncorretto:17
# Set the working directory inside the container
WORKDIR /app
# Copy the built JAR file from the build stage to the runtime container
COPY --from=build /app/target/*.jar /app/app.jar
# Define the entry point for the container, which executes the JAR file
ENTRYPOINT ["java", "-jar", "app.jar"]
