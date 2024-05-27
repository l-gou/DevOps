
# Stage 1: Build Main.java with JDK
FROM eclipse-temurin:17-jdk-alpine AS build
WORKDIR /usr/src
COPY Main.java .
RUN javac Main.java

# Stage 2: Run java code with the JRE
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=0 /usr/src/Main.class .
CMD ["java", "Main"]
