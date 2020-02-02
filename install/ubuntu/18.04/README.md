# Install Redis Open Source on Ubuntu 18.04

## Pre-requisites:

```
ubuntu@ts-qualification-sa-ajeet-raina-1:~$ wget http://download.redis.io/releases/redis-3.0.7.tar.g
z
--2019-12-03 05:08:54--  http://download.redis.io/releases/redis-3.0.7.tar.gz
Resolving download.redis.io (download.redis.io)... 109.74.203.151
Connecting to download.redis.io (download.redis.io)|109.74.203.151|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1375200 (1.3M) [application/x-gzip]
Saving to: ‘redis-3.0.7.tar.gz’
redis-3.0.7.tar.gz       100%[==================================>]   1.31M  1.68MB/s    in 0.8s    
2019-12-03 05:08:55 (1.68 MB/s) - ‘redis-3.0.7.tar.gz’ saved [1375200/1375200]
ubuntu@ts-qualification-sa-ajeet-raina-1:~$ tar xzf redis-3.0.7.tar.gz 
ubuntu@ts-qualification-sa-ajeet-raina-1:~$ cd redis-3.0.7/
ubuntu@ts-qualification-sa-ajeet-raina-1:~/redis-3.0.7$ sudo make
```

## Install Make

```
ubuntu@ts-qualification-sa-ajeet-raina-1:~/redis-3.0.7$ sudo apt install make 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Suggested packages:
  make-doc
The following NEW packages will be installed:
  make
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 151 kB of archives.
After this operation, 365 kB of additional disk space will be used.
Get:1 http://us-west1.gce.archive.ubuntu.com/ubuntu xenial/main amd64 make amd64 4.1-6 [151 kB]
Fetched 151 kB in 0s (897 kB/s)
Selecting previously unselected package make.
(Reading database ... 71027 files and directories currently installed.)
Preparing to unpack .../archives/make_4.1-6_amd64.deb ...
Unpacking make (4.1-6) ...
Processing triggers for man-db (2.7.5-1) ...
```


If you encounter an issue related to below message:

```
zmalloc.h:50:31: error: jemalloc/jemalloc.h: No such file or directory
zmalloc.h:55:2: error: #error "Newer version of jemalloc required"
```

These errors were caused by some files left here after the failure of the first make command. Apparently I had to clean these files, with the command :

Follow the below steps to fix it:

```
sudo apt install gcc
sudo make distclean
```


And then make again, and it worked.



```
   CC blocked.o
    CC hyperloglog.o
    CC latency.o
    CC sparkline.o
    LINK redis-server
    INSTALL redis-sentinel
    CC redis-cli.o
    LINK redis-cli
    CC redis-benchmark.o
    LINK redis-benchmark
    CC redis-check-dump.o
    LINK redis-check-dump
    CC redis-check-aof.o
    LINK redis-check-aof

Hint: It's a good idea to run 'make test' ;)

make[1]: Leaving directory '/home/ubuntu/redis-3.0.7/src'
```

```
dockercaptain81@server-a:~/redis-3.0.7$ sudo make install
cd src && make install
make[1]: Entering directory '/home/dockercaptain81/redis-3.0.7/src'
Hint: It's a good idea to run 'make test' ;)
    INSTALL install
    INSTALL install
    INSTALL install
    INSTALL install
    INSTALL install
make[1]: Leaving directory '/home/dockercaptain81/redis-3.0.7/src'
```

## Starting Redis Server 




