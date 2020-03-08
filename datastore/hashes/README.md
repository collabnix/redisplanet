
# Hashes

Redis hashes data structure contains field-value pairs


```                                      
HMSET hmset user:1000     username      antirez    birthyear      1977      verified      1
                           <field>      <value>   <field>        <value>     <field>     <value>
```


Note: You might notice above that  the key “user:1000” this way we can simulate a table name + PK in the single key. This is just like any other key and can be used anywhere in Redis. 

## API
  - HMSET
  - HGET 
  - HMGET 
      - Is similar to HGET but might returns  an array of values

Hash value size < 512MB

# HMSET vs HSET

HMSET Sets the specified fields to their respective values in the hash stored at key. This command overwrites any specified fields already existing in the hash. If key does not exist, a new key holding a hash is created.
As per Redis 4.0.0, HMSET is considered deprecated. Please use HSET in new code.

- [Hashes](https://github.com/collabnix/redis/blob/master/datastructure/hashes/README.md)
  - [HSET](https://github.com/collabnix/redis/blob/master/datastructure/hashes/README.md#hset)
  - [HGET](https://github.com/collabnix/redis/blob/master/datastructure/hashes/README.md#hget)
  - [HINCRBY](https://github.com/collabnix/redis/blob/master/datastructure/hashes/README.md#hincrby)
  - [HGETALL](https://github.com/collabnix/redis/blob/master/datastructure/hashes/README.md#hgetall)



# Storing object data in hashes

## HSET

Let’s assume we want to store a number of fields about our users, such as a full name, email address, phone number, and number of visits to our application. We’ll
use Redis’s hash management commands—like HSET, HGET, and HINCRBY—to store this information

```
127.0.0.1:12000>  hset users:jdoe name "John Doe"
(integer) 1
127.0.0.1:12000>  hset users:jdoe email "jdoe@test.com"
(integer) 1
127.0.0.1:12000>  hset users:jdoe phone "+1555313940"
(integer) 1
```

## HINCRBY

```
127.0.0.1:12000> hincrby users:jdoe visits 1
(integer) 1
```

## HGET

```
127.0.0.1:12000>  hget users:jdoe email
"jdoe@test.com"
```

## HGETALL

```
127.0.0.1:12000> hgetall users:jdoe
1) "name"
2) "John Doe"
3) "email"
4) "jdoe@test.com"
5) "phone"
6) "+1555313940"
7) "visits"
8) "1"
127.0.0.1:12000>
```
