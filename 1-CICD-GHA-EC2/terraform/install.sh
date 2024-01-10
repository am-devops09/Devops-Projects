# #Bootstrap Jenkins installation and start  
# #!/bin/bash #specifies the interpreter
# #Install docker & docker-compose
# echo "--------------------Installing Docker--------------------"
# sudo apt-get remove docker docker-engine docker.io containerd runc
# sudo apt-get update -y 
# sudo apt-get install -y \
#     ca-certificates \
#     curl \
#     gnupg \
#     lsb-release
# sudo mkdir -p /etc/apt/keyrings
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# echo \
#   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# sudo apt-get update -y
# sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
# sudo chmod +x /var/run/docker.sock
# ## install aws cli in case we need it
# # echo "--------------------Installing AWS-CLI--------------------"
# # sudo apt-get install zip -y
# # sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip
# # sudo ./aws/install
#!/bin/bash
# Use this for your user data (script from top to bottom)
# install httpd (Linux 2 version)
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html

#!/bin/bash
# Use this for your user data (script from top to bottom)
# install httpd (Linux 2 version)
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html


## installing docker
sudo yum install docker
sudo usermod -a -G docker ec2-user
id ec2-user
newgrp docker
sudo systemctl enable docker.service
sudo systemctl start docker.services