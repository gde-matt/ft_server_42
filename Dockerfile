FROM		debian:buster

RUN		apt-get update && \
		apt-get -y upgrade && \
		apt-get install -y nginx \
		mariadb-server \
		php7.3 \
		php-fpm \
		php-mysql \
		wget

COPY		srcs /root/

RUN		bash /root/server_config.sh

EXPOSE		80 443

ENTRYPOINT	bash /root/start_here.sh
