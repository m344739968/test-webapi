#!/bin/bash

# 以阿里云镜像仓库为示例
#1. 编译项目
#2. 构建镜像
#3. tag镜像版本
#4. 推送到镜像仓库
echo "build testwebapi"
# global environment variable
declare -r registryHost=registry.cn-shenzhen.aliyuncs.com
declare -r namespace=simon-dotnet
declare -r repository=sz.webapi
declare publishOutputDir=./publish
declare imagename=webapi
declare version=v1.0.0
declare imagefullname=${imagename}:${version}

echo "build solution..."
dotnet build TestWebApi.sln

rm -fr ${publishOutputDir}
mkdir -p ${publishOutputDir}
echo "publish solution..."
dotnet publish ./TestWebApi/TestWebApi.csproj -o ${publishOutputDir} -c release --no-restore
# echo "登录docker hub仓库地址, docker login --username=****** --password=*****"
# echo "编译镜像"
docker build -t ${registryHost}/${namespace}/${repository}:${version} ${publishOutputDir}
# docker tag ${imagename}:${version} ${registryHost}/${namespace}/${repository}:${version}
# echo "推送镜像"
docker push ${registryHost}/${namespace}/${repository}:${version}
echo "images version:${imagename}:${version}"
if [ $? -eq 0 ]; then
 echo "push Success"
else 
 echo "push failed"
fi
