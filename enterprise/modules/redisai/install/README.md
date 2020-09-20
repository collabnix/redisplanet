# Installing RedisAI on Jetson Nano in Easy steps

## Pre-requisite

- Jetson Nano Board


## Steps

Clone the repository

```
git clone --recursive https://github.com/RedisAI/RedisAI
```

```
cd RedisAI
```

Copy all these scripts under RedisAI directory and execute these scripts in this order:

```
sh build_redisai.sh
```



It will take sometime based on your internet speed.



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





```
sh test_redisai.sh
```




