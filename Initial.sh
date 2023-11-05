#! /bin/bash

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

sudo apt update  # 更新
sudo apt upgrade -y # 升级

sudo apt-get install xfce4 xfce4-goodies -y
sudo apt-get install xrdp -y
sudo apt install dbus-x11 -y

#sudo apt install gedit fcitx fcitx-config-gtk fcitx-sunpinyin fcitx-pinyin fcitx-googlepinyin xfonts-intl-chinese -y
#sudo apt install xfonts-wqy xfonts-unifont fonts-wqy* -y
#sudo apt install language-pack-gnome-zh-hans language-pack-kde-zh-hans language-pack-zh-hans -y

# 复制一份备用
sudo cp /etc/apt/sources.list /etc/apt/sources.list_bak
sudo cp /etc/xrdp/xrdp.ini /etc/xrdp/xrdp.ini.bak
sudo sed -i 's/3389/3390/g' /etc/xrdp/xrdp.ini
sudo sed -i 's/max_bpp=32/#max_bbp=32\nmax_bpp=128/g' /etc/xrdp/xrdp.ini
sudo sed -i 's/xservervpp=24/#xservervpp=24\nxserverbpp=128/g' /etc/xrdp/xrdp.ini

# 告诉系统: 开启桌面环境的时候用xfce4-session
sudo echo xfce4-session > ~/.xsession

editOnlyOneLine "/etc/xrdp/sesman.ini" "KillDisconnected=false" "KillDisconnected=true"

editOnlyOneLine "/etc/xrdp/startwm.sh" "test -x \/etc\/X11\/Xsession && exec \/etc\/X11\/Xsession" "#test -x /etc/X11/Xsession && exec /etc/X11/Xsession"
editOnlyOneLine "/etc/xrdp/startwm.sh" "exec \/bin\/sh \/etc\/X11\/Xsession" "#exec /bin/sh /etc/X11/Xsession"
editOnlyOneLine "/etc/xrdp/startwm.sh" "===============" "startxfce4"

sudo apt install cmake -y # 安装cmake
sudo apt install build-essential -y # 安装gcc
sudo apt install gdb -y # 安装gdb

sudo /etc/init.d/xrdp start

