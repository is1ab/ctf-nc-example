# ctf-nc-example
CTF 用的 nc 範例  

## 檔案架構
topic/ #自行更改名稱    
├── bin/  
│   ├── run.sh #執行檔，修改此檔案來設定要執行的指令
│   └── 題目 #自行更改  
├── start.sh #** 若 flag 檔名或路徑有修改 須在此設定 **
├── Dockerfile #自行更改  
├── docker-compose.yml #如果不需要可以移除，自行更改  
└── ctf.xinetd #不要動!!  

## 使用說明

### 1. 修改題目
1. 將您的題目檔案放在 `topic/bin/` 目錄下
2. 修改 `topic/bin/run.sh`：
   - 將 `pwd` 替換為您要執行的指令
   - 確保指令路徑正確（預設工作目錄為 `/home/ctf`）
   - 例如：`timeout 60 ./bin/your_program`

### 2. 構建映像檔
有兩種方式可以構建映像檔：

#### 方式一：使用 build_all.sh
- 將所有題目資料夾解壓縮到當前目錄，並且只有一層資料夾 
- 執行：
  ```bash
  chmod +x build_all.sh
  ./build_all.sh
  ```

#### 方式二：使用 build_image.sh（單一題目）
- 執行：
  ```bash
  chmod +x build_image.sh
  ./build_image.sh <dockerfile_directory> <image_name>
  # <dockerfile_directory> <image_name> 皆相同即可 
  ```
- 例如：
  ```bash
  ./build_image.sh topic topic
  ```

 
## 注意事項
1. 請直接將題目資料夾壓縮成 zip 檔，不要再多一層資料夾
2. 確保題目檔案具有執行權限
3. 預設工作目錄為 `/home/ctf`
4. 執行時間限制為 60 秒