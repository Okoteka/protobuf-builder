FROM golang:1.21-alpine AS builder

RUN go install \
    github.com/bufbuild/buf/cmd/buf@v1.28.1 \
    google.golang.org/protobuf/cmd/protoc-gen-go@v1.32.0 \
    google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.3.0 \
    github.com/envoyproxy/protoc-gen-validate@v0.10.1 \
    github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway@v2.18.0

FROM alpine:latest

COPY --from=builder /go/bin/* /usr/local/bin/

RUN apk add --no-cache \
    protobuf-dev \
    protobuf \
    libc6-compat

WORKDIR /workspace

CMD ["sh", "-c", "echo '=== Installed tools ===' && \
      protoc --version && \
      buf --version && \
      which protoc-gen-go && \
      which protoc-gen-go-grpc"]
