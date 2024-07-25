#!/bin/bash

# 创建目录
mkdir -p /etc/alist

# 进入目录
cd /etc/alist || exit

# 提示用户输入端口号
read -p "请输入宿主端口号（格式为宿主机端口:容器端口）: " PORT

# 创建 docker-compose.yml 文件并写入内容，替换端口部分为用户输入的值
cat <<EOF > docker-compose.yml
version: '3.3'
services:
  alist:
    image: 'xhofe/alist:main'
    container_name: alist
    volumes:
      - '/etc/alist:/opt/alist/data'
    ports:
      - '$PORT:5244'
    environment:
      - PUID=0
      - PGID=0
      - UMASK=022
    restart: unless-stopped
EOF

echo "docker-compose.yml 文件已创建，并使用端口号 $PORT"

docker-compose up -d
