#!/bin/sh
#定时任务配置：*/5 * * * * /home/guosen/MonoDBackup.sh >/dev/null 2>&1
#
#上传到oss请到MongoDBackUpToOss.js中设置阿里云秘钥空间名.
#
DUMP=mongodump

NODE=/usr/local/bin/node

OUT_DIR=/home/guosen/mongod_bak/mongod_bak_now

TAR_DIR=/home/guosen/mongod_bak/mongod_bak_list

#Server=guosen@192.168.12.73

DATE=`date +"%F%H%M%S"`

JSDir=$(cd "$(dirname "$0")"; pwd)

DB_NAME=你要备份的库名

DB_USER=你的mongodb用户名

DB_PASS=你的mongodb密码

DAYS=7

TAR_BAK="mongod_bak_$DATE.tar.gz"


cd $OUT_DIR

rm -rf $OUT_DIR/*

mkdir -p $OUT_DIR/$DATE

#$DUMP -u $DB_USER -p $DB_PASS -d $DB_NAME -o $OUT_DIR/$DATE
$DUMP -d $DB_NAME -o $OUT_DIR/$DATE

tar -zcvf $TAR_DIR/$TAR_BAK $OUT_DIR/$DATE

#ssh-add

#scp $TAR_DIR/$TAR_BAK $Server:

cd $JSDir

echo $NODE BackUpToOss.js $TAR_DIR/$TAR_BAK $TAR_BAK
$NODE BackUpToOss.js $TAR_DIR/$TAR_BAK $TAR_BAK

find $TAR_DIR/* -mtime +$DAYS -delete

