## Getting Started with Docker + Redis + Go


## Prerequisites

- Your Local Development Environment

   - Docker Binaries installed, up and Running
   - Go version 1.12+ 
   - Text editor such as Visual Studio Code

## Install Redis Using Docker Locally 

```
sangam:~ sangam$ docker pull redis
Using default tag: latest
latest: Pulling from library/redis
bc51dd8edc1b: Pull complete 
37d80eb324ee: Pull complete 
392b7748dfaf: Pull complete 
48df82c3534d: Pull complete 
2ec2bb0b4b0e: Pull complete 
1302bce0b2cb: Pull complete 
Digest: sha256:7b84b346c01e5a8d204a5bb30d4521bcc3a8535bbf90c660b8595fad248eae82
Status: Downloaded newer image for redis:latest
docker.io/library/redis:latest
sangam:~ sangam$ docker run --name redis-test-instance -p 6379:6379 -d redis
99514321cff7c75fb802933d0edf276bc94f71f70cebca1fb9149b45a2c4a072

```

# Using `go-redis' 


Create main.go with following content :

```
package main

import (
	"fmt"
	"github.com/go-redis/redis"
)

func main() {
	fmt.Println("gopherlabs.collabnix.com")

	client := redis.NewClient(&redis.Options{
		Addr: "localhost:6379",
		Password: "",
		DB: 0,
	})

	pong, err := client.Ping().Result()
	fmt.Println(pong, err)

}


```

output: <br>
When we go to run this now, we will see that our incredibly simple Go application has been able to 
successfully `ping` the redis instance that we have spun up and returned a successful `PONG` response

```
sangam:golang-daily sangam$ go run main.go
gopherlabs.collabnix.com
PONG <nil>
sangam:golang-daily sangam$ 


```


# Contributors

[Sangam Biradar](https://twitter.com/BiradarSangam)
