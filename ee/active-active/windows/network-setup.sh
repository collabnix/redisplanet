echo "Script to create nat networks"
docker network create -d nat redisnet1  --subnet=172.29.0.0/16 --gateway=172.29.0.1
docker network create -d nat redisnet2  --subnet=172.30.0.0/16 --gateway=172.30.0.1
docker network create -d nat redisnet3  --subnet=172.31.0.0/16 --gateway=172.21.0.1
