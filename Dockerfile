FROM golang:alpine3.15 AS builder

COPY hello /go/src/hello

WORKDIR /go/src/hello

RUN go env -w GO111MODULE=off && \
    go build && \
    go install

##

FROM scratch

WORKDIR /go

COPY --from=builder /go .

CMD ["/go/bin/hello"]


