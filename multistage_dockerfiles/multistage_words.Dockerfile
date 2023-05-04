FROM ubuntu as builder
RUN apt-get update -y
RUN apt-get install -y maven openjdk-8-jdk

FROM alpine
COPY --from=builder . .
WORKDIR /repos/wordsmith/words/
COPY . /words/
RUN mvn verify      
CMD ["java", "-Xmx8m", "-Xms8m", "-jar", "target/words.jar"]

EXPOSE 8080
