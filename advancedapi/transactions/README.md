# Transactions

A Redis transaction is entered using the MULTI command 

-  At this point the user can issue multiple commands 
-  Instead of executing these commands, Redis will queue them 
-  All the commands are executed once EXEC is called 
    commands are executed as a single isolated operation
-  Calling DISCARD instead will flush the transaction queue and will exit the transaction

```
127.0.0.1:6379> multi
OK
127.0.0.1:6379> incr foo
QUEUED
127.0.0.1:6379> incr bar
QUEUED
127.0.0.1:6379> exec
1) (integer) 1
2) (integer) 1
127.0.0.1:6379> 
```
