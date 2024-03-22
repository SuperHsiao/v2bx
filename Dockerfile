FROM alpine:latest

WORKDIR /app

COPY files/init.sh /app/init.sh

RUN apk update && \
    apk upgrade && \
    # Set timezone
    apk add --no-cache tzdata && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    apk add sudo bash wget curl nano unzip &&\
    chmod +x init.sh

CMD [ "./init.sh" ]
