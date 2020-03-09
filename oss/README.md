

# What is Redis?

- Redis is in the family of databases called key-value stores.
- The essence of a key-value store is the ability to store some data, called a value, inside a key. 
- This data can later be retrieved only if we know the exact key used to store it.
- Often Redis it is called a data structure server because it has outer key-value shell, but each value can contain a complex data structure, such as a string, a list, a hashes, or ordered data structures called sorted sets as well as probabilistic data structures like hyperloglog.

- Redis is an open source (BSD licensed), in-memory data structure store, used as a database, cache, and message broker.
- Redis stores data using a key-value system and, as such, it is very easy to retrieve data since there are no complicated relationships or other operations making relational databases slow.

# What is Redis Good for?

Redis can be used for a number of things such as:

- Caching
- Counting
- Queues
- Pub and Sub

# What is Caching?

Caching is the process of storing data into a cache. A cache is a temporary data store where data is kept for later use.

A cache as a data store is easier for the client (or server) to reach, as opposed to a permanent data store that might be located on a different service, which takes more time and resources to reach (a database or an external API endpoint).


# How Caching Works.

The image below is not 100% accurate, since there is a lot going on under the hood and I had to keep it as simple as possible.





In the first illustration, the server queries the database every time a request for profile information comes from the client (Mr. Jide).

Let's assume Mr. Jide requests this data 30 times during his browsing session and each request takes 10 seconds to complete, the response time for all of the request-response times remain constant.

10secs * 30requests = 5 minutes.

In the second illustration, the server looks into the cache whenever Mr. Jide requests profile information and queries the database only if the data is not available in the cache (Redis).

One advantage of the second design over the first is that the response time for subsequent requests for the same data is shorter, since the data has been cached in memory (Redis) so there is no need to query the database, which is an expensive operation.

We also use less server resources, leading to an improvement in application performance.

Compared to querying the database, getting data from the cache is easier and faster for the server.

For the second design, let's assume the request-response cycle takes 5 seconds (after the first call), and Mr. Jide requests this data 30 times. How much time will the 30 requests take?

10secs * 1request = 10 seconds (Initial Request)
5secs * 29requests = 145seconds (Subsequent Requests)
Total: 10secs + 145secs = 2mins 35secs

Using the first design, the requests took a whooping 5 minutes while using the second design, the total trip time was 2mins 35secs.

This isn't just about speed! Imagine what difference it would make to your users and how much money you could save on server costs.


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


LRANGE gives a subset of the list. It takes the index of the first element you want to retrieve as its first parameter and the index of the last element you want to retrieve as its second parameter. A value of -1 for the second parameter means to retrieve elements until the end of the list, -2 means to include up to the penultimate, and so forth.


    LRANGE friends 0 -1 => 1) "Sam", 2) "Alice", 3) "Bob"
    LRANGE friends 0 1 => 1) "Sam", 2) "Alice"
    LRANGE friends 1 2 => 1) "Alice", 2) "Bob"


So far we explored the commands that let you add elements to the list, and LRANGE that let you inspect ranges of the list. A fundamental functionality of Redis lists is the ability to remove, and return to the client at the same time, elements in the head or the tail of the list.

LPOP removes the first element from the list and returns it.


    LPOP friends => "Sam"
RPOP removes the last element from the list and returns it.


    RPOP friends => "3"
Note that the list now only has four element:


    LLEN friends => 4
    LRANGE friends 0 -1 => 1) "Alice" 2) "Bob" 3) "1" 4) "2"


Both RPUSH and LPUSH commands are variadic, so you can specify multiple elements in the same command execution.


    RPUSH friends 1 2 3 => 6
Tip: RPUSH and LPUSH return the total length of the list after the operation.

You can also use LLEN to obtain the current length of the list.


    LLEN friends => 6
    
    
  The next data structure that we'll look at is a set. A set is similar to a list, except it does not have a specific order and each element may only appear once. Both the data structures are very useful because while in a list is fast to access the elements near the top or the bottom, and the order of the elements is preserved, in a set is very fast to test for membership, that is, to immediately know if a given element was added or not. Moreover in a set a given element can exist only in a single copy.

