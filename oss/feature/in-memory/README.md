# What do you mean when you say "in-memory database"?

Redis is an in-memory but persistent on disk database, so it represents a different trade off where very high write and read speed is achieved with the limitation of data sets that can't be larger than memory. Another advantage of in memory databases is that the memory representation of complex data structures is much simpler to manipulate compared to the same data structure on disk, so Redis can do a lot, with little internal complexity. At the same time the two on-disk storage formats (RDB and AOF) don't need to be suitable for random access, so they are compact and always generated in an append-only fashion (Even the AOF log rotation is an append-only operation, since the new version is generated from the copy of data in memory).


In redis, all data has to be in memory. This is the point which is totally different from other NoSQL. Usually when you access and read some data in a database, you don't know if the data is in memory (cache) or not, but in the case of Redis, it's guaranteed that all data is in memory. Writing to disk is optional, which you can think of as having the trunk on memory and a kind of backup on the disk. You may lose data which is saved after last saving to a disk if you suddenly turn off the server.

And of course the advantage of it is a performance. Since all data is in RAM, it's incredibly fast.
