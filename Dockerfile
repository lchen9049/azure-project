FROM maven:3.8.4-openjdk-17 AS builder
WORKDIR /app/source
COPY . /app/source
RUN mvn clean package

FROM openjdk:17
COPY --from=builder /app/source/target/*.jar /app/app.jar
EXPOSE 8000
ENTRYPOINT ["java", "-cp", "/app/app.jar", "com.example.App"]
CMD [ "-i" ]

LABEL maintainer="Test1" description="Test" version="1.0"
