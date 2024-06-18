ssh-keygen
ssh-copy-id node02
ssh-copy-id node01

sudo yum update
sudo yum install git python3 python3-pip -y
sudo yum install ansible-core -y
git clone https://github.com/kubernetes-incubator/kubespray.git
cd kubespray

pip install -r requirements.txt
cp -rfp inventory/sample inventory/mycluster
declare -a IPS=(192.168.116.128 192.168.116.129) #Add your IPs
CONFIG_FILE=inventory/mycluster/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}

ansible all -i inventory/mycluster/hosts.yaml -m ping
ansible all -i inventory/mycluster/hosts.yaml -m shell -a "sudo systemctl stop firewalld && sudo systemctl disable firewalld"
ansible all -i inventory/mycluster/hosts.yaml -m shell -a "echo 'net.ipv4.ip_forward=1' | sudo tee -a /etc/sysctl.conf"
ansible all -i inventory/mycluster/hosts.yaml -m shell -a "sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab && sudo swapoff -a"
ansible-playbook -i inventory/mycluster/hosts.yaml --become --become-user=root cluster.yml