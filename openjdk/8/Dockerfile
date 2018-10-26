FROM accelbyte/debian:stable

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update; \
    apt install -y openjdk-8-jdk

ENTRYPOINT ["java", "-jar"]
