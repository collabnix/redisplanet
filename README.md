# Redisplanet - A Curated List of Redis Resources




## Creating Redis database

## Cloud

- [Redis Enterprise Cloud](https://developer.redislabs.com/create/rediscloud)
- [Heroku](https://developer.redislabs.com/create/heroku)
- [Azure Cache](https://developer.redislabs.com/create/azure)
- [Google Cloud](https://developer.redislabs.com/create/gcp)
- [AWS](https://developer.redislabs.com/create/aws)

## Local

- [Create Redis database on Docker](https://developer.redislabs.com/create/docker/)
- [Create Redis database on Google Kubernetes Engine](https://developer.redislabs.com/create/kubernetes/)
- [Create Redis database on Mac using Homebrew](https://developer.redislabs.com/create/homebrew/)
- [Create Redis database on Microsoft Windows 10](https://developer.redislabs.com/create/windows)
- [Create Redis database from Source](https://developer.redislabs.com/create/from-source/)


## Developing with Redis Clients

- [Java](https://developer.redislabs.com/develop/java/)
- [Python](https://developer.redislabs.com/develop/python/)
- [C](https://developer.redislabs.com/develop/C/)
- [NodeJS](https://developer.redislabs.com/develop/nodejs/)
- [Ruby](https://developer.redislabs.com/develop/ruby/) 
- [Php](https://developer.redislabs.com/develop/php/)



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


## Modules

### RediSearch

### RedisJSON

### RedisGraph

### RedisBloom

### RedisTimeSeries

### RedisAI



  




 
