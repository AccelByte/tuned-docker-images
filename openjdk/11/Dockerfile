FROM accelbyte/debian:stable

ENV DEBIAN_FRONTEND=noninteractive
ENV JAVA_HOME=/opt/jdk-11.0.1
ENV PATH=$JAVA_HOME/bin:$PATH

RUN curl -O https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_linux-x64_bin.tar.gz; \
    tar -xvf openjdk-11.0.1_linux-x64_bin.tar.gz -C /opt

ENTRYPOINT ["java", "-jar"]
