### 实现功能
1.开启 SSH 远程登录

2.安装 Docker 和 Docker Compose

3.修改主机信息（包括修改主机名、root 用户名和密码）

```shell
wget -N --no-check-certificate https://raw.githubusercontent.com/return2002/ubuntu_shell_script/main/ubuntu_script.sh && chmod +x ubuntu_script.sh && ./ubuntu_script.sh
```

使用docker compose 安装 alist 并设置admin密码
```shell
wget -N --no-check-certificate https://raw.githubusercontent.com/return2002/ubuntu_shell_script/main/docker_compose_alist.sh && chmod +x docker_compose_alist.sh && ./docker_compose_alist.sh
```


使用docker compose 安装 jupyter 并设置login密码
```shell
wget -N --no-check-certificate https://raw.githubusercontent.com/return2002/ubuntu_shell_script/main/docker_compose_jupyter.sh && chmod +x docker_compose_jupyter.sh && ./docker_compose_jupyter.sh
```


tencent使用docker compose 安装 chattts
```shell
wget -N --no-check-certificate https://raw.githubusercontent.com/return2002/ubuntu_shell_script/main/chattts.sh && chmod +x chattts.sh && ./chattts.sh
```
