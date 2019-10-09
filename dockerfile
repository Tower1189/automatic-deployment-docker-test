# FROM node:latest

# RUN apt-get update \
#     && apt-get install -y nginx
FROM dockerfile_mypage:2

# 工作目录
WORKDIR /app

# 复制文件目录
COPY . /app/

# 暴露的端口号
EXPOSE 80

# 下载依赖及构建
RUN  export NG_CLI_ANALYTICS=false \
     && cnpm install \
     && cnpm run build \
     && cp -r dist/my-app/* /var/www/html \
     && rm -rf /app

# 启动nginx，关闭守护式运行，否则容器启动后会立刻关闭
CMD ["nginx","-g","daemon off;"]

