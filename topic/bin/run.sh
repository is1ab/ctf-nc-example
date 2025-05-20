#!/bin/sh

cd /home/ctf
exec 2>/dev/null
timeout 60 pwd  # 在此設定要執行的指令，只需要替換 pwd
# 檔案路徑為 /home/ctf/檔案
# timeout 60 ./bin
