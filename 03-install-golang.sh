#yum update
wget https://dl.google.com/go/go1.13.6.linux-amd64.tar.gz
tar -xzf go1.13.6.linux-amd64.tar.gz
mv go /usr/local
echo "export GOROOT=/usr/local/go" >> /etc/profile
echo "export PATH=\$PATH:/usr/local/go/bin" >> /etc/profile

echo "export GOROOT=/usr/local/go" >> ~/.bash_profile
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bash_profile
source /etc/profile
source ~/.bash_profile
go version
go env

