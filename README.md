# BackupToOss.js 中 设置oss 秘钥

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

#ssh免密登录配置

     ssh免密登录-------start---------------------------------
     1客户端生成公钥：ssh-keygen -t rsa
     2上传公钥到ssh服务端,并追加入.ssh/authorized_keys 中
     3设置权限：服务端 .ssh chmod 设为700 authorized_keys 设为600
     4---客户端执行： eval "$(ssh-agent -s)"
     5---客户端执行：ssh-add
     6 客户端测试ssh与scp是否免密
     ssh免密登录-------end---------------------------------------
