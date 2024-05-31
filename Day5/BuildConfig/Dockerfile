FROM registry.access.redhat.com/ubi8/openjdk-11 as builder
RUN mkdir /home/jboss/myproject
WORKDIR /home/boss/myproject
COPY pom.xml .
COPY src .
RUN mvn clean package

FROM registry.access.redhat.com/ubi8/openjdk-11
COPY --from=builder /home/jboss/myproject/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT [ "java", "-jar", "app.jar" ]
