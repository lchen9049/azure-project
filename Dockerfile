FROM maven:3.8.4-openjdk-17 
MAINTAINER lc
COPY target/app-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]
EXPOSE 8080