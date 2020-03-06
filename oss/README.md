

# What is Redis?

- Redis is in the family of databases called key-value stores.
- The essence of a key-value store is the ability to store some data, called a value, inside a key. 
- This data can later be retrieved only if we know the exact key used to store it.
- Often Redis it is called a data structure server because it has outer key-value shell, but each value can contain a complex data structure, such as a string, a list, a hashes, or ordered data structures called sorted sets as well as probabilistic data structures like hyperloglog.

As a first example, we can use the command SET to store the value "fido" at key "server:name":


    SET server:name "fido"
Redis will store our data permanently, so we can later ask "What is the value stored at key server:name?" and Redis will reply with "fido":


    GET server:name => "fido"

There is a command in order to test if a give key exists or not:


    EXISTS server:name => 1
    EXISTS server:blabla => 0

Other basic operations provided by Redis are DEL to delete a given key and associated value, INCR to atomically increment a number stored at a given key:


   

> SET connections 10
OK
> INCR connections
(integer) 11
> INCR connections
(integer) 12
> DEL connections
(integer) 1
> INCR connections
(integer) 1
> INCRBY connections 100
(integer) 101
> DECRBY connections 10
(integer) 91







It is also possible to increment the number contained inside a key by a specific amount:


    INCRBY connections 100 => 101
And there are similar commands in order to decrement the value of the key.


    DECR connections => 100
    DECRBY connections 10 => 90
When you manipulate Redis strings with incrementing and decrementing commands, you are implementing counters. Counters are a very popular application for Redis.
