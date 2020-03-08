# Strings

- Strings are the most basic kind of Redis value 
- Redis Strings are binary safe
- A Redis string can contain any kind of data, for instance a JPEG image or a serialized Ruby object


```
> set a1 10
> get a1
```

# SET Vs GET

- SET and the GET commands are the way we set and retrieve a string value
- SET performs an assignment
- SET will replace any existing value already stored into the key 
- Values can be strings (including binary data) of every kind, for instance you can store a jpeg image inside a key

# Set Command

- The SET command has interesting options, that are provided as additional arguments 

## EX seconds 
Set the specified expire time, in seconds

## PX milliseconds 
Set the specified expire time, in milliseconds

## NX 
Only set the key if it does not already exist

## XX 
Only set the key if it already exist

## Example:

```
127.0.0.1:6379> get a1
"100"
127.0.0.1:6379> set a1 101 xx
OK
127.0.0.1:6379> get a1
"101"
127.0.0.1:6379> set a1 102 nx
(nil)
127.0.0.1:6379> get a1
"101"
127.0.0.1:6379> 
```

# Altering & Querying Redis Keyspace

- EXISTS command returns 1 or 0 to signal if a given key exists or not in the database 
- DEL command deletes a key and associated value, whatever the value is
   - Returns 1 or 0 depending on whether the key was removed
- These commands can be used on all keys regardless of the value  data structure

## Example:

```
127.0.0.1:6379> set z1 hello
OK
127.0.0.1:6379> exists z1
(integer) 1
127.0.0.1:6379> del z1
(integer) 1
127.0.0.1:6379> exists z1
(integer) 0
127.0.0.1:6379>
```

# String with Integer Values - INCR


- Use Strings as atomic counters using commands in the INCR family: 
    - INCR, 
    - DECR, 
    - INCRBY, 
    - DECRBY
- Even if strings are the basic values of Redis, there are interesting operations you can perform with them 
- For instance, one is atomic increment

## Example:

```
127.0.0.1:6379> set counter 100
OK
127.0.0.1:6379> incr counter
(integer) 101
127.0.0.1:6379> incr counter
(integer) 102
127.0.0.1:6379> incrby counter 50
(integer) 152
127.0.0.1:6379>
```

# MSET and MGET

- MSET and MGET commands enable to set or retrieve the value of multiple keys in a single command is also useful for reduced latency

## Example:

```
127.0.0.1:6379> mset a 10 b 20 c 30
OK
127.0.0.1:6379> mget a b c 
1) "10"
2) "20"
3) "30"
127.0.0.1:6379> 
```

- GETSET command sets a key to a new value, returning the old value as the result


# Keys Expiration

- Set using seconds or milliseconds precision
- However the expire time resolution is always 1 millisecond
- Information about expires are  replicated and persisted on disk,  the time virtually passes when your  Redis server remains stopped 
- Redis saves the date when a key will expire

## Example:

```
127.0.0.1:6379> set key 150
OK
127.0.0.1:6379> expire key 10
(integer) 1
127.0.0.1:6379> ttl key
(integer) 5
127.0.0.1:6379> get key
(nil)
127.0.0.1:6379> 
```