```
src/redis-server 
22562:C 03 Dec 05:16:20.677 # Warning: no config file specified, using the default config. In order to specify a config file use src/redis-server /path/to/redis.conf
22562:M 03 Dec 05:16:20.678 * Increased maximum number of open files to 10032 (it was originally set to 1024).
                _._                                                  
           _.-``__ ''-._                                             
      _.-``    `.  `_.  ''-._           Redis 3.0.7 (00000000/0) 64 bit
  .-`` .-```.  ```\/    _.,_ ''-._                                   
 (    '      ,       .-`  | `,    )     Running in standalone mode
 |`-._`-...-` __...-.``-._|'` _.-'|     Port: 6379
 |    `-._   `._    /     _.-'    |     PID: 22562
  `-._    `-._  `-./  _.-'    _.-'                                   
 |`-._`-._    `-.__.-'    _.-'_.-'|                                  
 |    `-._`-._        _.-'_.-'    |           http://redis.io        
  `-._    `-._`-.__.-'_.-'    _.-'                                   
 |`-._`-._    `-.__.-'    _.-'_.-'|                                  
 |    `-._`-._        _.-'_.-'    |                                  
  `-._    `-._`-.__.-'_.-'    _.-'                                   
      `-._    `-.__.-'    _.-'                                       
          `-._        _.-'                                           
              `-.__.-'                                               

22562:M 03 Dec 05:16:20.678 # WARNING: The TCP backlog setting of 511 cannot be enforced because /proc/sys/net/core/somaxconn is set to the lower value of 128.
22562:M 03 Dec 05:16:20.678 # Server started, Redis version 3.0.7
22562:M 03 Dec 05:16:20.678 # WARNING overcommit_memory is set to 0! Background save may fail under low memory condition. To fix this issue add 'vm.overcommit_memory = 1' to /etc/sysctl.conf and then reboot or run the command 'sysctl vm.overcommit_memory=1' for this to take effect.
22562:M 03 Dec 05:16:20.679 # WARNING you have Transparent Huge Pages (THP) support enabled in your kernel. This will create latency and memory usage issues with Redis. To fix this issue run the command 'echo never > /sys/kernel/mm/transparent_hugepage/enabled' as root, and add it to your /etc/rc.local in order to retain the setting after a reboot. Redis must be restarted after THP is disabled.
22562:M 03 Dec 05:16:20.679 * The server is now ready to accept connections on port 6379
```


## Shutting down Redis

```
ubuntu@ts-qualification-sa-ajeet-raina-1:~/redis-3.0.7$ src/redis-cli shutdown
22574:M 03 Dec 05:21:20.448 # User requested shutdown...
22574:M 03 Dec 05:21:20.448 * Saving the final RDB snapshot before exiting.
22574:M 03 Dec 05:21:20.475 * DB saved on disk
22574:M 03 Dec 05:21:20.475 # Redis is now ready to exit, bye bye...
[1]+  Done                    src/redis-server
```

## How to change Redis-server Port

```
ubuntu@ts-qualification-sa-ajeet-raina-1:~/redis-3.0.7$ src/redis-server redis.conf 
22696:M 03 Dec 05:23:51.105 * Increased maximum number of open files to 10032 (it was originally set
 to 1024).
                _._                                                  
           _.-``__ ''-._                                             
      _.-``    `.  `_.  ''-._           Redis 3.0.7 (00000000/0) 64 bit
  .-`` .-```.  ```\/    _.,_ ''-._                                   
 (    '      ,       .-`  | `,    )     Running in standalone mode
 |`-._`-...-` __...-.``-._|'` _.-'|     Port: 6666
 |    `-._   `._    /     _.-'    |     PID: 22696
  `-._    `-._  `-./  _.-'    _.-'                                   
 |`-._`-._    `-.__.-'    _.-'_.-'|                                  
 |    `-._`-._        _.-'_.-'    |           http://redis.io        
  `-._    `-._`-.__.-'_.-'    _.-'                                   
 |`-._`-._    `-.__.-'    _.-'_.-'|                                  
 |    `-._`-._        _.-'_.-'    |                                  
  `-._    `-._`-.__.-'_.-'    _.-'                                   
      `-._    `-.__.-'    _.-'                                       
          `-._        _.-'                                           
              `-.__.-'                                               
22696:M 03 Dec 05:23:51.105 # WARNING: The TCP backlog setting of 511 cannot be enforced because /pr
oc/sys/net/core/somaxconn is set to the lower value of 128.
22696:M 03 Dec 05:23:51.106 # Server started, Redis version 3.0.7
22696:M 03 Dec 05:23:51.106 # WARNING overcommit_memory is set to 0! Background save may fail under 
low memory condition. To fix this issue add 'vm.overcommit_memory = 1' to /etc/sysctl.conf and then 
reboot or run the command 'sysctl vm.overcommit_memory=1' for this to take effect.
22696:M 03 Dec 05:23:51.106 # WARNING you have Transparent Huge Pages (THP) support enabled in your 
kernel. This will create latency and memory usage issues with Redis. To fix this issue run the comma
nd 'echo never > /sys/kernel/mm/transparent_hugepage/enabled' as root, and add it to your /etc/rc.lo
cal in order to retain the setting after a reboot. Redis must be restarted after THP is disabled.
22696:M 03 Dec 05:23:51.119 * DB loaded from disk: 0.014 seconds
```
