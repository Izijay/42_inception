FROM debian:buster

RUN apt update && apt upgrade -y && apt install -y \
	nginx \
	openssl

COPY conf/nginx.conf /etc/nginx/sites-enabled/default
COPY tools/start_nginx.sh /tmp/start_nginx.sh

ENTRYPOINT ["sh", "/tmp/start_nginx.sh"]
CMD ["nginx", "-g", "daemon off;"]
