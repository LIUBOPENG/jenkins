
sudo yum -y install java-openjdk-devel java-openjdk
cat <<EOF | sudo tee /etc/yum.repos.d/elasticsearch.repo
[elasticsearch-7.x]
name=Elasticsearch repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOF
sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
sudo yum clean all
sudo yum makecache
sudo yum -y install elasticsearch
rpm -qi elasticsearch 
sudo systemctl enable --now elasticsearch.service 

curl http://127.0.0.1:9200 
curl -X PUT "http://127.0.0.1:9200/mytest_index"

#install kibana
sudo yum -y install kibana
# config kibana
# sudo vim /etc/kibana/kibana.yml
#$ sudo vim /etc/kibana/kibana.yml
#server.host: "0.0.0.0"
#server.name: "kibana.example.com"
#elasticsearch.url: "http://localhost:9200"
sudo systemctl enable --now kibana
sudo firewall-cmd --add-port=5601/tcp --permanent
sudo firewall-cmd --reload
sudo yum -y install logstash
sudo yum install filebeat auditbeat metricbeat packetbeat heartbeat-elastic
sudo systemctl restart logstash elasticsearch kibana
