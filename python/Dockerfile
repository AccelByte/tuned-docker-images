ARG BUILD_VERSION

FROM python:${BUILD_VERSION}
LABEL maintainer "operations@accelbyte.net"

ENV LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    ENV=/etc/profile \
    HOME=/srv

RUN apk add --update --no-cache \
      ca-certificates \
      curl \
      vim \
      bind-tools \
      tcpdump \
      netcat-openbsd \
      httpry \
      rhash; \
    chmod a+s /usr/sbin/httpry; \
    help=/etc/profile; \
    echo "echo '=========================[ Troubleshooting ]=============================='" >> $help; \
    echo "echo 'httpry tcp 8080                  Sniff HTTP requests to container         '" >> $help; \
    echo "echo 'httpry tcp 8080|grep -v <path>   Exclude an HTTP URL path in output       '" >> $help; \
    echo "echo 'httpry tcp 8080|grep <path>      Only include an HTTP URL path in output  '" >> $help; \
    echo "echo 'curl -k https://<host>           Test HTTPS URL w/o cert chain validation '" >> $help; \
    echo "echo 'nc <host>:<port>                 Test TCP connectivity                    '" >> $help; \
    echo "echo 'ps -or- top                      Show processes running in container      '" >> $help; \
    echo "echo '=========================================================================='" >> $help;
