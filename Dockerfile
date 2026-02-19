#build my app j2_g15
#FROM quay.io/snowdrop/maven-openjdk11 AS builder
FROM maven:3.9.6-eclipse-temurin-11 AS builder
WORKDIR /app
COPY . /app
RUN mvn clean install package


# deploy
FROM tomcat:9.0
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/app.war
