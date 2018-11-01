FROM accelbyte/golang:<goversion>
LABEL maintainer "operations@accelbyte.net"

ENV PATH="${GOPATH}/bin:${PATH}"
ENV GOBIN="${GOPATH}/bin"

RUN apk --update add --no-cache \
    ca-certificates bash httpry make git curl rhash unzip libc6-compat openjdk8-jre

RUN curl -L https://github.com/docker/compose/releases/download/1.23.0/docker-compose-`uname -s`-`uname -m` \
    -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

RUN curl -L https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.2.0.1227-linux.zip -o sonar-scanner.zip && \
    unzip -q sonar-scanner.zip && \
    rm sonar-scanner.zip && \
    mv sonar-scanner-3.2.0.1227-linux sonar && \
    sed -i 's/use_embedded_jre=true/use_embedded_jre=false/g' sonar/bin/sonar-scanner

RUN go get -u github.com/AccelByte/abgocyclo && \
	go get -u github.com/golang/dep/cmd/dep && \
	go get -u github.com/derekparker/delve/cmd/dlv && \
    go get github.com/axw/gocov/... && \
	go get github.com/AlekSi/gocov-xml && \
	go get -u github.com/jstemmer/go-junit-report

CMD []
ENTRYPOINT []
