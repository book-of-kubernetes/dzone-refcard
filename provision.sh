#!/bin/bash
apt-get update
apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list 2> /dev/null

apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

curl -fsSL -o /usr/local/bin/k3s https://github.com/k3s-io/k3s/releases/download/v1.24.3%2Bk3s1/k3s
chmod 0755 /usr/local/bin/k3s

cat <<EOD >/etc/systemd/system/k3s.service
[Unit]
Description=k3s
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
Restart=always
RestartSec=5
User=root
ExecStart=/usr/local/bin/k3s server --write-kubeconfig-mode=0644

[Install]
WantedBy=multi-user.target
EOD

systemctl daemon-reload
systemctl enable --now k3s

echo "alias kubectl='/usr/local/bin/k3s kubectl'" > /home/vagrant/.bash_aliases

cat <<EOD
=====================================================================
Getting Started with Kubernetes
=====================================================================

A Kubernetes cluster using k3s has been installed and is running in 
the virtual machine.

Use "vagrant ssh" to log in to the virtual machine, then use "kubectl"
to inspect and manage the cluster. The example Kubernetes resource
YAML files are in /vagrant/examples and /vagrant/todo. Use
"kubectl apply -f <filename>" to apply each example resource to the
cluster.

Port 80 in the virtual machine is forwarded to port 48080 on the host,
so once you've deployed an Ingress resource, you can visit
http://localhost:48080 in your browser to see your web application
running in the Kubernetes cluster. Note that the Todo example shows
up under /todo, so the URL is http://localhost:48080/todo.

When you're done, use "exit" to leave the virtual machine. Then use
"vagrant destroy" to shut down and delete the virtual machine.

=====================================================================
EOD
