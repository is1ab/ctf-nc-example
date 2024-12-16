# ctf-nc-example
CTF 用的 nc 範例  

## 檔案架構
topic/ #自行更改名稱    
├── bin/  
│   ├── run.sh #自行更改  
│   └── 題目 #自行更改  
├── start.sh #不要動!!  
├── Dockerfile #自行更改  
├── docker-compose.yml #如果不需要可以移除，自行更改  
└── ctf.xinetd #不要動!!  

請直接將題目資料夾壓縮成 zip 檔，不要再多一層資料夾  

## 建立 image
有 build_all.sh 以及 build_image.sh 兩個腳本  
- build_all.sh 會將所在目錄底下的題目資料夾都建立 image，需先將題目解壓縮並且只有一層資料夾  
- build_image.sh 為建立單一題目，`./build_image.sh <dockerfile_directory> <image_name>` <dockerfile_directory> <image_name> 皆相同即可  
