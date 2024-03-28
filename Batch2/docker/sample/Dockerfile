FROM alpine
RUN apk update && \
    apk add dotnet7-sdk && \
    apk add openjdk17
ARG SPC_URL=https://khajareferenceapps.s3.ap-south-1.amazonaws.com/spring-petclinic-3.2.0-SNAPSHOT.jar
ADD  ${SPC_URL} /spring-petclinic.jar
ENV DEBUG_LEVEL=INFO
EXPOSE 8080
CMD ["java", "-jar", "/spring-petclinic.jar"]
