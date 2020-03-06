

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


## INCR:

There is something special about INCR. Why do we provide such an operation if we can do it ourself with a bit of code? After all it is as simple as:

x = GET count
x = x + 1
SET count x
The problem is that doing the increment in this way will only work as long as there is a single client using the key. See what happens if two clients are accessing this key at the same time:

Client A reads count as 10.
Client B reads count as 10.
Client A increments 10 and sets count to 11.
Client B increments 10 and sets count to 11.

We wanted the value to be 12, but instead it is 11! This is because incrementing the value in this way is not an atomic operation. Calling the INCR command in Redis will prevent this from happening, because it is an atomic operation.

All the Redis operations implemented by single commands are atomic, including the ones operating on more complex data structures. So when you use a Redis command that modifies some value, you don't have to think about concurrent access.


## EXPIRE | TTL | PEXPIRE | PTTL

Redis can be told that a key should only exist for a certain length of time. This is accomplished with the EXPIRE and TTL commands, and by the similar PEXPIRE and PTTL commands that operate using time in milliseconds instead of seconds.


    SET resource:lock "Redis Demo"
    EXPIRE resource:lock 120
This causes the key resource:lock to be deleted in 120 seconds. You can test how long a key will exist with the TTL command. It returns the number of seconds until it will be deleted.


    TTL resource:lock => 113
    // after 113s
    TTL resource:lock => -2
The -2 for the TTL of the key means that the key does not exist (anymore). A -1 for the TTL of the key means that it will never expire. Note that if you SET a key, its TTL will be reset.


    SET resource:lock "Redis Demo 1"
    EXPIRE resource:lock 120
    TTL resource:lock => 119
    SET resource:lock "Redis Demo 2"
    TTL resource:lock => -1
The SET command is actually able to accept further arguments in order to directly set a time to live (TTL) to a key, so you can alter the value of a key and set its TTL at the same time in a single atomic operation:


    SET resource:lock "Redis Demo 3" EX 5
    TTL resource:lock => 5
It is also possible to cancel the time to live of a key removing the expire and making the key permanent again.


    SET resource:lock "Redis Demo 3" EX 5
    PRESIST resource:lock
    TTL resource:lock => -1


## RPUSH | LPUSH | LRANGE | LPOP | RPOP

Redis also supports several more complex data structures. The first one we'll look at is a list. A list is a series of ordered values. Some of the important commands for interacting with lists are RPUSH, LPUSH, LLEN, LRANGE, LPOP, and RPOP. You can immediately begin working with a key as a list, as long as it doesn't already exist as a different type.

This concept is generally true for every Redis data structure: you don't create a key first, and add things to it later, but you can just directly use the command in order to add new elements. As side effect the key will be create if it did not exist. Similarly keys that will result empty after executing some command will automatically be removed from the key space.

RPUSH puts the new element at the end of the list.


    RPUSH friends "Alice"
    RPUSH friends "Bob"
LPUSH puts the new element at the start of the list.


    LPUSH friends "Sam"
