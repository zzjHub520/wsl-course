# Win11卸载WSL，卸载Windows子系统

### 1、查看当前环境安装的wsl

```cmd
wsl --list
```



### 2、注销（卸载）当前安装的Linux的Windows子系统

```cmd
wsl --unregister Ubuntu-20.04
```



### 3、卸载成功，查看当前安装的Linux的Windows子系统

```cmd
wsl --list
```



### 4、查看可安装的Linux的Windows子系统

```cmd
wsl --list --online
```



### 5、设置wsl的默认实例

```cmd
wsl --set-default Ubuntu-20.04
```



# 系统初始化

### Linux端口初始化账号和密码，一定要用管理员权限



### 安装cmake

下载cmake-3.26.4-linux-x86_64.sh

```sh
# 方法一
sudo ./cmake-3.26.4-linux-x86_64.sh --prefix=/usr/local/ --skip-license 
# 方法二
sudo apt install cmake -y
```



### C++开发环境

```sh
sudo apt update
sudo apt upgrade -y
sudo apt install build-essential -y
sudo apt install gdb -y

#clion可能遇到的权限问题
sudo adduser <用户名> sudo
# 重新启动系统，以应用对用户的更改。
```

### python3

```sh
sudo apt install python3 -y
python3 -m pip install pytest
```

### Protobuf

```sh
sudo apt install protobuf-compiler libprotobuf-dev -y
```

### python3识别protobuf

```sh 
sudo apt install python3-pip -y
pip3 install protobuf
```



### pybind11

```sh
sudo apt update
sudo apt install cmake build-essential
git clone https://github.com/pybind/pybind11.git
cd pybind11
mkdir build
cd build
cmake ..
make -j
sudo make install
```







