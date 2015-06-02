#!/bin/sh

PASS=${RABBITMQ_PASS:-"admin"}
USER=${RABBITMQ_USER:-"admin"}

chown -R light:light /rabbitmqdata

# configure redis
sed -i 's/daemonize no/daemonize yes/g' /etc/redis.conf

# start rabbitmq-server
/usr/rabbitmq/sbin/rabbitmq-server -detached

# configure rabbitmq
/usr/rabbitmq/sbin/rabbitmq-plugins enable rabbitmq_management
# add user
/usr/rabbitmq/sbin/rabbitmqctl add_user $USER $PASS
/usr/rabbitmq/sbin/rabbitmqctl set_user_tags $USER administrator

# stop rabbitmq-server
/usr/rabbitmq/sbin/rabbitmqctl stop

/usr/bin/supervisord -c /etc/supervisord.conf
