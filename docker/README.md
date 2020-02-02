# Test Drive Redis Enterprise Software on Play with Docker Platform

 
 ## Pre-requisite:
 
 - Play with Docker Platform
 
 ## Steps
 
 ```
 docker run -d --cap-add sys_resource --name rp -p 8443:8443 -p 9443:9443 -p 12000:12000 redislabs/redis
 ```
 
Visit http://IP:8443 to open Redis Labs Enterprise Software. 
The Docker container with RS runs on your localhost with port 8443 open for HTTPS connections, 9443 for REST API connections, and port 12000 open for redis client connections. You can publish other ports with -p <host_port>:<container_port>.
Click Setup to start the node configuration steps.


You will see "Enable flash storage support" checkbox. What does it mean?
 
 
# Redis on flash

Redis Labs Enterprise Software (RS) is available on Flash, bringing the same performance of running Redis on RAM at just a fraction of the cost, thanks to significantly reduced RAM requirements. The underlying technology of Redis on Flash uses Flash as RAM extension, rather than as persistent storage. The global key list and all ‘hot’ values are kept in RAM, while all ‘cold’ values (those which typically account for the larger part of the dataset) are kept in Flash. Multi-threaded and asynchronous Redis is used to access objects on Flash, leveraging multi-core and Flash concurrency architecture. A Redis on Flash database is fully compatible with all Redis clients, data types, and commands.

RS Flash is extremely suitable for scenarios in which values are significantly larger than the keys, and where 10-40% of all objects are "hot" objects.

In many cases, RS Flash can cut resource costs by up to 70% compared with an all-RAM deployment.

The ratio of RAM to Flash can be easily set and updated in runtime, so you can optimize performance based on your specific use case.

RS Flash characteristics and features are identical to those of standard RS. The technology is available in an x86 / 64-bit version and a POWER version (as part of the IBM NoSQL Data Engine).

In order to create Redis on Flash databases, you must have Flash storage mounted and configured on RS nodes, and purchase a license which supports this feature. Once accomplished, both Redis on Flash databases and regular all-RAM databases can be created and managed.

When Redis on Flash is enabled, additional Flash-specific settings and metrics are available in the system.

In the Node Configuration settings, enter a cluster FQDN such as cluster.local. Then click Next button.


## cluster authentication

If you purchased a cluster key please insert it in the field below and click Next. If you would like to use the free version just click Next. We will use trial version.

## Setup Admin Credentials



## Relogin 


## Creating Database

 Select "redis database" and the "single region" deployment, and click Next.
 
 You can supply 3GB as Memory and add port 12000. Add "db1" as database
Click on "Activate"


## Connect to your Database

```
$ docker exec -it rp bash
redislabs@fd8dca50f905:/opt$
```

```
 /opt/redislabs/bin/redis-cli -p 12000
127.0.0.1:12000> auth <enter password>
OK
127.0.0.1:12000> set key1 123
OK
127.0.0.1:12000> get key1
"123"
``` 

## Running RedInSight

```
docker run -v redisinsight:/db -p 8001:8001 redislabs/redisinsight
```

Pass on 172.17.0.2 as IP, db1 as database, 12000 as port and click Enter

RedInsight should be able to display UI for your database.

# Logs

