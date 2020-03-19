# import the Redis client

import redis



# Create a redis client

redisClient = redis.StrictRedis(host='<Redis DB Endpoint>',

                                port=6379,

                                db=0)



# Add key value pairs to the Redis hash

redisClient.hset("users:linus", "name", "Linus" )

redisClient.hset("users:linus", "email", "linus@linuxfoundation.com")

redisClient.hset("users:linus", "phone", "+1234567891")



# Retrieve the value for a specific key

print("Value for the key 3 is")

print(redisClient.hget("users:linus", "phone"))



print("The keys present in the Redis hash:");

print(redisClient.hkeys("users:linus"))



print("The values present in the Redis hash:");

print(redisClient.hvals("users:linus"))



print("The keys and values present in the Redis hash are:")

print(redisClient.hgetall("users:linus"))
