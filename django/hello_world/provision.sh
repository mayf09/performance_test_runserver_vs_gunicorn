#!/bin/sh

# 替换 Ubuntu 软件源
SOURCES_FILE='/etc/apt/sources.list'
SOURCES_ORIGIN_FILE='/etc/apt/sources.list.orig'
if [ ! -f ${SOURCES_ORIGIN_FILE} ]; then
    cp -v ${SOURCES_FILE} ${SOURCES_ORIGIN_FILE}
	echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse' > ${SOURCES_FILE}
    echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse' >> ${SOURCES_FILE}
	echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse' >> ${SOURCES_FILE}
	echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse' >> ${SOURCES_FILE}
	echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse' >> ${SOURCES_FILE}
    apt-get update
fi

# 安装依赖
apt update
apt install -y python-dev python-pip python-virtualenv

# 配置 PIP 软件源
PIP_CONFIG_FILE='/home/vagrant/.pip/pip.conf'
mkdir -p /home/vagrant/.pip
if [ ! -f ${PIP_CONFIG_FILE} ]; then
    echo '[global]' > ${PIP_CONFIG_FILE}
    echo 'index-url = https://mirrors.aliyun.com/pypi/simple/' >> ${PIP_CONFIG_FILE}
    echo '' >> ${PIP_CONFIG_FILE}
    echo '[install]' >> ${PIP_CONFIG_FILE}
    echo 'trusted-host=mirrors.aliyun.com' >> ${PIP_CONFIG_FILE}
fi

