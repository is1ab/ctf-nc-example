#!/bin/bash

# 检查是否传递了两个参数
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <dockerfile_directory> <image_name>"
  exit 1
fi

# 获取传递的参数
DOCKERFILE_DIR="$1"
IMAGE_NAME="$2"

# 检查 Dockerfile 目录是否存在
if [ ! -d "$DOCKERFILE_DIR" ]; then
  echo "Error: Directory '$DOCKERFILE_DIR' does not exist."
  exit 1
fi

# 构建 Docker 镜像
echo "Building Docker image '$IMAGE_NAME' from directory '$DOCKERFILE_DIR'..."
sudo docker build -t "$IMAGE_NAME" "$DOCKERFILE_DIR"

# 标记 Docker 镜像
echo "Tagging Docker image '$IMAGE_NAME'..."
sudo docker tag "$IMAGE_NAME" 127.0.0.1:5000/"$IMAGE_NAME"

# 推送 Docker 镜像
echo "Pushing Docker image '127.0.0.1:5000/$IMAGE_NAME'..."
sudo docker push 127.0.0.1:5000/"$IMAGE_NAME"

echo "Done!"
