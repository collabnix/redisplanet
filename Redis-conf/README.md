# redis.conf

- Redis is able to start without a configuration file using a built-in default configuration
- The proper way to configure Redis is by providing a Redis configuration file, usually called redis.conf.
- The redis.conf file contains a number of directives that have a very simple format:


```
keyword argument1 argument2 ... argumentN
```


Example of configuration directive:

```
slaveof 127.0.0.1 6380
```

## Is it posible to pass arguments via the command line?

Yes. It is possible to also pass Redis configuration parameters using the command line directly. 
This is very useful for testing purposes. 

The following is an example that starts a new Redis instance using port 6380 as a slave of the instance running at 127.0.0.1 port 6379.


```
./redis-server --port 6380 --slaveof 127.0.0.1 6379
```

The format of the arguments passed via the command line is exactly the same as the one used in the redis.conf file, 
with the exception that the keyword is prefixed with --.

Note that internally this generates an in-memory temporary config file (possibly concatenating the config file passed by the user if any) where arguments are translated into the format of redis.conf.


## Is it possible to change Redis configuration while the server is running?

Yes, It is possible to reconfigure Redis on the fly without stopping and restarting the service, or 
querying the current configuration programmatically using the special commands [CONFIG SET](https://redis.io/commands/config-set)
and [CONFIG GET](https://redis.io/commands/config-get)

Not all the configuration directives are supported in this way, but most are supported as expected. 
Please refer to the CONFIG SET and CONFIG GET pages for more information.
Note that modifying the configuration on the fly has no effects on the redis.conf file so at the next restart of Redis the old 
configuration will be used instead.
Make sure to also modify the redis.conf file accordingly to the configuration you set using CONFIG SET. 

## Tell me something about CONFIG_REWRITE?

You can do it manually, or starting with Redis 2.8, you can just use [CONFIG REWRITE](https://redis.io/commands/config-rewrite), which will automatically scan your redis.conf file and update the fields which don't match the current configuration value. 
Fields non existing but set to the default value are not added. Comments inside your configuration file are retained.


## How to configure Redis as a Cache?

If you plan to use Redis just as a cache where every key will have an expire set, you may consider using the following configuration instead (assuming a max memory limit of 2 megabytes as an example):

```
maxmemory 2mb
maxmemory-policy allkeys-lru
```

In this configuration there is no need for the application to set a time to live for keys using the EXPIRE command (or equivalent) since all the keys will be evicted using an approximated LRU algorithm as long as we hit the 2 megabyte memory limit.
Basically in this configuration Redis acts in a similar way to memcached. 
