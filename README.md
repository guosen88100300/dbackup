# MongoDBackupToOss.js 中 设置oss 秘钥

    //region: '<Your region>',
    //accessKeyId: '<Your AccessKeyId>',
    //accessKeySecret: '<Your AccessKeySecret>',
    //bucket:'<Your bucket>'
    
    var folder='mongodbackup';//设置oss中的存储目录
   
# MongoDBackup.sh中设置
     #备份工具位置
     DUMP=mongodump
     #node目录
     NODE=/usr/local/bin/node
     #备份输出位置
     OUT_DIR=/home/guosen/mongod_bak/mongod_bak_now
     # 备份完压缩包保存位置
     TAR_DIR=/home/guosen/mongod_bak/mongod_bak_list
     #mongodb
     DB_USER=你的mongodb用户名
  
     DB_PASS=你的mongodb密码
  
     #保留天数
     DAYS=7

#linux系统设置定时任务
 
    定时任务配置：0 3 * * * /dbackup/MongoDBackup.sh >/dev/null 2&>1
