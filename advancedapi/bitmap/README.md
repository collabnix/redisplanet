# BITMAP

- Bitmaps are a set of bit-oriented operations defined on the String type 
- Are not an actual data type
- Since strings are binary safe blobs and their maximum length is 512 MB, Bits are set and retrieved using 
   - SETBIT and 
   - GETBIT commands
   
   
 ```
 127.0.0.1:6379> SETBIT key 10 1
(integer) 0
 
127.0.0.1:6379> getbit key 10
(integer) 1
127.0.0.1:6379> getbit key 11
(integer) 0
127.0.0.1:6379> 
```

# BITMAP BITOP Command

- The BITOP command supports four bitwise operations: 
   - AND, 
   - OR, 
   - XOR and 
   - NOT
   
 Thus the valid forms to call the command are:
 
 ```
 >BITOP AND destkey srckey1 srckey2 srckey3 ... srckeyN
>BITOP OR destkey srckey1 srckey2 srckey3 ... srckeyN
>BITOP XOR destkey srckey1 srckey2 srckey3 ... srckeyN
>BITOP NOT destkey srckey
```
