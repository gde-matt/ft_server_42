FROM		debian:buster

RUN		apt-get update && \
		apt-get -y upgrade && \
		apt-get install -y nginx

COPY		srcs /root/

RUN		bash /root/server_config.sh

ENTRYPOINT	bash /root/start_here.sh

CMD		bash
