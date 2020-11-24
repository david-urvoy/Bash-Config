if [[ $PKG_MANAGER = "apt-get" ]]; then
    sudo $PKG_MANAGER remove docker docker-engine docker.io containerd runc
    sudo $PKG_MANAGER update
    sudo $PKG_MANAGER install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

    # docker engine
    sudo $PKG_MANAGER update
    sudo $PKG_MANAGER install docker-ce docker-ce-cli containerd.io docker-compose

elif [[ $PKG_MANAGER = "dnf" ]]; then
    sudo dnf remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-selinux docker-engine-selinux docker-engine
    sudo dnf -y install dnf-plugins-core
    sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
    sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose
fi


# non root user
sudo groupadd docker
sudo usermod -aG docker $USER 
