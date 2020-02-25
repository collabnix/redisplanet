echo 'yes' | /root/redis-trib.rb create --replicas 1 \
`getent hosts redis-0 | awk '{ print $1 }'`:7000 \
`getent hosts redis-1 | awk '{ print $1 }'`:7000 \
`getent hosts redis-2 | awk '{ print $1 }'`:7000 \
`getent hosts redis-3 | awk '{ print $1 }'`:7000 \
`getent hosts redis-4 | awk '{ print $1 }'`:7000 \
`getent hosts redis-5 | awk '{ print $1 }'`:7000

