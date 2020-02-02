
# Storing object data in hashes

Let’s assume we want to store a number of fields about our users, such as a full name, email address, phone number, and number of visits to our application. We’ll
use Redis’s hash management commands—like HSET, HGET, and HINCRBY—to store this information

```
127.0.0.1:12000>  hset users:jdoe name "John Doe"
(integer) 1
127.0.0.1:12000>  hset users:jdoe email "jdoe@test.com"
(integer) 1
127.0.0.1:12000>  hset users:jdoe phone "+1555313940"
(integer) 1
127.0.0.1:12000> hincrby users:jdoe visits 1
(integer) 1
127.0.0.1:12000>  hget users:jdoe email
"jdoe@test.com"
127.0.0.1:12000> hgetall users:jdoe
1) "name"
2) "John Doe"
3) "email"
4) "jdoe@test.com"
5) "phone"
6) "+1555313940"
7) "visits"
8) "1"
127.0.0.1:12000>
```
