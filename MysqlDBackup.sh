#!/bin/sh
#定时任务配置：*/5 * * * * /home/dbackup/MysqlDBackup.sh >/dev/null 2>&1
#
#上传到oss请到BackUpToOss.js中设置阿里云秘钥空间名.
#

#node 路径
NODE=/usr/local/bin/node

#备份文件存储位置
OUT_DIR=/home/mysqlbackup/now

#备份压缩包本地存储位置
TAR_DIR=/home/mysqlbackup/list

DATE=`date +"%F%H-%M-%S"`

JSDir=$(cd "$(dirname "$0")"; pwd)

#备份文件本地保存天数
DAYS=7

TAR_BAK="mysql_bak_$DATE.tar.gz"

cd $OUT_DIR

rm -rf $OUT_DIR/*

mkdir -p $OUT_DIR/$DATE

# MySqlContainerName mysql容器名字
# username 数据库用户名
# password 数据库密码
# databaseName 需要备份的库 databaseName or databaseName1 databaseName1 databaseName1 。。。。
# filename 备份文件的名字
# docker run --rm --name mysqlbackup --link MySqlContainerName:mysqlbk -w /home mysql:5.7.19 mysqldump -h mysqlbk -uusername -ppassword --databases databaseName > $DATE/filename.sql
#
docker run --rm --name mysqlbackup --link MySqlContainerName:mysqlbk -w /home mysql:5.7.19 mysqldump -h mysqlbk -uusername -ppassword --databases databaseName > $DATE/filename.sql

tar -zcvf $TAR_DIR/$TAR_BAK $OUT_DIR/$DATE

cd $JSDir

echo $NODE BackUpToOss.js $TAR_DIR/$TAR_BAK $TAR_BAK

$NODE BackUpToOss.js $TAR_DIR/$TAR_BAK $TAR_BAK

find $TAR_DIR/* -mtime +$DAYS -delete
