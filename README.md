# Kubernetes v1.23 高可用集群自动部署（离线版）
>### 确保所有节点系统时间一致
### 1、下载所需文件

下载Ansible部署文件：

```
# git clone --branch v1.23 https://github.com/lizhenliang/ansible-install-k8s
# cd ansible-install-k8s
```

下载软件包并解压/root目录：

云盘地址：链接：https://pan.baidu.com/s/1RWlnabDvbkjkfjoZ7-F8xA 
提取码：jwqc
```
# tar zxf binary_pkg.tar.gz
```
### 2、修改Ansible文件

修改hosts文件，根据规划修改对应IP和名称。

```
# vi hosts
...
```
修改group_vars/all.yml文件，修改软件包目录和证书可信任IP。

```
# vim group_vars/all.yml
software_dir: '/root/binary_pkg'
...
cert_hosts:
  k8s:
  etcd:
```
## 3、一键部署
### 架构图
单Master架构
![avatar](https://github.com/lizhenliang/ansible-install-k8s/blob/master/single-master.jpg)
多Master架构
![avatar](https://github.com/lizhenliang/ansible-install-k8s/blob/master/multi-master.jpg)
### 部署命令
#### 单Master版：
a、升级kernel
```
# ansible-playbook -i hosts single-master-deploy.yml -uroot -k --tags common
```
b、部署其他
```
ansible-playbook -i hosts single-master-deploy.yml -uroot -k --skip-tags common
```
#### 多Master版：
a、升级kernel
```
# ansible-playbook -i hosts multi-master-deploy.yml -uroot -k --tags common
```
b、部署其他
```
# ansible-playbook -i hosts multi-master-deploy.yml -uroot -k --skip-tags common
``

## 4、部署控制
如果安装某个阶段失败，可针对性测试.

例如：只运行部署插件
```
# ansible-playbook -i hosts single-master-deploy.yml -uroot -k --tags addons
```
