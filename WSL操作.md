# Win11卸载WSL，卸载Windows子系统

### 1、查看当前环境安装的wsl

```sh
wsl --list
```



### 2、注销（卸载）当前安装的Linux的Windows子系统

```sh
wsl --unregister Ubuntu
```



### 3、卸载成功，查看当前安装的Linux的Windows子系统

```sh
wsl --list
```



### 4、查看可安装的Linux的Windows子系统

```sh
wsl --list --online
```

