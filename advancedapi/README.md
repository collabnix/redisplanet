# INFO

- The INFO command returns information and statistics about the server in a format that is simple to parse by computers and easy to read by humans.


The optional parameter can be used to select a specific section of information:
- server: General information about the Redis server
- clients: Client connections section
- memory: Memory consumption related information
- persistence: RDB and AOF related information
- stats: General statistics
- replication: Master/replica replication information
- cpu: CPU consumption statistics
- commandstats: Redis command statistics
- cluster: Redis Cluster section
- keyspace: Database related statistics

It can also take the following values:
- all: Return all sections
- default: Return only the default set of sections

When no parameter is provided, the default option is assumed.

```
127.0.0.1:6379> info
# Server
redis_version:5.0.7
redis_git_sha1:00000000
redis_git_dirty:0
redis_build_id:856bfff8b8208916
redis_mode:standalone
os:Linux 4.4.0-1101-aws x86_64
arch_bits:64
multiplexing_api:epoll
atomicvar_api:atomic-builtin
gcc_version:5.4.0
process_id:14075
run_id:70b7d0be00ff242faf077630e9a6d26cde862895
tcp_port:6379
uptime_in_seconds:173295
uptime_in_days:2
hz:10
configured_hz:10
lru_clock:6600031
executable:/home/ubuntu/./redis-stable/src/redis-server
config_file:

# Clients
connected_clients:1
client_recent_max_input_buffer:2
client_recent_max_output_buffer:0
blocked_clients:0

# Memory
used_memory:854360
used_memory_human:834.34K
used_memory_rss:6197248
used_memory_rss_human:5.91M
used_memory_peak:854448
used_memory_peak_human:834.42K
used_memory_peak_perc:99.99%
used_memory_overhead:841182
used_memory_startup:791336
used_memory_dataset:13178
used_memory_dataset_perc:20.91%
allocator_allocated:1264040
allocator_active:1527808
allocator_resident:11087872
total_system_memory:1038770176
total_system_memory_human:990.65M
used_memory_lua:37888
used_memory_lua_human:37.00K
used_memory_scripts:0
used_memory_scripts_human:0B
number_of_cached_scripts:0
maxmemory:0
maxmemory_human:0B
maxmemory_policy:noeviction
allocator_frag_ratio:1.21
allocator_frag_bytes:263768
allocator_rss_ratio:7.26
allocator_rss_bytes:9560064
rss_overhead_ratio:0.56
rss_overhead_bytes:-4890624
mem_fragmentation_ratio:7.63
mem_fragmentation_bytes:5384880
mem_not_counted_for_evict:0
mem_replication_backlog:0
mem_clients_slaves:0
mem_clients_normal:49694
mem_aof_buffer:0
mem_allocator:jemalloc-5.1.0
active_defrag_running:0
lazyfree_pending_objects:0

# Persistence
loading:0
rdb_changes_since_last_save:33
rdb_bgsave_in_progress:0
rdb_last_save_time:1583657133
rdb_last_bgsave_status:ok
rdb_last_bgsave_time_sec:0
rdb_current_bgsave_time_sec:-1
rdb_last_cow_size:294912
aof_enabled:0
aof_rewrite_in_progress:0
aof_rewrite_scheduled:0
aof_last_rewrite_time_sec:-1
aof_current_rewrite_time_sec:-1
aof_last_bgrewrite_status:ok
aof_last_write_status:ok
aof_last_cow_size:0

# Stats
total_connections_received:15
total_commands_processed:119
instantaneous_ops_per_sec:0
total_net_input_bytes:4113
total_net_output_bytes:94625
instantaneous_input_kbps:0.00
instantaneous_output_kbps:0.00
rejected_connections:0
sync_full:0
sync_partial_ok:0
sync_partial_err:0
expired_keys:4
expired_stale_perc:0.00
expired_time_cap_reached_count:0
evicted_keys:0
keyspace_hits:37
keyspace_misses:7
pubsub_channels:0
pubsub_patterns:0
latest_fork_usec:230
migrate_cached_sockets:0
slave_expires_tracked_keys:0
active_defrag_hits:0
active_defrag_misses:0
active_defrag_key_hits:0
active_defrag_key_misses:0

# Replication
role:master
connected_slaves:0
master_replid:267e878b36a386e95c3f1af56896a155684f6249
master_replid2:0000000000000000000000000000000000000000
master_repl_offset:0
second_repl_offset:-1
repl_backlog_active:0
repl_backlog_size:1048576
repl_backlog_first_byte_offset:0
repl_backlog_histlen:0

# CPU
used_cpu_sys:103.856000
used_cpu_user:114.548000
used_cpu_sys_children:0.000000
used_cpu_user_children:0.000000

# Cluster
cluster_enabled:0

# Keyspace
db0:keys=3,expires=0,avg_ttl=0
127.0.0.1:6379>
```



# DETAILS

