sudo $PKG_MANAGER remove docker docker-engine docker.io containerd runc
sudo $PKG_MANAGER update
sudo $PKG_MANAGER install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# docker engine
sudo $PKG_MANAGER update
sudo $PKG_MANAGER install docker-ce docker-ce-cli containerd.io

# non root user
sudo groupadd docker
sudo usermod -aG docker $USER 
