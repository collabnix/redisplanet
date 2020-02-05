# Setting up Multi-Node Redis Enterprise Cluster


## Pre-requisite

- Docker Desktop for Mac
- Ensure that atleast 3+ GB Memory is allocated


## Steps


```
docker run -d --cap-add sys_resource --name  redis-sys1 -p 8443:8443 -p 9443:9443 -p 12000:12000 redislabs/redis
a9d2cb8c34c8c2237337d015dff5b4929b0928cbd7004c2d4f718c95ceb5056d
[Captains-Bay]🚩 >  
```

```
[Captains-Bay]🚩 >  docker run -d --cap-add sys_resource --name redis-sys2 -p 8444:8443 -p 9444:9443 -p 12001:12000 redislabs/redis
f587860d3d107325e0d74217c22aef6984db9bf04510421410c98b2cb51a8473
[Captains-Bay]🚩 >  docker run -d --cap-add sys_resource --name redis-sys3 -p 8445:8443 -p 9445:9443 -p 12002:12000 redislabs/redis
568d677498755fc94048d978f59dcee4a00580b972703d0f44af462a601c24a6
```






