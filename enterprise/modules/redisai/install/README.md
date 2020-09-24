# Installing RedisAI on Jetson Nano in Easy steps

## Pre-requisite

- Jetson Nano Board
- Redis 6.x

RedisAI require Redis 6.x. You might have to compile the newer version of Redis to get it up and running.

### Installing Redis 6.x

Stop the running 

Follow the below steps:

```
$ wget http://download.redis.io/releases/redis-6.0.8.tar.gz
$ tar xzf redis-6.0.8.tar.gz
$ cd redis-6.0.8
$ make
$ sudo cp src/redis-server /usr/local/bin/
$ sudo cp src/redis-cli /usr/local/bin/

```



## Steps

### Clone the repository

```
git clone --recursive https://github.com/RedisAI/RedisAI
```

```
cd RedisAI
```

Download all the below scripts and place it under RedisAI directory.

- [install_redisai.sh](https://github.com/collabnix/redisplanet/blob/master/enterprise/modules/redisai/install/install_rediai.sh)
- [run_redisai_torch.sh](https://github.com/collabnix/redisplanet/blob/master/enterprise/modules/redisai/install/run_redisai_torch-sh)
- [test_redisai.sh](https://github.com/collabnix/redisplanet/blob/master/enterprise/modules/redisai/install/test_redisai-sh)

### Building RedisAI


```
sh build_redisai.sh
```



It will take sometime based on your internet speed.


### Running RedisAI with PyTorch

```
 sudo sh run_redisai_torch.sh 
14438:C 20 Sep 2020 14:06:50.321 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
14438:C 20 Sep 2020 14:06:50.321 # Redis version=6.0.6, bits=64, commit=00000000, modified=0, pid=14438, just started
14438:C 20 Sep 2020 14:06:50.321 # Configuration loaded
14438:M 20 Sep 2020 14:06:50.323 * Increased maximum number of open files to 10032 (it was originally set to 1024).
                _._                                                  
           _.-``__ ''-._                                             
      _.-``    `.  `_.  ''-._           Redis 6.0.6 (00000000/0) 64 bit
  .-`` .-```.  ```\/    _.,_ ''-._                                   
 (    '      ,       .-`  | `,    )     Running in standalone mode
 |`-._`-...-` __...-.``-._|'` _.-'|     Port: 6379
 |    `-._   `._    /     _.-'    |     PID: 14438
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

14438:M 20 Sep 2020 14:06:50.325 # WARNING: The TCP backlog setting of 511 cannot be enforced because /proc/sys/net/core/somaxconn is set to the lower value of 128.
14438:M 20 Sep 2020 14:06:50.325 # Server initialized
14438:M 20 Sep 2020 14:06:50.325 # WARNING you have Transparent Huge Pages (THP) support enabled in your kernel. This will create latency and memory usage issues with Redis. To fix this issue run the command 'echo never > /sys/kernel/mm/transparent_hugepage/enabled' as root, and add it to your /etc/rc.local in order to retain the setting after a reboot. Redis must be restarted after THP is disabled.
14438:M 20 Sep 2020 14:06:50.326 * <ai> Redis version found by RedisAI: 6.0.6 - oss
14438:M 20 Sep 2020 14:06:50.326 * <ai> RedisAI version 999999, git_sha=unknown
14438:M 20 Sep 2020 14:06:50.326 * Module 'ai' loaded from install-cpu/redisai.so
14438:M 20 Sep 2020 14:06:50.327 * Loading RDB produced by version 6.0.6
14438:M 20 Sep 2020 14:06:50.327 * RDB age 151321 seconds
14438:M 20 Sep 2020 14:06:50.327 * RDB memory usage when created 0.80 Mb
14438:M 20 Sep 2020 14:06:50.327 * DB loaded from disk: 0.000 seconds
14438:M 20 Sep 2020 14:06:50.327 * Ready to accept connections

```


## Testing RedisAI 



```
sh test_redisai.sh 

+ redis-cli -x AI.MODELSET m TORCH GPU
+ redis-cli AI.TENSORSET a FLOAT 2 2 VALUES 2 3 2 3
OK
+ redis-cli AI.TENSORSET b FLOAT 2 2 VALUES 2 3 2 3
OK
....
....
ajeetraina@ajeetraina-desktop:~/redisaiscript$ 

```


