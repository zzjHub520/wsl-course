#! /bin/bash
sudo apt update  # 更新
sudo apt upgrade -y # 升级

sudo apt-get install xfce4 xfce4-goodies -y

sudo apt-get install xrdp -y
# 复制一份备用
sudo cp /etc/xrdp/xrdp.ini /etc/xrdp/xrdp.ini.bak
# 配置端口 3389 改为 3390，避免和windows的端口冲突
sudo sed -i 's/3389/3390/g' /etc/xrdp/xrdp.ini
# max_bpp=32 修改为 128（最大位图深度）
sudo sed -i 's/max_bpp=32/#max_bbp=32\nmax_bpp=128/g' /etc/xrdp/xrdp.ini
# #xserverbpp=24 修改为 128，取消注释 #
sudo sed -i 's/xservervpp=24/#xservervpp=24\nxserverbpp=128/g' /etc/xrdp/xrdp.ini
# 告诉系统: 开启桌面环境的时候用xfce4-session
sudo echo xfce4-session > ~/.xsession

function editOnlyOneLine(){
	FILENAME=$1
	KEYLINE=$2
	REPLACELINE=$3

	if [ `sed -n '/'"$KEYLINE"'/p' $FILENAME | wc -l` -gt 0 ];then
		sed -i '/'"$KEYLINE"'/c\'"$REPLACELINE"' ' $FILENAME
	else
		sed -i '$a\'"$REPLACELINE"'' $FILENAME
	fi
}

editOnlyOneLine "/etc/xrdp/startwm.sh" "KillDisconnected=false" "KillDisconnected=true"
sudo /etc/init.d/xrdp start
