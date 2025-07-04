#!/bin/sh

PROTO_PATH="./"
OUTPUT_DIR="./protos"
GOOGLEAPIS_PATH="/Users/wangfeng/code/protocol-buffer/googleapis"
mkdir -p "$OUTPUT_DIR"

# 遍历所有 .proto 文件并编译
for proto_file in $(find "$PROTO_PATH" -name "*.proto"); do
    echo "Compiling: $proto_file"
    protoc  -I ./ \
            -I $GOOGLEAPIS_PATH \
            --proto_path="$PROTO_PATH" \
            --go_out="$OUTPUT_DIR" \
            "$proto_file"
done