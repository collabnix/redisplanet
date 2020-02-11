# High Availability with Redis Open Source using Redis Sentinel


## Pre-requisite

- Play with Docker Platform
- Setting up Local Private Registry

```
docker service create --name registry --publish published=5000,target=5000 registry:2
```

```
$ docker service ls
ID                  NAME                MODE                REPLICAS            IMAGE               PORTS
y2jtw5wom7lo        registry            replicated          1/1                 registry:2          *:5000->5000/tcp
```


## Our Setup


```
For Redis Sentinel:

image: 127.0.0.1:5000/collabnix-redis-sentinel

For Redis Master and slaves:
image: 127.0.0.1:5000/collabnix-redis

For our python application:
image: 127.0.0.1:5000/collabnix-python-app
```


## Create a directory

```
$ mkdir stackredis
$ cd stackredis
```





