# SCAN

- Getting a list of keys
- The SCAN command and the closely related commands SSCAN, HSCAN and ZSCAN are used in order to incrementally iterate over a collection of elements.
- You can use as a cursor for iterating key value pairs

Example using SCAN in command line mode:

```
ubuntu@ip-172-31-25-81:~$ redis-cli
127.0.0.1:6379> set a1 200
OK
127.0.0.1:6379> set b1 3000
OK
127.0.0.1:6379> set c1 4000
OK
127.0.0.1:6379> exit
ubuntu@ip-172-31-25-81:~$ redis-cli --scan | head -n 20
a1
c1
b1
ubuntu@ip-172-31-25-81:~$ 
```

```
ubuntu@ip-172-31-25-81:~$ redis-cli --scan --pattern "*1"
a1
c1
b1
ubuntu@ip-172-31-25-81:~$
```


## More on SCAN

- Scan returns 2 values
  - Next cursor to use in next scan 
  - Array of keys
- Use next cursor in next scan command

```
ubuntu@ip-172-31-25-81:~$ redis-cli
127.0.0.1:6379> scan 0
1) "0"
2) 1) "a1"
   2) "c1"
   3) "b1"
127.0.0.1:6379> 
```
