#!/bin/bash

cd /

# 克隆 GitHub 仓库到 chat-tts-ui 目录
git clone https://github.com/jianchang512/ChatTTS-ui.git app

# 进入 app 目录
cd app

# 使用 docker-compose.cpu.yaml 文件启动容器
docker compose -f docker-compose.cpu.yaml up -d
