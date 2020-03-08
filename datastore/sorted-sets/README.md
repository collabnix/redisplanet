# Sorted Sets

- A mix between a Set and a Hash
- Like sets, sorted sets are composed of unique, non-repeating string elements
- Every element in a sorted set is associated with a floating point value  called the score 
- Similar to a hash, since every element is mapped to a value


## Sorted Ordering

- Elements in a sorted sets are taken in order. They are ordered according to the following rule
  - If A and B are two elements with a different score, then A > B if A.score is > B.score
  - If A and B have exactly the same score, then A > B if the A string is lexicographically greater than the B string. A and B    
    strings can't be equal since sorted sets only have unique elements

- Use  ZADD in order to add values  to a sorted set
- Sorted sets support all set  operations


```
                     <key>   <score>  <value>
127.0.0.1:6379> zadd hackers   200    "viraj"

(integer) 0
127.0.0.1:6379> zadd hackers 150 "deepu"
(integer) 1
127.0.0.1:6379>
```


