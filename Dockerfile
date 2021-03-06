FROM maven:3.6.3-openjdk-11-slim AS build
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package

FROM openjdk:11-slim AS app
COPY --from=build /usr/src/app/target/resume-0.0.1-SNAPSHOT.jar /usr/app/resume-0.0.1-SNAPSHOT.jar
EXPOSE 8081
ENTRYPOINT ["java","-jar","/usr/app/resume-0.0.1-SNAPSHOT.jar"]