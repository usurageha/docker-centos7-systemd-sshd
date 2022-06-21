# docker-centos7-systemd-sshd
Execute Systemd and SSHd in CentOS7 container

## Prerequisites
* Microsoft Windows 10 Pro Build 19044
* Docker Desktop 4.9.1 (81317) on WSL2 Ubuntu 20.04 (Cgroup Version: 1)

## How to Use

```
$ git clone https://github.com/usurageha/docker-centos7-systemd-sshd.git
$ cd docker-centos7-systemd-sshd
$ docker-compose build
$ docker-compose up -d
[+] Running 1/1
 ⠿ Container docker-centos7-systemd-sshd-centos7-1  Started
$ ssh user@localhost -p 2222
Warning: Permanently added '[localhost]:2222' (ECDSA) to the list of known hosts.
user@localhost's password:
Last login: Tue Jun 21 08:05:51 2022 from 172.19.0.1
[user@854e6f76513e ~]$
```
