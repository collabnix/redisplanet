# Set

- Unordered collections of strings 
- SADD adds new elements to a set 
- It's also possible to do a number of other operations against sets like:
   - testing if a given element already exists
   - performing the intersection, union or  difference between multiple sets, and so forth


```
127.0.0.1:6379> sadd myset 1 2 3 
(integer) 3
127.0.0.1:6379> smembers myset
1) "1"
2) "2"
3) "3"
127.0.0.1:6379> sismember myset 3
(integer) 1
127.0.0.1:6379> 
```

## Set operations UNION etc…


## SUNION
Returns the members of the set resulting  from the union of all the given sets

## SINTER
Returns the members of the set resulting  from the intersection of all the given sets


## SDIFF
Returns the members of the set resulting  from the difference between the first set  and all the successive sets


```
127.0.0.1:6379> sadd key1 "a" "b" "c"
(integer) 3
127.0.0.1:6379> sadd key2 "c" "d" "e"
(integer) 3
127.0.0.1:6379> sunion key1 key2
1) "a"
2) "b"
3) "c"
4) "e"
5) "d"
127.0.0.1:6379>
```
