#!/bin/bash

# 创建目录
mkdir -p /home/return2002

# 进入目录
cd /home/return2002

sudo docker pull jupyter/base-notebook

# 提示用户输入端口号
read -p "请输入宿主端口号（格式为宿主机端口:容器端口）: " PORT
sudo docker run --name jupyter -d -p $PORT:8888 -v /home/return2002/notebooks:/home/ds/notebooks jupyter/base-notebook

docker exec -it jupyter pip install ipywidgets

docker exec -it jupyter jupyter notebook password
docker restart jupyter
