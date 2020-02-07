docker run -d --cap-add sys_resource --network redisnet1 --name redis-node-01 -h redis-node-01  -p 8443:8443 -p 9443:9443 -p 12000:12000 --ip 172.18.0.2 redislabs/redis
docker run -d --cap-add sys_resource --network redisnet2 --name  redis-node-02 -h redis-node-02 -p 8444:8443 -p 9444:9443 -p 12001:12000 --ip 172.19.0.2 redislabs/redis
docker run -d --cap-add sys_resource --network redisnet3 --name  redis-node-03 -h redis-node-03 -p 8445:8443 -p 9445:9443 -p 12002:12000 --ip 172.20.0.2 redislabs/redis
