# RedisPlanet - A Curated List of Redis Resources

RedisPlanet is a curated list of popular Redis resources available over the internet. This repository is maintained by the Collabnix community. Feel free to contribute the links and resources for Redis.


## Creating Redis database

## Cloud

- [Redis Enterprise Cloud](https://developer.redislabs.com/create/rediscloud)
- [Heroku](https://developer.redislabs.com/create/heroku)
- [Azure Cache](https://developer.redislabs.com/create/azure)
- [Google Cloud](https://developer.redislabs.com/create/gcp)
- [AWS](https://developer.redislabs.com/create/aws)

## Local

- [Docker](https://developer.redislabs.com/create/docker/)
- [Google Kubernetes Engine](https://developer.redislabs.com/create/kubernetes/)
- [Mac using Homebrew](https://developer.redislabs.com/create/homebrew/)
- [Microsoft Windows 10](https://developer.redislabs.com/create/windows)
- [Build from Source](https://developer.redislabs.com/create/from-source/)
- [RedisMod](https://developer.redislabs.com/explore/redismod)


## Developing with Redis Clients

- [Java](https://developer.redislabs.com/develop/java/)
  - [Java based application on Heroku using Redis](https://developer.redislabs.com/howtos/herokujava)
- [Python](https://developer.redislabs.com/develop/python/)
  - [Python based application on Heroku using Redis](https://developer.redislabs.com/howtos/herokupython)
- [C](https://developer.redislabs.com/develop/C/)
- [NodeJS](https://developer.redislabs.com/develop/nodejs/)
  - [NodeJS based application on Heroku using Redis](https://developer.redislabs.com/howtos/herokunodejs)
- [Ruby](https://developer.redislabs.com/develop/ruby/) 
- [Php](https://developer.redislabs.com/develop/php/)

## Extensibility via Redis Modules

### RediSearch

- [Getting Started](https://developer.redislabs.com/howtos/redisearch)
- [Building Movie Database app using RediSearch](https://developer.redislabs.com/howtos/moviesdatabase/getting-started)


### RedisJSON

- [Getting Started](https://developer.redislabs.com/howtos/redisjson)
- [How to build a Shopping cart app using NodeJS and RedisJSON](https://developer.redislabs.com/howtos/shoppingcart)
- [HackerNews Clone using RedisJSON](https://developer.redislabs.com/howtos/hackernews)


### RedisGears

- [Getting Started](https://developer.redislabs.com/howtos/redisgears)
- [How to build a Fraud Detection System using RedisGears and RedisBloom](https://developer.redislabs.com/howtos/frauddetection)
- [Building a Pipeline for Natural Language Processing using RedisGears](https://developer.redislabs.com/howtos/nlp)

### RedisGraph

- [Getting Started](https://developer.redislabs.com/howtos/redisgraph)
- [Building Movies database app using RedisGraph and NodeJS](https://developer.redislabs.com/howtos/redisgraphmovies)

### RedisBloom

- [Getting Started](https://developer.redislabs.com/howtos/redisbloom)
- [How to build a Fraud Detection System using RedisGears and RedisBloom](https://developer.redislabs.com/howtos/frauddetection)

### RedisTimeSeries

- [Getting Started](https://developer.redislabs.com/howtos/redistimeseries)
- [How to Manage IoT Sensor data using RedisTimeSeries](https://redislabs.com/blog/how-to-manage-real-time-iot-sensor-data-in-redis/)

### RedisAI

- [Getting Started](https://developer.redislabs.com/howtos/redisai)

### Redis Commands

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
- [Managing a Redis Stream](https://medium.com/@sydcanem/managing-a-redis-stream-b8c912e06fa9)

### Advanced API Implementation

- [Bitmaps](https://github.com/collabnix/redisplanet/blob/master/advancedapi/bitmap/README.md)
- [Bit Fields](https://github.com/collabnix/redisplanet/blob/master/advancedapi/bitfield/README.md)
- [HyperLogLogs](https://github.com/collabnix/redisplanet/blob/master/advancedapi/HyperLogLog/README.md)
- [Geospatial Indexes](https://github.com/collabnix/redisplanet/blob/master/advancedapi/geospatial/README.md)
- [Transactions](https://github.com/collabnix/redisplanet/blob/master/advancedapi/transactions/README.md)
- [Pub Sub](https://github.com/collabnix/redisplanet/blob/master/advancedapi/pubsub/README.md)
- [Lua Scripts](https://github.com/collabnix/redisplanet/blob/master/advancedapi/luascripts/README.md)
- [Modules](https://github.com/collabnix/redisplanet/blob/master/advancedapi/modules/README.md)


### Use cases

- [How to build a Real-Time Leaderboard app Using Redis](https://developer.redislabs.com/howtos/leaderboard)
- [How to build a Rate Limiter using Redis](https://developer.redislabs.com/howtos/ratelimiting)
- [How to cache REST API responses Using Redis & NodeJS](https://developer.redislabs.com/howtos/caching)
- [How to build a Chat application using Redis](https://developer.redislabs.com/howtos/chatapp)
- [Building an Analytics dashboard app using Redis](https://developer.redislabs.com/howtos/analytics)
- [https://developer.redislabs.com/howtos/popupstore](https://developer.redislabs.com/howtos/popupstore)

 
