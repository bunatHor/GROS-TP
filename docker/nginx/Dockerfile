FROM archlinux

RUN pacman -Sy
RUN pacman -S nginx openssl --noconfirm
# ubuntu
# apt install -y nginx
RUN mkdir -p /var/www/html
RUN usermod -u 1000 http

RUN openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/https.vdm.fr.key -out /etc/ssl/https.vdm.fr.crt -sha256 -days 3650 -nodes -subj "/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=CommonNameOrHostname"




COPY volume/nginx.conf /etc/nginx/nginx.conf



CMD ["nginx","-g","daemon off;"]
