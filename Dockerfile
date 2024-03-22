FROM alpine:latest

WORKDIR /app

COPY files/* /app/*

RUN apk update && \
    apk upgrade && \
    # Set timezone
    apk add --no-cache tzdata && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    apk add sudo bash wget nano &&\
    chmod +x init.sh

CMD [ "./init.sh" ]
