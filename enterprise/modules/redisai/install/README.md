# Installing RedisAI on Jetson Nano in Easy steps

- RedisAI is a Redis module for executing Deep Learning/Machine Learning models and managing their data. 
- Its purpose is being a “workhorse” for model serving, by providing out-of-the-box support for popular DL/ML frameworks and unparalleled performance. 
- RedisAI both simplifies the deployment and serving of graphs by leveraging on Redis’ production-proven infrastructure, as well as maximizes computation throughput by adhering to the principle of data locality.

This introduction is intended to present the core concepts it uses and the functionality it provides.


<details><summary>
How RedisAI works 
 </summary>
 
RedisAI bundles together best-of-breed technologies for delivering stable and performant computation graph serving. Every DL/ML framework ships with a runtime for executing the models developed with it, and the common practice for serving these is building a simple server around them.

RedisAI aims to be that server, saving you from the need of installing the backend you’re using and developing a server for it. By itself that does not justify RedisAI’s existence so there’s more to it. Because RedisAI is implemented as a Redis module it automatically benefits from the server’s capabilities: be it Redis’ native data types, its robust eco-system of clients, high-availability, persistence, clustering, and Enterprise support.

Because Redis is an in-memory data structure server RedisAI uses it for storing all of its data. The main data type supported by RedisAI is the Tensor that is the standard representation of data in the DL/ML domain. Because tensors are stored in the memory space of the Redis server, they are readily accessible to any of RedisAI’s backend libraries at minimal latency.

The locality of data, which is tensor data in adjacency to DL/ML models backends, allows RedisAI to provide optimal performance when serving models. It also makes it a perfect choice for deploying DL/ML models in production and allowing them to be used by any application.

Furthermore, RedisAI is also an optimal testbed for models as it allows the parallel execution of multiple computation graphs and, in future versions, assessing their respective performance in real-time.
</details>


## Pre-requisite

- Jetson Nano Board
- Power Adapter(5V 4A)
- WiFi Module
- Redis 6.x

RedisAI require Redis 6.x. You might have to compile the newer version of Redis to get it up and running.

### Installing Redis 6.x



Follow the below steps:

```
$ wget http://download.redis.io/releases/redis-6.0.8.tar.gz
$ tar xzf redis-6.0.8.tar.gz
$ cd redis-6.0.8
$ make
$ sudo cp src/redis-server /usr/local/bin/
$ sudo cp src/redis-cli /usr/local/bin/

```
In case you are not able to stop Redis service, follow the below steps

```
redis-cli
127.0.0.1> shutdown
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

Before you execute the below script, provide sufficient permission to redisai.so

```
/RedisAI/install-cpu$ sudo chmod 755 redisai.so 
```

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

## Using RedisAI tensors 

A tensor is an n-dimensional array and is the standard representation for data in DL/ML workloads. RedisAI adds to Redis a Tensor data structure that implements the tensor type. Like any datum in Redis, RedisAI’s Tensors are identified by key names.

Creating new RedisAI tensors is done with the AI.TENSORSET command. For example, consider the tensor:

tensorA

We can create the RedisAI Tensor with the key name ‘tA’ with the following command:

```
AI.TENSORSET tA FLOAT 2 VALUES 2 3
```

Copy the command to your cli and hit the <ENTER> on your keyboard to execute it. It should look as follows:

```
$ redis-cli
127.0.0.1:6379> AI.TENSORSET tA FLOAT 2 VALUES 2 3
OK
```

The reply ‘OK’ means that the operation was successful. We’ve called the AI.TENSORSET command to set the key named ‘tA’ with the tensor’s data, but the name could have been any string value. The FLOAT argument specifies the type of values that the tensor stores, and in this case a single-precision floating-point. After the type argument comes the tensor’s shape as a list of its dimensions, or just a single dimension of 2.

The VALUES argument tells RedisAI that the tensor’s data will be given as a sequence of numeric values and in this case the numbers 2 and 3. This is useful for development purposes and creating small tensors, however for practical purposes the AI.TENSORSET command also supports importing data in binary format.

The Redis key ‘tA’ now stores a RedisAI Tensor. We can verify that using standard Redis commands such as EXISTS and TYPE:

```
127.0.0.1:6379> EXISTS tA
(integer) 1
127.0.0.1:6379> TYPE tA
AI_TENSOR
```

Using AI.TENSORSET with the same key name, as long as it already stores a RedisAI Tensor, will overwrite the existing data with the new. To delete a RedisAI tensor, use the Redis DEL command.

RedisAI Tensors are used as inputs and outputs in the execution of models and scripts. For reading the data from a RedisAI Tensor value there is the AI.TENSORGET command:

```
127.0.0.1:6379> AI.TENSORGET tA VALUES
1) INT8
2) 1) (integer) 2
3) 1) (integer) 2
    1) (integer) 3

```

