#!/bin/sh

# 檢查 FLAG 變數是否存在
# $FLAG 是從 docker run 時傳入的環境變數,可以換成平台設定的變數名稱
# GZCTF為 GZCTF_FLAG
if [ ! -z "$FLAG" ]; then 
  # 將變數內容寫到 flag 檔案中
    # /home/ctf/flag 是預設 flag 檔案路徑
    echo "$FLAG" > /home/ctf/flag
fi  
chmod 640 /home/ctf/flag
export FLAG=flag{this_is_default_flag}
FLAG=flag{this_is_default_flag}
# Add your startup script

# DO NOT DELETE
/etc/init.d/xinetd start;
sleep infinity;