```
redis_version: Version of the Redis server
redis_git_sha1: Git SHA1
redis_git_dirty: Git dirty flag
redis_build_id: The build id
redis_mode: The server's mode ("standalone", "sentinel" or "cluster")
os: Operating system hosting the Redis server
arch_bits: Architecture (32 or 64 bits)
multiplexing_api: Event loop mechanism used by Redis
atomicvar_api: Atomicvar API used by Redis
gcc_version: Version of the GCC compiler used to compile the Redis server
process_id: PID of the server process
run_id: Random value identifying the Redis server (to be used by Sentinel and Cluster)
tcp_port: TCP/IP listen port
uptime_in_seconds: Number of seconds since Redis server start
uptime_in_days: Same value expressed in days
hz: The server's frequency setting
lru_clock: Clock incrementing every minute, for LRU management
executable: The path to the server's executable
config_file: The path to the config file
Here is the meaning of all fields in the clients section:
connected_clients: Number of client connections (excluding connections from replicas)
client_longest_output_list: longest output list among current client connections
client_biggest_input_buf: biggest input buffer among current client connections
blocked_clients: Number of clients pending on a blocking call (BLPOP, BRPOP, BRPOPLPUSH)
Here is the meaning of all fields in the memory section:
used_memory: Total number of bytes allocated by Redis using its allocator (either standard libc, jemalloc, or an alternative allocator such as tcmalloc)
used_memory_human: Human readable representation of previous value
used_memory_rss: Number of bytes that Redis allocated as seen by the operating system (a.k.a resident set size). This is the number reported by tools such as top(1) and ps(1)
used_memory_rss_human: Human readable representation of previous value
used_memory_peak: Peak memory consumed by Redis (in bytes)
used_memory_peak_human: Human readable representation of previous value
used_memory_peak_perc: The percentage of used_memory_peak out of used_memory
used_memory_overhead: The sum in bytes of all overheads that the server allocated for managing its internal data structures
used_memory_startup: Initial amount of memory consumed by Redis at startup in bytes
used_memory_dataset: The size in bytes of the dataset (used_memory_overhead subtracted from used_memory)
used_memory_dataset_perc: The percentage of used_memory_dataset out of the net memory usage (used_memory minus used_memory_startup)
total_system_memory: The total amount of memory that the Redis host has
total_system_memory_human: Human readable representation of previous value
used_memory_lua: Number of bytes used by the Lua engine
used_memory_lua_human: Human readable representation of previous value
used_memory_scripts: Number of bytes used by cached Lua scripts
used_memory_scripts_human: Human readable representation of previous value
maxmemory: The value of the maxmemory configuration directive
maxmemory_human: Human readable representation of previous value
maxmemory_policy: The value of the maxmemory-policy configuration directive
mem_fragmentation_ratio: Ratio between used_memory_rss and used_memory
mem_allocator: Memory allocator, chosen at compile time
active_defrag_running: Flag indicating if active defragmentation is active
lazyfree_pending_objects: The number of objects waiting to be freed (as a result of calling UNLINK, or FLUSHDB and FLUSHALL with the ASYNC option)
```

## CLIENT LIST


The CLIENT LIST command returns information and statistics about the client connections server in a mostly human readable format


```
client list
id=17 addr=127.0.0.1:36238 fd=8 name= age=1086 idle=0 flags=N db=0 sub=0 psub=0 multi=-1 qbuf=26 qbuf-free=32742 obl=0 oll=0 omem=0 events=r cmd=client
127.0.0.1:6379> 
```

## Redis CLI

- Monitoring tool to show continuous stats about a Redis server
- Scanning a Redis database for very large keys
- Key space scanner with pattern matching
- Acting as a Pub/Sub client to subscribe to channels
- Monitoring the commands executed into a Redis instance
- Checking the latency of a Redis server in different ways
- Checking the scheduler latency of the local computer
- Transferring RDB backups from a remote Redis server locally
- Acting as a Redis slave for showing what a slave receives
- Simulating LRU workloads for showing stats about keys hits
- A client for the Lua debugger


## Continuous stats mode

- A new line is printed every second with useful information and the difference between the old data point
- Use -i <interval> to control the frequency

```
ubuntu@ip-172-31-25-81:~$ redis-cli --stat
------- data ------ --------------------- load -------------------- - child -
keys       mem      clients blocked requests            connections          
7          834.58K  1       0       132 (+0)            16          
7          834.58K  1       0       133 (+1)            16          
7          834.58K  1       0       134 (+1)            16          
7          834.58K  1       0       135 (+1)            16          
7          834.58K  1       0       136 (+1)            16          
7          834.58K  1       0       137 (+1)            16          
7          834.58K  1       0       138 (+1)            16          
7          834.58K  1       0       139 (+1)            16          
7          834.58K  1       0       140 (+1)            16          
7          834.58K  1       0       141 (+1)            16          
7          834.58K  1       0       142 (+1)            16          
7          834.58K  1       0       143 (+1)            16          
7          834.58K  1       0       144 (+1)            16          
7          834.58K  1       0       145 (+1)            16          
7          834.58K  1       0       146 (+1)            16          
7          834.58K  1       0       147 (+1)            16          
7          834.58K  1       0       148 (+1)            16          
7          834.58K  1       0       149 (+1)            16          
7          834.58K  1       0       150 (+1)            16          
7          834.58K  1       0       151 (+1)            16          
------- data ------ --------------------- load -------------------- - child -
keys       mem      clients blocked requests            connections          
7          834.58K  1       0       152 (+1)            16          
7          834.58K  1       0       153 (+1)            16          
7          834.58K  1       0       154 (+1)            16          

```

## MONITOR

Monitoring commands executed in Redis

```
ubuntu@ip-172-31-25-81:~$ redis-cli monitor
OK
```

For more info on more usages and API http://redis.io/topics/rediscli 




