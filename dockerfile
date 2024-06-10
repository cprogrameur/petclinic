# Use a base image that includes JDK
FROM openjdk:17-jdk-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file from the target directory to the working directory
COPY target/*.jar /app/*.jar

# Expose the port your Spring Boot app runs on
EXPOSE 8080

# Set the entry point for the container to run the JAR file
ENTRYPOINT ["java", "-jar", "/app/*.jar"]
