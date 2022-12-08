# 设置集群参数
kubectl config set-cluster kubernetes --server=https://192.168.101.31:6443 --certificate-authority=ca.pem --embed-certs=true --kubeconfig=config

# 设置客户端认证参数
kubectl config set-credentials cluster-admin --certificate-authority=ca.pem --embed-certs=true --client-key=admin-key.pem --client-certificate=admin.pem --kubeconfig=config

# 设置上下文参数
kubectl config set-context default --cluster=kubernetes --user=cluster-admin --kubeconfig=config

# 设置默认上下文
kubectl config use-context default  --kubeconfig=config
