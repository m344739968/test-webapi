#!/bin/bash

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
declare version=v1.0.1
declare imagefullname=${imagename}:${version}

rm -fr ${publishOutputDir}
mkdir -p ${publishOutputDir}
echo "开始编译项目"
dotnet publish ./TestWebApi.csproj -o ${publishOutputDir} -c release --no-restore
echo "编译完成"
echo "登录docker hub仓库地址, docker login --username=****** --password=*****"
docker login --username=mal_123456 --password=Mal@12315 ${registryHost}
echo "编译镜像"
docker build -t ${imagename}:${version} ${publishOutputDir}
docker tag ${imagename}:${version} ${registryHost}/${namespace}/${repository}:${version}
echo "推送镜像"
docker push ${registryHost}/${namespace}/${repository}:${version}
echo "发布镜像成功：${imagename}:${version}"
if [ $? -eq 0 ]; then
 echo "push Success"
else 
 echo "push failed"
fi
