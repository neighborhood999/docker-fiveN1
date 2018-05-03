FROM golang:alpine

WORKDIR /go/src/fiveN1

RUN set -ex; \
    apk add --no-cache curl git && \
    curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh && \
    dep version

ADD Gopkg.lock .
ADD Gopkg.toml .
ADD main.go .

RUN dep ensure -v -vendor-only && \
    go install -v ./...

CMD ["fiveN1"]
