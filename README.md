# ctf-nc-example
CTF 用的 nc 範例  

## 檔案架構
topic/ #自行更改名稱    
├── bin/  
│   ├── run.sh  **自行更改**  
│   └── 題目  **自行更改**  
├── start.sh ** 若 flag 檔名或路徑有修改 須在此設定 **
├── Dockerfile **自行更改**  
├── docker-compose.yml 如果不需要可以移除，**自行更改**  
└── ctf.xinetd 不要動!!  

請直接將題目資料夾壓縮成 zip 檔，不要再多一層資料夾  

## 如果只需要 Dockerfile
將題目需要的檔案放到 bin 下面
## 如果需要 Docker compose
將題目需要的檔案放到 bin 下面


## 建立 image
有 build_all.sh 以及 build_image.sh 兩個腳本  
- build_all.sh 會將所在目錄底下的題目資料夾都建立 image，需先將題目解壓縮並且只有一層資料夾  
- build_image.sh 為建立單一題目，`./build_image.sh <dockerfile_directory> <image_name>` <dockerfile_directory> <image_name> 皆相同即可  

## 平台
使用 GZCTF 時請將所有 FLAG 改為 GZCTF_FLAG