#!/bin/bash
LANG=en_US.UTF-8

apt-get 2> /tmp/check_pkgmgmt

	if [[ `(grep "not" /tmp/check_pkgmgmt)` != "" ]];then
		Pkg_mgmt="yum"
	else
		Pkg_mgmt="apt-get"
		apt update
	fi

$Pkg_mgmt install curl -y
$Pkg_mgmt install wget -y
$Pkg_mgmt install vim -y


mkdir -p /root/.ssh
cp -Rfv /tmp/conf.d/* /root/.ssh
