#!/bin/sh
sed -i "s/\$REDIS_MASTER_NAME/$REDIS_MASTER_NAME/g" /etc/redis/sentinel.conf
sed -i "s/\$REDIS_MASTER_HOST/$REDIS_MASTER_HOST/g" /etc/redis/sentinel.conf
sed -i "s/\$REDIS_MASTER_PORT/$REDIS_MASTER_PORT/g" /etc/redis/sentinel.conf
sed -i "s/\$SENTINEL_QUORUM/$SENTINEL_QUORUM/g" /etc/redis/sentinel.conf
sed -i "s/\$SENTINEL_DOWN_AFTER/$SENTINEL_DOWN_AFTER/g" /etc/redis/sentinel.conf
sed -i "s/\$SENTINEL_PARALLEL_SYNC/$SENTINEL_PARALLEL_SYNC/g" /etc/redis/sentinel.conf
sed -i "s/\$SENTINEL_FAILOVER_TIMEOUT/$SENTINEL_FAILOVER_TIMEOUT/g" /etc/redis/sentinel.conf
exec docker-entrypoint.sh redis-server /etc/redis/sentinel.conf --sentinel
