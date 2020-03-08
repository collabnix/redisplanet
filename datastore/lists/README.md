# Lists

- A sequence of ordered elements 
10,20,1,2,3 is a list 

- Redis lists are implemented via Linked Lists 
- Adding a new element in the head with the LPUSH command or in the tail of the list is performed in constant time
- Same for a list with 10 or 1M elements
- Every list value (Element) can be up to 512MB
- Accessing an element by index is not so fast in lists implemented by linked lists
- Redis Lists are implemented with linked lists


# Basic API of Lists

- LPUSH command adds a new element  into a list, on the left (at the head)
- RPUSH command adds a new element  into a list ,on the right (at the tail)
- LRANGE command extracts ranges of  elements from lists
- Takes two indexes, the first and the last element  of the range to return 
- Both the indexes can be negative
- -1 is the last element  -2 is the penultimate element of the list, and so forth

## Example:

```
127.0.0.1:6379> rpush mylist A
(integer) 1
127.0.0.1:6379> rpush mylist B
(integer) 2
127.0.0.1:6379> lpush mylist first
(integer) 3
127.0.0.1:6379> lrange mylist 0 -1
1) "first"
2) "A"
3) "B"
127.0.0.1:6379> 
```

## Please Note:

- LPUSH and RPUSH  allow for variable number of parameters commands
- You can push multiple elements into a list in a single call

## Example:

```
127.0.0.1:6379> rpush mylist 2 3 4 5 "foo bar"
(integer) 8
127.0.0.1:6379> lrange mylist 0 -1
1) "first"
2) "A"
3) "B"
4) "2"
5) "3"
6) "4"
7) "5"
8) "foo bar"
127.0.0.1:6379>
```


# RPOP and LPOP


Popping elements is the operation of both 
 - retrieving the element from the list, and 
 - eliminating it from the list
 
 
```
127.0.0.1:6379> lrange mylist 0 -1
1) "first"
2) "A"
3) "B"
4) "2"
5) "3"
6) "4"
7) "5"
8) "foo bar"
127.0.0.1:6379> rpush mylist a b c
(integer) 11
127.0.0.1:6379> rpop mylist
"c"
127.0.0.1:6379> rpop mylist
"b"
127.0.0.1:6379> rpop mylist
"a"
127.0.0.1:6379> rpop mylist
"foo bar"
127.0.0.1:6379>
```


## Common Usage of Lists

- Remember the latest updates posted by users into a social network

- Communication between processes 
  - using a consumer-producer pattern where the producer pushes items into a list, and a consumer (usually a worker) consumes those items and executed actions 
  
  
          LPUSH                        RPOP
Producer  =======> | M3 | M2 | M1 |  =========> Consumer


  - Redis has special list commands to make this use case both more reliable and efficient
 BRPOP and BLPOP are blocking xPOP operation which will wait for a value to be in the list 


          LPUSH                        BRPOP
Producer  =======> | M3 | M2 | M1 |  =========> Consumer


## Capped Lists using LTRIM


- Use the LTRIM command to use lists as a capped collection, 
- Only remembering the latest N items and discarding all the oldest items


## Example:

```
127.0.0.1:6379> flushall
OK
127.0.0.1:6379> rpush mylist 1 2 3 4 5 
(integer) 5
127.0.0.1:6379> lrange mylist 0 -1
1) "1"
2) "2"
3) "3"
4) "4"
5) "5"
127.0.0.1:6379> ltrim mylist 0 2
OK
127.0.0.1:6379> lrange mylist 0 -1
1) "1"
2) "2"
3) "3"
127.0.0.1:6379> 
```
