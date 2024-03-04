FROM maven:3.8.4-openjdk-17 AS builder
WORKDIR /app/source
COPY . /app/source
RUN mvn clean package

FROM openjdk:17
COPY --from=builder /app/source/target/*.jar app.jar
EXPOSE 80
ENTRYPOINT ["java","-jar","app.jar"]

LABEL maintainer="Test1" description="Test" version="1.0"