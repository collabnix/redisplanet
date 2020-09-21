## Pre-requisite

### MacOS


- Installing Redis

```
brew install redis
```

### Ubuntu/Debian

```
wget <redis-6.0.tar.gz>
tar xvf <redis-6.0.tar.gz>
cd redis-6.0-rc2
make & make install
```

- Verifying Redis Installation

```
$redis-server --version
Redis server v=5.0.7 sha=00000000:0 malloc=libc bits=64 build=4bd99862b1ce82a9
```

```
redis-cli --version
redis-cli 5.0.7
```

- Install Python - We will require it for Demo Purpose

```
brew install python
```

- Install pip

```
sudo easy_install pip
```

## Running Redis Server

```
redis-server
```

## Connecting to Redis Server

```
redis-cli 
```

## Getting Started with Sample String Keys

```
set a1 100
set a2 200
set a3 300
```

```
get a1
get a2
get a3
```

## Inserting keys using Python

Copy the below content into a file called push-keys.python

```
import redis
# Create connection object
r = redis.Redis(host='localhost', port=6379)
# set a value for the foo object
r.set('foo', 'bar')
# retrieve and print the value for the foo object
print(r.get('foo'))
```


# Protecting Redis with password

Stop the old running redis server and run the below command:

```
redis-server --requirepass redis12#
```

## Connecting to Redis using Python - with auth

```
import redis
# Create connection object
r = redis.StrictRedis(host='localhost', port=6379, db=0, password='redis12#')
# set a value for the foo object
r.set('foo', 'bar')
# retrieve and print the value for the foo object
print(r.get('foo'))
```

## Running Redis on specific port

```
redis-server --port 6390
```



## Running Redis inside Docker Container

```
docker run -d -p 6380:6379 --name redis1 redis
```

```
docker exec -it redis1 sh
#bash
#redis-cli 
```
