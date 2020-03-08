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
