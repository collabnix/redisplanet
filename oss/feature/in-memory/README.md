# What do you mean when you say "in-memory database"?

- Redis is an in-memory but persistent on disk database, so it represents a different trade off where very high write and read speed is achieved with the limitation of data sets that can't be larger than memory. 
- Another advantage of in memory databases is that the memory representation of complex data structures is much simpler to manipulate compared to the same data structure on disk, so Redis can do a lot, with little internal complexity. 
- At the same time the two on-disk storage formats (RDB and AOF) don't need to be suitable for random access, so they are compact and always generated in an append-only fashion (Even the AOF log rotation is an append-only operation, since the new version is generated from the copy of data in memory).


- In redis, all data has to be in memory. 
- This is the point which is totally different from other NoSQL. 
- Usually when you access and read some data in a database, you don't know if the data is in memory (cache) or not, but in the case of Redis, it's guaranteed that all data is in memory. 
- Writing to disk is optional, which you can think of as having the trunk on memory and a kind of backup on the disk. You may lose data which is saved after last saving to a disk if you suddenly turn off the server.

- And of course the advantage of it is a performance. Since all data is in RAM, it's incredibly fast.

# Similarity between Memcached Vs In-Memory Database?

Let's start with similarities first...


- Both Memcached and Redis serve as in-memory, key-value data stores, although Redis is more accurately described as a data structure store. 
- Both Memcached and Redis belong to the NoSQL family of data management solutions, 
- Both are based on a key-value data model. 
- Both keep all data in RAM, which of course makes them supremely useful as a caching layer. 
- In terms of performance, the two data stores are also remarkably similar, exhibiting almost identical characteristics (and metrics) with respect to throughput and latency.

- Both Memcached and Redis are mature and hugely popular open source projects. 
- Memcached was originally developed by Brad Fitzpatrick in 2003 for the LiveJournal website. 
- Since then, Memcached has been rewritten in C (the original implementation was in Perl) and put in the public domain, where it has become a cornerstone of modern Web applications. 
- Current development of Memcached is focused on stability and optimizations rather than adding new features.
- Redis was created by Salvatore Sanfilippo in 2009, and Sanfilippo remains the lead developer of the project today. 
- Redis is sometimes described as “Memcached on steroids,” which is hardly surprising considering that parts of Redis were built in response to lessons learned from using Memcached. 
- Redis has more features than Memcached and is, thus, more powerful and flexible.


# Why are Memcached and Redis so popular? 

- Not only are they extremely effective, they’re also relatively simple. 
- Getting started with either Memcached or Redis is considered easy work for a developer. 
- It takes only a few minutes to set up and get them working with an application. 
- Thus, a small investment of time and effort can have an immediate, dramatic impact on performance—usually by orders of magnitude. 

# When to use Memcached

- Memcached could be preferable when caching relatively small and static data, such as HTML code fragments. 
- Memcached’s internal memory management, while not as sophisticated as that of Redis, is more efficient in the simplest use cases because it consumes comparatively less memory resources for metadata. 
- Strings (the only data type supported by Memcached) are ideal for storing data that is only read, because strings require no further processing.

- Large data sets often involve serialized data, which always requires more space to store. 
- While Memcached is effectively limited to storing data in its serialized form, the data structures in Redis can store any aspect of the data natively, thus reducing serialization overhead.

- The second scenario in which Memcached has an advantage over Redis is in scaling. 
- Because Memcached is multithreaded, you can easily scale up by giving it more computational resources, but you will lose part or all of the cached data (depending on whether you use consistent hashing). 
- Redis, which is mostly single-threaded, can scale horizontally via clustering without loss of data. 
- Clustering is an effective scaling solution, but it is comparatively more complex to set up and operate.

# When to use Redis

- You’ll almost always want to use Redis because of its data structures. 
- With Redis as a cache, you gain a lot of power (such as the ability to fine-tune cache contents and durability) and greater efficiency overall. 
- Once you use the data structures, the efficiency boost becomes tremendous for specific application scenarios.

- Redis’ superiority is evident in almost every aspect of cache management. 
- Caches employ a mechanism called data eviction to make room for new data by deleting old data from memory. 
- Memcached’s data eviction mechanism employs a Least Recently Used algorithm and somewhat arbitrarily evicts data that’s similar in size to the new data.

- Redis, by contrast, allows for fine-grained control over eviction, letting you choose from six different eviction policies. - Redis also employs more sophisticated approaches to memory management and eviction candidate selection. 
- Redis supports both lazy and active eviction, where data is evicted only when more space is needed or proactively. 

