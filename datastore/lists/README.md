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
