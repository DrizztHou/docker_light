FROM houzheng/light_redis_rabbitmq 
MAINTAINER Docker johnhouzheng@gmail.com

# install 
RUN easy_install supervisor

# prepare
RUN mkdir -p /var/log/supervisor
       
COPY supervisord.conf /etc/supervisord.conf
COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["./docker-entrypoint.sh"]

