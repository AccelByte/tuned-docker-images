FROM accelbyte/debian:stable
LABEL maintainer "operations@accelbyte.net"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update; \
    apt install -y openjdk-8-jdk

ENTRYPOINT ["java", "-jar"]
