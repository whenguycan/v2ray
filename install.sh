yum install epel-release -y
yum update
yum install net-tools nginx ntp ntpdate -y

timedatectl set-timezone Asia/Shanghai
ntpdate time.windows.com
hwclock --systohc

mkdir /etc/ssl/v2ray
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/v2ray/ssl.key -out /etc/ssl/v2ray/ssl.crt  -subj "/C=CN/ST=GD/L=SZ/O=jim/OU=dev/CN=abc.com/emailAddress=jim_dev@abc.com"

firewall-cmd --add-port=8443/tcp --permanent
firewall-cmd --reload

bash install-release.sh

cp v2ray.conf /etc/nginx/conf.d
cp config.json /usr/local/etc/v2ray

systemctl enable v2ray
systemctl start v2ray
systemctl enable nginx
systemctl start nginx