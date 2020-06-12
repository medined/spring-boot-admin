# Run-time image that makes the final image
FROM gcr.io/distroless/java:11
COPY build/libs/spring-boot-admin-2.2.3.jar /app/app.jar
EXPOSE 8080

# When using distroless, entrypoint must be in vector form.
ENTRYPOINT ["java","-jar","/app/app.jar"]
