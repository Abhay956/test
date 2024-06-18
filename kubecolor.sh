wget https://github.com/hidetatz/kubecolor/releases/download/v0.0.25/kubecolor_0.0.25_Linux_x86_64.tar.gz
tar -zxf kubecolor_0.0.25_Linux_x86_64.tar.gz
path=$(pwd)
echo "alias kubectl='$path/kubecolor'" >> ~/.bashrc
rm -rf kubecolor_0.0.25_Linux_x86_64.tar.gz
bash