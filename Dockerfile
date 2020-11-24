FROM openjdk:8

RUN curl -OL https://github.com/monodot/hello-java/raw/master/bin/hello-java-1.0.0-SNAPSHOT.jar

CMD ["java", "-jar", "hello-java-1.0.0-SNAPSHOT.jar"]

