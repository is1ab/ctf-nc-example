#!/bin/bash

# 定义颜色
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # 没有颜色

# 遍历当前目录下的每个子目录
for dir in */; do
  # 去掉目录末尾的斜杠
  dir=${dir%/}

  # 检查是否存在 Dockerfile
  if [ -f "$dir/Dockerfile" ]; then
    # 生成镜像名称（小写，空格改为下划线）
    image_name=$(echo "$dir" | tr '[:upper:]' '[:lower:]' | tr ' ' '_')

    # 构建 Docker 镜像
    if sudo docker build -t "$image_name" "$dir" > /dev/null 2>&1; then
      echo -e "${GREEN}Successfully built Docker image '$image_name' from directory '$dir'.${NC}"
    else
      echo -e "${RED}Error: Failed to build Docker image '$image_name' from directory '$dir'.${NC}"
      continue
    fi

    # 标记 Docker 镜像
    if sudo docker tag "$image_name" 127.0.0.1:5000/"$image_name" > /dev/null 2>&1; then
      echo -e "${GREEN}Successfully tagged Docker image '$image_name'.${NC}"
    else
      echo -e "${RED}Error: Failed to tag Docker image '$image_name'.${NC}"
      continue
    fi

    # 推送 Docker 镜像
    if sudo docker push 127.0.0.1:5000/"$image_name" > /dev/null 2>&1; then
      echo -e "${GREEN}Successfully pushed Docker image '127.0.0.1:5000/$image_name'.${NC}"
    else
      echo -e "${RED}Error: Failed to push Docker image '127.0.0.1:5000/$image_name'.${NC}"
    fi

  else
    echo "No Dockerfile found in directory '$dir'. Skipping..."
  fi
done
