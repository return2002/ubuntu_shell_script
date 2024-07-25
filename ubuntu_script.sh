#!/bin/bash

# Function to enable SSH
enable_ssh() {
    # 定义要修改的配置文件路径
    SSH_CONFIG_FILE="/etc/ssh/sshd_config"
    # 备份原始配置文件（可选）
    cp "$SSH_CONFIG_FILE" "$SSH_CONFIG_FILE.bak"
    # 启用密码认证登录
    sudo sed -i 's/^#\?PasswordAuthentication\s\+.*/PasswordAuthentication yes/' "$SSH_CONFIG_FILE"
    # 重启 SSH 服务使配置生效
    sudo systemctl restart ssh
    sudo systemctl start ssh
    sudo systemctl enable ssh
    sudo ufw allow ssh
    echo "SSH enabled and firewall configured."
    echo "SSH配置已更新，已启用密码认证登录。"
}

# Function to install Docker and Docker Compose
install_docker() {
    # Add Docker's official GPG key:
    sudo apt-get update
    sudo apt-get install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    # sudo apt-get update
    # sudo apt-get install docker-compose-plugin

    echo "Docker Compose installed."
}

# Function to modify host information
modify_host_info() {
    clear
    echo "Modify Host Information"
    echo "1. Modify Hostname"
    echo "2. Modify Root Username"
    echo "3. Modify Root Password"
    read -p "Enter your choice (1-3): " choice

    case $choice in
        1)
            read -p "Enter new hostname: " new_hostname
            sudo hostnamectl set-hostname $new_hostname
            echo "Hostname changed to $new_hostname. Please restart your system to apply changes."
            ;;
        2)
            read -p "Enter new root username: " new_username
            sudo usermod -l $new_username root
            echo "Root username changed to $new_username."
            ;;
        3)
            sudo passwd root
            echo "Root password changed."
            ;;
        *)
            echo "Invalid choice. Please enter a number between 1 and 3."
            ;;
    esac
}

# Main script
echo "Ubuntu 20.04 Configuration Script"
echo "1. Enable SSH"
echo "2. Install Docker and Docker Compose"
echo "3. Modify Host Information"

read -p "Enter your choice (1-3): " option

case $option in
    1)
        enable_ssh
        ;;
    2)
        install_docker
        ;;
    3)
        modify_host_info
        ;;
    *)
        echo "Invalid choice. Please enter a number between 1 and 3."
        ;;
esac

echo "Script execution completed."
