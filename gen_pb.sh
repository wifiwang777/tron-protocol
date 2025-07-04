#!/bin/sh

PROTO_PATH="./"
OUTPUT_DIR="./protos"
GOOGLEAPIS_PATH="/Users/wangfeng/code/protocol-buffer/googleapis"
mkdir -p "$OUTPUT_DIR"

# 遍历所有 .proto 文件并编译
for proto_file in $(find "$PROTO_PATH" -name "*.proto"); do
    echo "Compiling: $proto_file"
    protoc  -I . \
            -I $GOOGLEAPIS_PATH \
            --go_out=./protos \
            --go_opt=paths=source_relative \
            --go-grpc_out=./protos \
            --go-grpc_opt=paths=source_relative \
            "$proto_file"
done