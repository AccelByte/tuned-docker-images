FROM accelbyte/alpine:3.9
LABEL maintainer "operations@accelbyte.net"

ENV GOPATH="/opt/go/"
ENV PATH="/usr/local/go/bin:$PATH:$GOPATH/bin"

RUN apk add --no-cache --virtual .build-deps bash gcc musl-dev openssl go; \
    wget -O go.tar.gz https://dl.google.com/go/go<goversion>.src.tar.gz; \
    tar -xzvf go.tar.gz -C /usr/local; \
    cd /usr/local/go/src/; \
    ./make.bash; \
    apk del .build-deps; \
    go version; \
    cd /; \
    wget -O - -q \
	    https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh| \
	    sh -s v<linterversion>; \
	golangci-lint --version;

CMD ["go"]
