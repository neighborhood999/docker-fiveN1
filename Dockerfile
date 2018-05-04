# BUILD STAGE
FROM golang:alpine AS builder

WORKDIR /go/src/fiveN1

RUN set -ex; \
    apk add --no-cache curl git && \
    curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh && \
    dep version

COPY . /go/src/fiveN1/

RUN dep ensure -v -vendor-only && \
    CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

# FINAL STAGE
FROM alpine

RUN apk --no-cache add ca-certificates

WORKDIR /root/

COPY --from=builder /go/src/fiveN1/app .

CMD ["./app"]
