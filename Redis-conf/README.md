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


## How to use Redis as an LRU cache?

Refer [this](https://github.com/collabnix/redisplanet/blob/master/Redis-conf/redis-as-lru-cache/README.md) link

## Where can I find a sample Redis.conf

Refer [this](http://download.redis.io/redis-stable/redis.conf) link

## Tell me about the structure of Redis.conf


- Lines beginning with a # are comments and are ignored
- Directives are given using the syntax keyword value [value …]
- String values should be enclosed with quotes when containing spaces
- The empty string ("") is a valid value
- Depending on the configuration directive, the value of '0' usually means off
- Size values (e.g. maxmemory) are given in bytes, unless an explicit suffix is used (e.g. '10mb' and '50gb')


## Tell me more about Runtime Configuration?

The configuration of an online server can be inspected using the the CONFIG GET command. Note that the command supports glob-like patterns, so if you don't remember the exact keyword you can still use it, e.g. CONFIG GET maxmem* or even CONFIG GET *.

Note: the values of some configuration directives are also reported in INFO's output.

The value of most configuration settings can be changed while the server is running and without interruption to the service using the CONFIG SET command. That said, a few directives can only be set at startup and cannot be changed during runtime, including: bind, port, unixsocket, unixsocketperm, daemonize, supervised and rename-command.

Also, a several of the directives can only be changed using specialized commands rather then CONFIG SET. These include:

- The slaveof directive is managed during runtime with the 'SLAVEOF' command
- Modules are loaded using the MODULE LOAD command

Runtime configuration changes that you perform are not persisted, and configuration settings will revert to their previously-defined/default values upon the next server restart. To persist such changes they have to be stored in the server's configuration file - do so by either editing the file directly, or use the CONFIG REWRITE command.
