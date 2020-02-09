# Setting up Geo Distriuted Active Active Redis Enterprise Cluster on Google Cloud Platform

## Pre-requisite

- Create 3 Ubuntu 18.04 LTS instances, each of 6GB on GCP
- Install Docker 

## Cloning the Repository

```
git clone https://github.com/collabnix/redisplanet
cd redisplanet/ee/active-active
```

```
$ sudo docker run -d --cap-add sys_resource --name redis-node-01 -p 8443:8443 -p 9443:9443 -p 12000:12000 redislabs/redis
```

```
 sudo docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED        
     STATUS              PORTS                                             
                                                                           
                                NAMES
36f10d5e16ec        redislabs/redis     "/opt/start.sh"     19 seconds ago 
     Up 11 seconds       53/tcp, 5353/tcp, 8001/tcp, 8070/tcp, 0.0.0.0:8443
->8443/tcp, 8080/tcp, 0.0.0.0:9443->9443/tcp, 10000-11999/tcp, 12001-19999/
tcp, 0.0.0.0:12000->12000/tcp   redis-node-01
```

Wait till 1 minute to let Redis Enterprise come up.

