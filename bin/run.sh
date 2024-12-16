#!/bin/sh

exec 2>/dev/null
timeout 60 python3 /home/ctf/topic  # 在此設定要執行的指令
# 檔案路徑為 /home/ctf/檔案
# timeout 60 ./home/ctf/bin
