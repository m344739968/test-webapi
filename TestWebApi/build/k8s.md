# k8s部署项目步骤

# 创建一个命名空间
kubectl create namespace k8s-dotnet
# 创建deployment
kubectl create -f webapi-deployment.yaml
# 创建servcie
kubectl create -f webapi-service.yaml

# 查看k8s-dotnet命名空间下所有pod信息
kubectl get pod -o wide -n k8s-dotnet
# 查看k8s-dotnet命名空间下所有service信息
kubectl get svc -o wide -n k8s-dotnet
# 查看k8s-dotnet命名空间下所有webapi-deployment信息
kubectl describe pod webapi-deployment -n k8s-dotnet
# 查看k8s-dotnet命名空间下所有webapi-service信息
kubectl describe service webapi-service -n k8s-dotnet
# 修改webapi-deployment镜像
kubectl set image deployment/kubectl set image deployment/webapi-deployment registry.cn-shenzhen.aliyuncs.com/simon-dotnet/sz.webapi:registry.cn-shenzhen.aliyuncs.com/simon-dotnet/sz.webapi:v1.0.0 registry.cn-shenzhen.aliyuncs.com/simon-dotnet/sz.webapi:registry.cn-shenzhen.aliyuncs.com/simon-dotnet/sz.webapi:v1.0.1

# 删除命名空间下k8s-dotnet的webapi-deployment
kubectl delete deployment webapi-deployment -n k8s-dotnet
# 删除命名空间下k8s-dotnet的webapi-service
kubectl delete service webapi-service -n k8s-dotnet