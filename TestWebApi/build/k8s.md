运行几个 Pod
kubectl run hostnames --image=registry.cn-shenzhen.aliyuncs.com/simon-dotnet/sz.webapi:v1.0.0 \
                        --labels=app=hostnames \
                        --port=9376 \
                        --replicas=3
                        
Pods 是运行状态
kubectl get pods -l app=hostnames