Some of the important commands in working with sets are SADD, SREM, SISMEMBER, SMEMBERS and SUNION.

SADD adds the given member to the set, again this command is also variadic.


    SADD superpowers "flight"
    SADD superpowers "x-ray vision" "reflexes"
SREM removes the given member from the set, returning 1 or 0 to signal if the member was actually there or not.


    SREM superpowers "reflexes" => 1
    SREM superpowers "making pizza" => 0
    
    
 SISMEMBER tests if the given value is in the set. It returns 1 if the value is there and 0 if it is not.


    SISMEMBER superpowers "flight" => 1
    SISMEMBER superpowers "reflexes" => 0
SMEMBERS returns a list of all the members of this set.


    SMEMBERS superpowers => 1) "flight", 2) "x-ray vision"
SUNION combines two or more sets and returns the list of all elements.


    SADD birdpowers "pecking"
    SADD birdpowers "flight"
    SUNION superpowers birdpowers => 1) "pecking", 2) "x-ray vision", 3) "flight"
    
    
    
 The return value fo SADD is as important as the one of SREM. If the element we try to add is already inside, then 1 is returned, otherwise SADD returns zero:


    SADD superpowers "flight" => 0
    SADD superpowers "invisibility" => 1
    
 
 Sets also have a command very similar to LPOP and RPOP in order to extract elements from the set and return them to the client in a single operation. However since sets are not ordered data structures the returned (and removed) elements are totally casual in this case.


    SADD letters a b c d e f => 6
    SPOP letters 2 => 1) "c" 2) "a"
The argument of SPOP after the name of the key, is the number of elements we want it to return, and remove from the set.

Now the set will have just the remaining elements:


    SMEMBERS letters => 1) "b" 2) "d" 3) "e" 4) "f"
There is also a command to return random elements without removing such elemetns from the set, it is called SRANDMEMBER. You can try it yourself, it works just like SPOP, but if you specify a negative count instead of a positive one, it may also return repeating elements.


Sets are a very handy data type, but as they are unsorted they don't work well for a number of problems. This is why Redis 1.2 introduced Sorted Sets.

A sorted set is similar to a regular set, but now each value has an associated score. This score is used to sort the elements in the set.


    ZADD hackers 1940 "Alan Kay"
    ZADD hackers 1906 "Grace Hopper"
    ZADD hackers 1953 "Richard Stallman"
    ZADD hackers 1965 "Yukihiro Matsumoto"
    ZADD hackers 1916 "Claude Shannon"
    ZADD hackers 1969 "Linus Torvalds"
    ZADD hackers 1957 "Sophie Wilson"
    ZADD hackers 1912 "Alan Turing"
In these examples, the scores are years of birth and the values are the names of famous hackers.


    ZRANGE hackers 2 4 => 1) "Claude Shannon", 2) "Alan Kay", 3) "Richard Stallman"

Simple strings, sets and sorted sets already get a lot done but there is one more data type Redis can handle: Hashes.

Hashes are maps between string fields and string values, so they are the perfect data type to represent objects (eg: A User with a number of fields like name, surname, age, and so forth):


    HSET user:1000 name "John Smith"
    HSET user:1000 email "john.smith@example.com"
    HSET user:1000 password "s3cret"
To get back the saved data use HGETALL:


    HGETALL user:1000
You can also set multiple fields at once:


    HMSET user:1001 name "Mary Jones" password "hidden" email "mjones@example.com"
If you only need a single field value that is possible as well:


    HGET user:1001 name => "Mary Jones"
    

Numerical values in hash fields are handled exactly the same as in simple strings and there are operations to increment this value in an atomic way.


    HSET user:1000 visits 10
    HINCRBY user:1000 visits 1 => 11
    HINCRBY user:1000 visits 10 => 21
    HDEL user:1000 visits
    HINCRBY user:1000 visits 1 => 1
Check the full list of Hash commands for more information.