- Redis gives you much greater flexibility regarding the objects you can cache. 
- While Memcached limits key names to 250 bytes and works with plain strings only, Redis allows key names and values to be as large as 512MB each, and they are binary safe. 
- Plus, Redis has five primary data structures to choose from, opening up a world of possibilities to the application developer through intelligent caching and manipulation of cached data.

# Redis for data persistence

- Using Redis data structures can simplify and optimize several tasks—not only while caching, but even when you want the data to be persistent and always available. 
- For example, instead of storing objects as serialized strings, developers can use a Redis Hash to store an object’s fields and values, and manage them using a single key. 
- Redis Hash saves developers the need to fetch the entire string, deserialize it, update a value, reserialize the object, and replace the entire string in the cache with its new value for every trivial update—that means lower resource consumption and increased performance.

- Other data structures offered by Redis (such as lists, sets, sorted sets, hyperloglogs, bitmaps, and geospatial indexes) can be used to implement even more complex scenarios. 
- Sorted sets for time-series data ingestion and analysis is another example of a Redis data structure that offers enormously reduced complexity and lower bandwidth consumption.

- Another important advantage of Redis is that the data it stores isn’t opaque, so the server can manipulate it directly. 
- A considerable share of the 180-plus commands available in Redis are devoted to data processing operations and embedding logic in the data store itself via server-side Lua scripting. 
- These built-in commands and user scripts give you the flexibility of handling data processing tasks directly in Redis without having to ship data across the network to another system for processing.

- Redis offers optional and tunable data persistence designed to bootstrap the cache after a planned shutdown or an unplanned failure. 
- While we tend to regard the data in caches as volatile and transient, persisting data to disk can be quite valuable in caching scenarios. 
- Having the cache’s data available for loading immediately after restart allows for much shorter cache warm-up and removes the load involved in repopulating and recalculating cache contents from the primary data store.


Redis and Memcached are both in-memory data storage systems. Memcached is a high-performance distributed memory cache service, and Redis is an open-source key-value store. Similar to Memcached, Redis stores most of the data in the memory. It supports operations on various data types including strings, hash tables, and linked lists among others. The Alibaba Cloud ApsaraDB family supports these two popular data storage systems: ApsaraDB for Redis and ApsaraDB for Memcache. 

## Redis Vs Memcached

| Redis      | Memcached    | 
| ------------- |:-------------:|
|   Redis only uses single cores           |    Memcached utilizes multiple cores        |  
|   Redis supports much richer data types, including String, Hash, List, Set and Sorted Set          |     Memcached  only supports data records of the simple key-value structure       | 
|  Redis supports server-end data operations, and owns more data structures and supports richer data operations. In Redis, these complicated operations are as efficient as the general GET/SET operations. Therefore, if you need the cache to support more complicated structures and operations, Redis is a good choice | In Memcached, you usually need to copy the data to the client end for similar changes and then set the data back. The result is that this greatly increases network IO counts and data sizes.  |
| But if Redis adopts the hash structure, it will have a higher memory utilization rate than Memcached thanks to its combined compression mode | Memcached has a higher memory utilization rate for simple key-value storage. |

| Although Redis has also made some optimizations for storing big data, it is still inferior to Memcached | Memcached outperforms Redis for storing data of 100k or above.|


## Reference: [Link](https://medium.com/@Alibaba_Cloud/redis-vs-memcached-in-memory-data-storage-systems-3395279b0941)


## Redis in-memory data replication 

- Redis can also replicate the data that it manages. 
- Replication can be used for implementing a highly available cache setup that can withstand failures and provide uninterrupted service to the application. 
- A cache failure falls only slightly short of application failure in terms of the impact on user experience and application performance, so having a proven solution that guarantees the cache’s contents and service availability is a major advantage in most cases.

- Last but not least, in terms of operational visibility, Redis provides a slew of metrics and a wealth of introspective commands with which to monitor and track usage and abnormal behavior. 
- Real-time statistics about every aspect of the database, the display of all commands being executed, the listing and managing of client connections—Redis has all that and more.

- When developers realize the effectiveness of Redis’s persistence and in-memory replication capabilities, they often use it as a first-responder database, usually to analyze and process high-velocity data and provide responses to the user while a secondary (often slower) database maintains a historical record of what happened. 
- When used in this manner, Redis can also be ideal for analytics use cases.
