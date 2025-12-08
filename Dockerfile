FROM golang:1.24-alpine AS builder

RUN go install github.com/bufbuild/buf/cmd/buf@v1.28.1

RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
RUN go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
RUN go install github.com/envoyproxy/protoc-gen-validate@v0.10.1
RUN go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway@v2.18.0

FROM alpine:latest

COPY --from=builder /go/bin/* /usr/local/bin/

RUN apk add --no-cache protobuf-dev protobuf libc6-compat

# Install task runner
RUN curl -sSL https://taskfile.dev/install.sh | sh -s -- -b /usr/local/bin

WORKDIR /workspace

CMD ["sh", "-c", "echo '=== Installed tools ===' && \
      protoc --version && \
      buf --version && \
      which protoc-gen-go && \
      which protoc-gen-go-grpc"]
