# Test Drive Redis Enterprise on Play with Docker Platform

 
 ## Pre-requisite:
 
 - Play with Docker Platform
 
 ## Steps
 
 ```
 docker run -d --cap-add sys_resource --name rp -p 8443:8443 -p 9443:9443 -p 12000:12000 redislabs/redis
 ```
 
Visit http://IP:8443 to open Redis Labs Enterprise Software. 
The Docker container with RS runs on your localhost with port 8443 open for HTTPS connections, 9443 for REST API connections, and port 12000 open for redis client connections. You can publish other ports with -p <host_port>:<container_port>.
Click Setup to start the node configuration steps.

In the Node Configuration settings, enter a cluster FQDN such as cluster.local. Then click Next button.

You will see "Enable flash storage support" checkbox. What does it mean?
 
 
# Redis on flash

Redis Labs Enterprise Software (RS) is available on Flash, bringing the same performance of running Redis on RAM at just a fraction of the cost, thanks to significantly reduced RAM requirements. The underlying technology of Redis on Flash uses Flash as RAM extension, rather than as persistent storage. The global key list and all ‘hot’ values are kept in RAM, while all ‘cold’ values (those which typically account for the larger part of the dataset) are kept in Flash. Multi-threaded and asynchronous Redis is used to access objects on Flash, leveraging multi-core and Flash concurrency architecture. A Redis on Flash database is fully compatible with all Redis clients, data types, and commands.

RS Flash is extremely suitable for scenarios in which values are significantly larger than the keys, and where 10-40% of all objects are "hot" objects.

In many cases, RS Flash can cut resource costs by up to 70% compared with an all-RAM deployment.

The ratio of RAM to Flash can be easily set and updated in runtime, so you can optimize performance based on your specific use case.

RS Flash characteristics and features are identical to those of standard RS. The technology is available in an x86 / 64-bit version and a POWER version (as part of the IBM NoSQL Data Engine).

In order to create Redis on Flash databases, you must have Flash storage mounted and configured on RS nodes, and purchase a license which supports this feature. Once accomplished, both Redis on Flash databases and regular all-RAM databases can be created and managed.

When Redis on Flash is enabled, additional Flash-specific settings and metrics are available in the system.

```



 
