FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
MAINTAINER malei
WORKDIR /webapi
COPY . .
EXPOSE 80
ENTRYPOINT ["dotnet", "TestWebApi.dll"]