# Redisplanet - A Curated List of Redis Enterprise Cloud | Redis Enterprise | Redis OSS



## Redis Open Source

### Installation
- Linux
  - [Installing Redis Open Source on Ubuntu 18.04](https://github.com/collabnix/redis/blob/master/install/ubuntu/18.04/README.md)<br>
  - [Starting Redis Server](https://github.com/collabnix/redis/tree/master/install/ubuntu/18.04#starting-redis-server)<br>
  - [Shutting down Redis Server](https://github.com/collabnix/redis/tree/master/install/ubuntu/18.04#shutting-down-redis)<br>
  - [How to change Redis Port](https://github.com/collabnix/redis/tree/master/install/ubuntu/18.04#how-to-change-redis-server-port)<br>

- Windows
- MacOS
- Docker
  - [Redis on Docker Swarm](http://collabnix.com/getting-started-with-redis-inside-docker-container-in-2-minutes/)
  - [Getting Started with Redis + Docker + Go](https://github.com/collabnix/redisplanet/blob/master/docker/Getting_Started_with_Docker-Redis-Go.md#getting-started-with-docker--redis--go)
- Kubernetes
   - Cloud
     - GKE
       -  [Setting up 3 Node Redis Cluster on GKE](https://github.com/collabnix/redis/blob/master/kubernetes/gke/README.md#setting-up-multi-node-redis-cluster-on-google-cloud-engine)<br>
   - Minikube
     - [How to run Redis Cluster on Kubernetes? ](https://github.com/collabnix/redisplanet/blob/master/kubernetes/redis-ruby-k8s/README.md#how-to-run-redis-cluster-on-kubernetes ) 

- IoT
  - [Redis running inside Docker Container on Jetson Nano](http://collabnix.com/running-redis-inside-docker-container-on-jetson-nano/)
  
- Monitoring
  - [Visualize Redis Open Source using Rebrow](https://collabnix.com/visualize-redis-open-source-using-rebrow/)
  
  
## Redis Configuration File

- [Everything You Want to Know about Redis.conf](https://github.com/collabnix/redisplanet/blob/master/Redis-conf/README.md)


## Features & FAQs

- [Is Redis In-memory Database?](https://github.com/collabnix/redisplanet/blob/master/oss/feature/in-memory/README.md#what-do-you-mean-when-you-say-in-memory-database)
- [Similarity between Redis Vs Memcached](https://github.com/collabnix/redisplanet/blob/master/oss/feature/in-memory/README.md#similarity-between-memcached-vs-in-memory-database)
- [Why Memcached & Redis so popular](https://github.com/collabnix/redisplanet/blob/master/oss/feature/in-memory/README.md#why-are-memcached-and-redis-so-popular)
- [When to use Memcached?](https://github.com/collabnix/redisplanet/blob/master/oss/feature/in-memory/README.md#when-to-use-memcached)
- [What to use Redis?](https://github.com/collabnix/redisplanet/blob/master/oss/feature/in-memory/README.md#when-to-use-redis)
- [Redis for data persistence](https://github.com/collabnix/redisplanet/blob/master/oss/feature/in-memory/README.md#redis-for-data-persistence)
- [Redis for In-memory Data Replication](https://github.com/collabnix/redisplanet/blob/master/oss/feature/in-memory/README.md#redis-in-memory-data-replication)
- [What is difference between Memcached Vs Redis Database?](https://github.com/collabnix/redisplanet/blob/master/oss/feature/in-memory/README.md#redis-vs-memcached)
- [Redis is a single-threaded. How can I acheive max throughput?](https://github.com/collabnix/redisplanet/blob/master/oss/feature/in-memory/README.md#redis-a-single-threaded)

### Redis Data Store | API

- [Concept](https://github.com/collabnix/redisplanet/blob/master/datastore/intro.md#data-store)
- [Key & Value](https://github.com/collabnix/redisplanet/blob/master/datastore/intro.md#key--value)
- [Strings](https://github.com/collabnix/redisplanet/blob/master/datastore/strings/README.md)
   - [SET vs GET](https://github.com/collabnix/redisplanet/tree/master/datastore/strings#set-vs-get)
     -  [Python Script to use SET operation](https://github.com/collabnix/redisplanet/blob/master/python/push.py)
   - [SET](https://github.com/collabnix/redisplanet/tree/master/datastore/strings#set-command)
   - [Altering & Querying](https://github.com/collabnix/redisplanet/tree/master/datastore/strings#altering--querying-redis-keyspace)
     - [EXISTS](https://github.com/collabnix/redisplanet/tree/master/datastore/strings#example-1)
     - [DEL](https://github.com/collabnix/redisplanet/tree/master/datastore/strings#example-1)
   - [Strings with Integer Values](https://github.com/collabnix/redisplanet/tree/master/datastore/strings#string-with-integer-values---incr)
     - [INCR](https://github.com/collabnix/redisplanet/tree/master/datastore/strings#example-2)
     - [DECR](https://github.com/collabnix/redisplanet/tree/master/datastore/strings#example-2)
     - [INCRBY](https://github.com/collabnix/redisplanet/tree/master/datastore/strings#example-2)
     - [DECBRY](https://github.com/collabnix/redisplanet/tree/master/datastore/strings#example-2)
  - [MSET vs MGET](https://github.com/collabnix/redisplanet/tree/master/datastore/strings#mset-and-mget)
  - [Keys Expiration](https://github.com/collabnix/redisplanet/tree/master/datastore/strings#keys-expiration)
     - [EXPIRE](https://github.com/collabnix/redisplanet/tree/master/datastore/strings#example-4)
     - [TTL](https://github.com/collabnix/redisplanet/tree/master/datastore/strings#example-4)
    
- [Lists](https://github.com/collabnix/redisplanet/blob/master/datastore/lists/README.md#lists)
  - [Basic API](https://github.com/collabnix/redisplanet/blob/master/datastore/lists/README.md#basic-api-of-lists)
    - [LPUSH](https://github.com/collabnix/redisplanet/blob/master/datastore/lists/README.md#example)
    - [RPUSH](https://github.com/collabnix/redisplanet/blob/master/datastore/lists/README.md#example)
    - [LRANGE](https://github.com/collabnix/redisplanet/blob/master/datastore/lists/README.md#example)
    - [LPOP](https://github.com/collabnix/redisplanet/blob/master/datastore/lists/README.md#rpop-and-lpop)
    - [RPOP](https://github.com/collabnix/redisplanet/blob/master/datastore/lists/README.md#rpop-and-lpop)
    - [LTRIM](https://github.com/collabnix/redisplanet/blob/master/datastore/lists/README.md#capped-lists-using-ltrim)
- [Hashes](https://github.com/collabnix/redisplanet/blob/master/datastore/hashes/README.md#hashes)
  - [HSET](https://github.com/collabnix/redisplanet/blob/master/datastore/hashes/README.md#hset)
     - [Python Script to push hash keys into Redis Database and retrieving it seamlessly](https://github.com/collabnix/redisplanet/blob/master/python/push-catalog.py)
  - [HGET](https://github.com/collabnix/redisplanet/blob/master/datastore/hashes/README.md#hget)
  - [HINCRBY](https://github.com/collabnix/redisplanet/blob/master/datastore/hashes/README.md#hincrby)
  - [HGETALL](https://github.com/collabnix/redisplanet/blob/master/datastore/hashes/README.md#hgetall)

- [Sets](https://github.com/collabnix/redisplanet/blob/master/datastore/set/README.md)
   - [SUNION](https://github.com/collabnix/redisplanet/blob/master/datastore/set/README.md#sunion)
   - [SINTER](https://github.com/collabnix/redisplanet/blob/master/datastore/set/README.md#sinter)
   - [SDIFF](https://github.com/collabnix/redisplanet/blob/master/datastore/set/README.md#sdiff)

 
- [Sorted Set](https://github.com/collabnix/redisplanet/blob/master/datastore/sorted-sets/README.md)
  - [Sorted Set Operations](https://github.com/collabnix/redisplanet/blob/master/datastore/sorted-sets/README.md#sorted-set-operations)
     - [ZADD](https://github.com/collabnix/redisplanet/blob/master/datastore/sorted-sets/README.md#sorted-set-operations)
     - [ZRANGE](https://github.com/collabnix/redisplanet/blob/master/datastore/sorted-sets/README.md#sorted-set-operations)
     
  - [Operate on Ranges](https://github.com/collabnix/redisplanet/blob/master/datastore/sorted-sets/README.md#operate-on-ranges)
     - [ZRANGEBYSCORE](https://github.com/collabnix/redisplanet/blob/master/datastore/sorted-sets/README.md#example)
     - [ZREMRANGEBYSCORE](https://github.com/collabnix/redisplanet/blob/master/datastore/sorted-sets/README.md#remove-elements-in-range)   
     

- [SCAN](https://github.com/collabnix/redisplanet/blob/master/datastore/scan/README.md)
- [INFO](https://github.com/collabnix/redisplanet/tree/master/advancedapi#info)
- [CLIENT LIST](https://github.com/collabnix/redisplanet/tree/master/advancedapi#client-list)
- [STAT](https://github.com/collabnix/redisplanet/blob/master/advancedapi/README.md#continuous-stats-mode)
- [MONITOR](https://github.com/collabnix/redisplanet/blob/master/advancedapi/README.md#monitor)



### Advanced API Implementation

- [Bitmaps](https://github.com/collabnix/redisplanet/blob/master/advancedapi/bitmap/README.md)
- [Bit Fields](https://github.com/collabnix/redisplanet/blob/master/advancedapi/bitfield/README.md)
- [HyperLogLogs](https://github.com/collabnix/redisplanet/blob/master/advancedapi/HyperLogLog/README.md)
- [Geospatial Indexes](https://github.com/collabnix/redisplanet/blob/master/advancedapi/geospatial/README.md)
- [Transactions](https://github.com/collabnix/redisplanet/blob/master/advancedapi/transactions/README.md)
- [Pub Sub](https://github.com/collabnix/redisplanet/blob/master/advancedapi/pubsub/README.md)
- [Lua Scripts](https://github.com/collabnix/redisplanet/blob/master/advancedapi/luascripts/README.md)
- [Modules](https://github.com/collabnix/redisplanet/blob/master/advancedapi/modules/README.md)

## Redis Enterprise Software

### Installation

 - Linux
   - [Installing Redis Enterprise on Ubuntu Linux](https://collabnix.github.io/redisplanet/ee/install/)
 - Windows
 - MacOS
   - [3 Node Redis Enterprise Cluster using Docker Desktop for Mac](http://collabnix.com/3-node-redis-enterprise-cluster-using-docker-desktop/)
 - Docker
   - [Setting up Redis Enterprise Software on Docker](https://github.com/collabnix/redis/blob/master/docker/README.md)<br>
   - [Installing RedisInSight & Connect to Redis Enterprise Software](https://github.com/collabnix/redis/blob/master/docker/README.md#running-redinsight)<br>
   - [3 Node Active-Active Redis Enterprise Cluster for Developers using Docker Desktop](http://collabnix.com/3-node-redis-enterprise-cluster-using-docker-desktop/)
     
## Redis Enterprise Cloud 

If you're looking out for fully managed cloud service, hosted or in your VPC, check out [Redis Enterprise Cloud](https://redislabs.com/redis-enterprise-cloud/) . You can sign up for a free account [here](https://redislabs.com/redis-enterprise-cloud/) and get 30MB free tier at no charge. Use the button below to register yourself and get started in no seconds. 

[![](https://github.com/collabnix/redisplanet/blob/master/images/recloud.png)](https://app.redislabs.com/#/add-subscription)



## Redis Enterprise Modules

- [RedisBloom]()
- [RedisGraph](https://github.com/collabnix/redisplanet/blob/master/enterprise/modules/redisgraph/README.md)
- [RedisJSON]()
- [RediSearch]()
  - [Search, Caching & Streams demo based on data from discogs.com using Docker](https://github.com/collabnix/rediscogs)
- [RedisGears]()
  - [Animal Recognition Demo using RedisGears, Streams, AI](https://github.com/collabnix/AnimalRecognitionDemo)


## Use cases

### Caching:

 -  [Cache Your NodeJS application with Redis in 6 Minutes](https://itnext.io/learn-to-cache-your-nodejs-application-with-redis-in-6-minutes-745a574a9739)




### Redis Technology Stack 

  - [TBD]()
  

### Redis Monitoring

  - [Monitoring Redis Enterprise using Instana](https://www.instana.com/blog/monitoring-redis-enterprise-using-instana/)

  




 
