FROM ubuntu

RUN apt-get update -y
RUN apt-get install -y maven openjdk-8-jdk

COPY . /words/
WORKDIR /words/

RUN mvn verify
CMD ["java", "-Xmx8m", "-Xms8m", "-jar", "target/words.jar"]

EXPOSE 8080
