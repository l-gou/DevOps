# Use an official OpenJDK runtime as a parent image
FROM openjdk:14-jdk-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the compiled Java class to the container
COPY ./Main.class .

# Command to run the Java program
CMD ["java", "Main"]
