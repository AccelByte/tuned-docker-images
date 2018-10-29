FROM accelbyte/debian:stable
LABEL maintainer "operations@accelbyte.net"

ENV DEBIAN_FRONTEND=noninteractive
ENV JAVA_HOME=/opt/jdk-9.0.4
ENV PATH=$JAVA_HOME/bin:$PATH

RUN curl -O https://download.java.net/java/GA/jdk9/9.0.4/binaries/openjdk-9.0.4_linux-x64_bin.tar.gz; \
    tar -xvf openjdk-9.0.4_linux-x64_bin.tar.gz -C /opt

COPY cacerts $JAVA_HOME/lib/security/
ENTRYPOINT ["java", "-jar"]
