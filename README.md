# Protobuf CI Tools Docker Image

A lightweight Docker image containing essential tools for Protocol Buffers (protobuf) code generation and validation in CI/CD pipelines.

# Image Contents

## Core Tools

    protoc (Protocol Buffers Compiler) - Official protobuf compiler

    buf (v1.28.1) - Modern protobuf linting, breaking change detection, and generation

    protoc-gen-go - Go protobuf code generator

    protoc-gen-go-grpc - Go gRPC code generator

    protoc-gen-validate - Generate validation code from protobuf annotations

    protoc-gen-grpc-gateway - Generate gRPC-Gateway reverse proxy from protobuf

## Base Image

    Alpine Linux (latest) - Minimal and secure

    Go 1.21 (builder stage only) - For compiling tools