```
$ docker logs -f f33
Generating RSA private key, 2048 bit long modulus (2 primes)
............................................................................+++++
......................................................................+++++
e is 65537 (0x010001)
Can't load /opt/redislabs/.rnd into RNG
140356392882624:error:2406F079:random number generator:RAND_load_file:Cannot open file:../crypto/rand/randfile.c:88:Filename=/opt/redislabs/.rnd
Signature ok
subject=CN = f33e3eed6b78, OU = syncer, O = RedisLabs Enterprise Cluster
Getting Private key
Generating RSA private key, 2048 bit long modulus (2 primes)
........................+++++
..............................+++++
e is 65537 (0x010001)
Can't load /opt/redislabs/.rnd into RNG
140621421846976:error:2406F079:random number generator:RAND_load_file:Cannot open file:../crypto/rand/randfile.c:88:Filename=/opt/redislabs/.rnd
Signature ok
subject=CN = f33e3eed6b78, OU = metrics_exporter, O = RedisLabs Enterprise Cluster
Getting Private key
Generating RSA private key, 2048 bit long modulus (2 primes)
......................................................................+++++
...............................+++++
e is 65537 (0x010001)
Can't load /opt/redislabs/.rnd into RNG
139880989065664:error:2406F079:random number generator:RAND_load_file:Cannot open file:../crypto/rand/randfile.c:88:Filename=/opt/redislabs/.rnd
Signature ok
subject=CN = f33e3eed6b78, OU = Cluster API, O = RedisLabs Enterprise Cluster
Getting Private key
Generating RSA private key, 2048 bit long modulus (2 primes)
...............+++++
.................................................+++++
e is 65537 (0x010001)
Can't load /opt/redislabs/.rnd into RNG
139722731504064:error:2406F079:random number generator:RAND_load_file:Cannot open file:../crypto/rand/randfile.c:88:Filename=/opt/redislabs/.rnd
Signature ok
subject=CN = f33e3eed6b78, OU = redisdb, O = RedisLabs Enterprise Cluster
Getting Private key
Generating RSA private key, 2048 bit long modulus (2 primes)
...............................+++++
.............................................+++++
e is 65537 (0x010001)
Can't load /opt/redislabs/.rnd into RNG
140077801009600:error:2406F079:random number generator:RAND_load_file:Cannot open file:../crypto/rand/randfile.c:88:Filename=/opt/redislabs/.rnd
Signature ok
subject=CN = f33e3eed6b78, OU = Admin UI, O = RedisLabs Enterprise Cluster
Getting Private key
Run command: ['/opt/redislabs/sbin/generate_cert.sh', 'syncer', 'syncer']
Run command: ['/opt/redislabs/sbin/generate_cert.sh', 'metrics_exporter', 'metrics_exporter']
Run command: ['/opt/redislabs/sbin/generate_cert.sh', 'api', 'Cluster API']
Run command: ['/opt/redislabs/sbin/generate_cert.sh', 'proxy', 'redisdb']
Run command: ['/opt/redislabs/sbin/generate_cert.sh', 'cm', 'Admin UI']
Done.
2020-02-02 07:24:12,060 WARN No file matches via include "/etc/opt/redislabs/supervisord.conf.d/*.conf"
2020-02-02 07:24:12,096 INFO RPC interface 'supervisor' initialized
2020-02-02 07:24:12,097 CRIT Server 'unix_http_server' running without any HTTP authentication checking
2020-02-02 07:24:12,097 INFO supervisord started with pid 103
2020-02-02 07:24:12,188 INFO __main__ MainThread: Waiting for REST API to be accessible
2020-02-02 07:24:13,101 INFO spawned: 'ccs' with pid 111
2020-02-02 07:24:13,103 INFO spawned: 'node_wd' with pid 112
2020-02-02 07:24:13,105 INFO spawned: 'cluster_wd' with pid 113
2020-02-02 07:24:13,107 INFO spawned: 'resource_mgr' with pid 114
2020-02-02 07:24:13,109 INFO spawned: 'stats_archiver' with pid 115
2020-02-02 07:24:13,111 INFO spawned: 'crdb_worker_0' with pid 116
2020-02-02 07:24:13,113 INFO spawned: 'crdb_worker_1' with pid 117
2020-02-02 07:24:13,116 INFO spawned: 'cnm_exec' with pid 119
2020-02-02 07:24:13,118 INFO spawned: 'redis_mgr' with pid 120
2020-02-02 07:24:13,121 INFO spawned: 'cnm_http' with pid 125
2020-02-02 07:24:13,125 INFO spawned: 'crdb_coordinator' with pid 126
2020-02-02 07:24:13,129 INFO spawned: 'rl_info_provider' with pid 127
2020-02-02 07:24:13,132 INFO spawned: 'alert_mgr' with pid 129
2020-02-02 07:24:13,135 INFO spawned: 'cm_server' with pid 130
2020-02-02 07:24:13,138 INFO spawned: 'dmcproxy' with pid 131
2020-02-02 07:24:13,141 INFO spawned: 'saslauthd' with pid 132
2020-02-02 07:24:13,146 INFO spawned: 'mdns_server' with pid 133
2020-02-02 07:24:13,149 INFO spawned: 'nginx' with pid 134
2020-02-02 07:24:13,152 INFO spawned: 'pdns_server' with pid 135
2020-02-02 07:24:13,155 INFO spawned: 'sentinel_service' with pid 136
2020-02-02 07:24:13,158 INFO spawned: 'start_redis_servers' with pid 137
2020-02-02 07:24:13,163 INFO spawned: 'metrics_exporter' with pid 138
2020-02-02 07:24:13,166 INFO spawned: 'job_scheduler' with pid 140
2020-02-02 07:24:13,281 INFO success: start_redis_servers entered RUNNING state, process has stayed up for > than 0 seconds (startsecs)
2020-02-02 07:24:13,375 INFO exited: start_redis_servers (exit status 0; expected)
2020-02-02 07:24:14,508 INFO success: ccs entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2020-02-02 07:24:14,508 INFO success: node_wd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2020-02-02 07:24:14,508 INFO success: cluster_wd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2020-02-02 07:24:14,509 INFO success: resource_mgr entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2020-02-02 07:24:14,509 INFO success: stats_archiver entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2020-02-02 07:24:14,509 INFO success: crdb_worker_0 entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2020-02-02 07:24:14,510 INFO success: crdb_worker_1 entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2020-02-02 07:24:14,510 INFO success: cnm_exec entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2020-02-02 07:24:14,510 INFO success: redis_mgr entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2020-02-02 07:24:14,510 INFO success: cnm_http entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2020-02-02 07:24:14,511 INFO success: crdb_coordinator entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2020-02-02 07:24:14,511 INFO success: rl_info_provider entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2020-02-02 07:24:14,511 INFO success: alert_mgr entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2020-02-02 07:24:14,511 INFO success: cm_server entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2020-02-02 07:24:14,512 INFO success: dmcproxy entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2020-02-02 07:24:14,512 INFO success: saslauthd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2020-02-02 07:24:14,512 INFO success: mdns_server entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2020-02-02 07:24:14,512 INFO success: nginx entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2020-02-02 07:24:14,513 INFO success: pdns_server entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2020-02-02 07:24:14,513 INFO success: sentinel_service entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2020-02-02 07:24:14,513 INFO success: metrics_exporter entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2020-02-02 07:24:23,563 INFO success: job_scheduler entered RUNNING state, process has stayed up for > than 10 seconds (startsecs)
2020-02-02 07:24:24,765 INFO __main__ MainThread: Done, moving to bootstrapping
2020-02-02 07:24:24,766 INFO __main__ MainThread: Bootstrapping node with action 'None'
2020-02-02 07:24:24,767 INFO __main__ MainThread: Done
```
