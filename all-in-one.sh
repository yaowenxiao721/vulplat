#!/bin/bash

# 解压文件
tar -zxvf vulplat-docker-install.tar.gz

# 离线安装 docker 和 docker-compose
cd vulplat-docker-install/docker

sh install.sh docker-26.0.0.tgz

# 载入镜像并运行

cd ../vulplat
docker load -i vulplat-images.tar

docker-compose up -d

docker exec -it webserver opencve upgrade-db

docker ps