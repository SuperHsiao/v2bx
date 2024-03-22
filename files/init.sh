#!/usr/bin/env bash

WORK_DIR=/app

mkdir -p "$WORK_DIR"/cert

# 检查处理器架构并设置 ARCH 变量
case $(uname -m) in
  aarch64|arm64 ) ARCH=arm64 ;;
  x86_64|amd64 ) ARCH=amd64 ;;
  armv7* ) ARCH=arm ;;
  * ) echo "Unsupported architecture!"; exit 1 ;;
esac

# 下载v2bx主程序
wget -qO "${WORK_DIR}/v2bx" "https://github.com/HW93207/upx/releases/download/v2bx/v2bx-${ARCH}"
chmod +x "${WORK_DIR}/v2bx"


# 运行 v2bx
if [ -f "${WORK_DIR}/config.json" ]; then
   nohup "${WORK_DIR}/v2bx" server --config "${WORK_DIR}/config.json" >> /dev/null 2>&1 &
fi

# 保持容器running状态
tail -f /dev/null
