sudo kubeadm reset
sudo apt install ipvsadm -y
sudo ipvsadm --clear
sudo rm -rf /etc/kubernetes
sudo rm -rf /etc/cni
sudo rm -rf .kube
sudo kubeadm init
sudo mkdir -p $HOME/.kube
sudo sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
sudo kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml
