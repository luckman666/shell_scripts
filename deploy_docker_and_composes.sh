#!/bin/bash
#luckman
#b8_yang@163.com
if [[ "$(whoami)" != "root" ]]; then
	echo "please run this script as root ." >&2
	exit 1
fi

echo -e "\033[31m 这个是安装docker和docker_compace的脚本，欢迎关注我的个人公众号“devops的那些事”获得更多实用工具！Please continue to enter or ctrl+C to cancel \033[0m"
sleep 5

#install docker
install_docker() {
	yum install -y yum-utils device-mapper-persistent-data lvm2
	 yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
	 yum-config-manager --enable docker-ce-edge
	yum-config-manager --enable docker-ce-test
	yum-config-manager --disable docker-ce-edge
	yum install docker-ce -y
	systemctl start docker
	systemctl enable docker
	echo "docker install succeed!!"
}
#install_docker_compace
install_docker_compace() {

curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose 
docker-compose --version
echo "docker-compose install succeed!!"
}

main(){

 install_docker
 install_docker_compace

}
main > ./setup.log 2>&1
