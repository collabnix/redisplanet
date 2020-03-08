# Redis Graph

A Graph Database built on top of Redis

## Why is it needed?

- Facebook Social Media might be using it to connect you to new friends
- Companies like Ways might be using it find Quickest Route from Home to work
- Company might be using Graph for Network Load Balancing


# Using RedisGraph using Docker


```
$ docker run -dit -p 6379:6379 -it --rm redislabs/redisgraph
Unable to find image 'redislabs/redisgraph:latest' locally
latest: Pulling from redislabs/redisgraph
bc51dd8edc1b: Pull complete 
37d80eb324ee: Pull complete 
392b7748dfaf: Pull complete 
48df82c3534d: Pull complete 
2ec2bb0b4b0e: Pull complete 
1302bce0b2cb: Pull complete 
ed3429228972: Pull complete 
922f57f50ba0: Pull complete 
Digest: sha256:62f59b3bc19f4bd56f61cc1c6ac7b1ba6cd9fc597aba17db5481ee9c547617f2
Status: Downloaded newer image for redislabs/redisgraph:latest
1:C 08 Mar 2020 13:30:51.299 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
1:C 08 Mar 2020 13:30:51.299 # Redis version=5.0.7, bits=64, commit=00000000, modified=0, pid=1, just started
1:C 08 Mar 2020 13:30:51.299 # Configuration loaded
                _._                                                  
           _.-``__ ''-._                                                   _.-``    `.  `_.  ''-._           Redis 5.0.7 (00000000/0) 64 bit  .-`` .-```.  ```\/    _.,_ ''-._                                   
 (    '      ,       .-`  | `,    )     Running in standalone mode
 |`-._`-...-` __...-.``-._|'` _.-'|     Port: 6379
 |    `-._   `._    /     _.-'    |     PID: 1
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

1:M 08 Mar 2020 13:30:51.315 # WARNING: The TCP backlog setting of 511 cannot be enforced because /proc/sys/net/core/somaxconn is set to the lower value of 128.
1:M 08 Mar 2020 13:30:51.316 # Server initialized
1:M 08 Mar 2020 13:30:51.317 # WARNING overcommit_memory is set to 0! Background save may fail under low memory condition. To fix this issue add 'vm.overcommit_memory = 1' to /etc/sysctl.conf and then reboot or run the command 'sysctl vm.overcommit_memory=1' for this to take effect.
1:M 08 Mar 2020 13:30:51.318 # WARNING you have Transparent Huge Pages (THP) support enabled in your kernel. This will create latency and memory usage issues with Redis. To fix this issue run the command 'echo never > /sys/kernel/mm/transparent_hugepage/enabled' as root, and add it to your /etc/rc.local in order to retain the setting after a reboot. Redis must be restarted after THP is disabled.
1:M 08 Mar 2020 13:30:51.333 * <graph> Thread pool created, using 8 threads.
1:M 08 Mar 2020 13:30:51.334 * Module 'graph' loaded from /usr/lib/redis/modules/redisgraph.so
1:M 08 Mar 2020 13:30:51.334 * Ready to accept connections
```

```
$ docker ps
CONTAINER ID        IMAGE                  COMMAND                  CREATED             STATUS              PORTS                    NAMES
31f1c9d2daa8        redislabs/redisgraph   "docker-entrypoint.s…"   11 seconds ago      Up 10 seconds       0.0.0.0:6379->6379/tcp   stupefied_dijkstra
```


Here we'll quickly create a small graph representing a subset of motorcycle riders and teams taking part in the MotoGP league. Once created, we'll start querying our data.

```
$ docker exec -it 14eb bash
root@14eb75e19d2b:/data# redis-cli
```

```
$ redis-cli
127.0.0.1:6379> GRAPH.QUERY MotoGP "CREATE (:Rider {name:'Valentino Rossi'})-[:rides]->(:Team {name:'Yamaha'}), (:Rider {name:'Dani Pedrosa'})-[:rides]->(:Team {name:'Honda'}), (:Rider {name:'Andrea Dovizioso'})-[:rides]->(:Team {name:'Ducati'})"
```

```
1) 1) Labels added: 2
   2) Nodes created: 6
   3) Properties set: 6
   4) Relationships created: 3
   5) "Query internal execution time: 0.399000 milliseconds"
 ```
 
 Now that our MotoGP graph is created, we can start asking questions. For example: Who's riding for team Yamaha?
 
 ```
 127.0.0.1:6379> GRAPH.QUERY MotoGP "MATCH (r:Rider)-[:rides]->(t:Team) WHERE t.name = 'Yamaha' RETURN r.name, t.name"
1) 1) "r.name"
   2) "t.name"
2) 1) 1) "Valentino Rossi"
      2) "Yamaha"
3) 1) "Query internal execution time: 0.625399 milliseconds"
```

How many riders represent team Ducati?

```
127.0.0.1:6379> GRAPH.QUERY MotoGP "MATCH (r:Rider)-[:rides]->(t:Team {name:'Ducati'}) RETURN count(r)"
```

```
1) 1) "count(r)"
2) 1) 1) (integer) 1
3) 1) "Query internal execution time: 0.624435 milliseconds"
```

# Concept:

G(V,E) - Vertices & Edges

![My Image]()

Building Blocks

- Nodes
- Relationships
- Labels/ Relationship Types
- Properties

## Node 
Simply a reference to Redis Hash

A Node called "Linus Torvald" pointing to Redis Hash which has some properties like shown below;


Linus Torvald ================>.  Linus Torvald {
                                   First_Name: Linus 
                                   Age: "59"
                                   }
 
# Relations


Once we have node, we would like to connect them,

Linus. =============. VISIT. =====================.  Finland

# How to store Graph in Redis?

With the help of Hexastore

```
Subject.   Predicate            Object
     S           P                  0
```

     
We store all 6 permutation of the relationship

```
SPO
SOP
OPS                       Linus visit Finland
OSP                         (S)  (P)  (0)
PSO
POS
```

