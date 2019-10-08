#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

# 安装wget
yum -y install wget

# 下载莱特币安装包
wget https://download.litecoin.org/litecoin-0.17.1/linux/litecoin-0.17.1-x86_64-linux-gnu.tar.gz

# 解包
tar -zvxf litecoin-0.17.1-x86_64-linux-gnu.tar.gz

# 安装在bin目录下
install -m 0755 -o root -g root -t /usr/local/bin ./litecoin-0.17.1/bin/*

# 在根目录创建配置文件目录
mkdir ~/.litecoin

# 创建目录
mkdir /www/coin/ltc_data

# 创建配置文件
touch ~/.litecoin/litecoin.conf
# 写入文件
cat>>~/.litecoin/litecoin.conf<<EOF
server=1
daemon=1
rpcuser=rpcuserabc
rpcpassword=www123123
rpcallowip=127.0.0.1
rpcport=9332
datadir=/www/coin/ltc_data
EOF

# 启动LTC
/usr/local/bin/litecoind &
