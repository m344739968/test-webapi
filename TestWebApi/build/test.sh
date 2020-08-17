#!/bin/bash

echo 创建一个deployment
kubectl create namespace k8s-dotnet
kubectl create -f webapi-deployment.yaml
kubectl create -f webapi-service.yaml

kubectl get pod -o wide -n k8s-dotnet
kubectl get svc -o wide -n k8s-dotnet
kubectl describe pod  webapi-deployment -n k8s-dotnet
kubectl describe service  webapi-service -n k8s-dotnet

kubectl set image deployment/kubectl set image deployment/webapi-deployment registry.cn-shenzhen.aliyuncs.com/simon-dotnet/sz.webapi:registry.cn-shenzhen.aliyuncs.com/simon-dotnet/sz.webapi:v1.0.0 registry.cn-shenzhen.aliyuncs.com/simon-dotnet/sz.webapi:registry.cn-shenzhen.aliyuncs.com/simon-dotnet/sz.webapi:v1.0.1

kubectl delete deployment webapi-deployment -n k8s-dotnet
kubectl delete service webapi-service -n k8s-dotnet

curl 10.1.0.82:19092/WeatherForecast