FROM openjdk:8-jdk-alpine as build

COPY .gradle/     /app/.gradle/
COPY gradle/      /app/gradle/
COPY build.gradle /app/build.gradle
COPY gradlew      /app/gradlew
WORKDIR /app

RUN ./gradlew wrapper && \
    ./gradlew dependencies

COPY Dockerfile   /app/Dockerfile
COPY src/         /app/src/

RUN ./gradlew bootJar

#
# Using a distroless base reduced the image size
# from 415MB to 235MB
#

FROM gcr.io/distroless/java:11
ARG JARNAME=spring-boot-admin-2.2.3
ARG PORT=8080
COPY --from=build /app /app
WORKDIR /app
EXPOSE ${PORT}
ENTRYPOINT ["java","-jar","/app/build/libs/${JARNAME}.jar"]
