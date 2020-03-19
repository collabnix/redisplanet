import redis
# Create connection object
r = redis.Redis(host='ajeet-1shard-noreplication.8mys2u.ng.0001.use2.cache.amazonaws.com', port=6379)
# set a value for the foo object
r.set('foo', 'bar')
# retrieve and print the value for the foo object
print(r.get('foo'))
