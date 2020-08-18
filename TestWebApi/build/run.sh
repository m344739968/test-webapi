#!/bin/bash

echo "拉取镜像"
docker pull registry.cn-shenzhen.aliyuncs.com/simon-dotnet/sz.webapi:v1.0.1
echo "运行容器"
docker run -p 8077:80 --name webapi -d registry.cn-shenzhen.aliyuncs.com/simon-dotnet/sz.webapi:v1.0.1