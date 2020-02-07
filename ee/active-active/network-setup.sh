
echo "Script to create bridge networks"
docker network create -d bridge redisnet1  --subnet=172.18.0.0/16 --gateway=172.18.0.1
docker network create -d bridge redisnet2  --subnet=172.19.0.0/16 --gateway=172.19.0.1
docker network create -d bridge redisnet3  --subnet=172.20.0.0/16 --gateway=172.20.0.1
