echo "connecting networks to containers"

#connecting redisnet1 to node-02 and node-03
docker network connect redisnet1 redis-node-02
docker network connect redisnet1 redis-node-03

#connecting redisnet2 to node-03 & node-01
docker network connect redisnet2 redis-node-01
docker network connect redisnet2 redis-node-03

#connecting redisnet3 to node-01 & node-02
docker network connect redisnet3 redis-node-01
docker network connect redisnet3 redis-node-02
