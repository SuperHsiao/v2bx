#!/usr/bin/env bash

# 设置工作目录
WORK_DIR=/app

# 判断处理器架构
case $(uname -m) in
  aarch64|arm64 ) ARCH=arm64 ;;
  x86_64|amd64 ) ARCH=amd64 ;;
  armv7* ) ARCH=arm ;;
  * ) error " $(text 2) "
esac

# 下载v2bx主程序
wget -qO ${WORK_DIR}/v2bx  https://github.com/HW93207/upx/releases/download/v2bx/v2bx-{$ARCH}
chmod  +x ${WORK_DIR}/v2bx

# 运行v2bx
if [ -f "${WORK_DIR}/config.json" ]; then
   nohup ${WORK_DIR}/v2bx server --config ${WORK_DIR}/config.json &
fi
