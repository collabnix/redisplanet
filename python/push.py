import redis
# Create connection object
r = redis.Redis(host='<Redis DB Endpoint>', port=6379)
# set a value for the foo object
r.set('foo', 'bar')
# retrieve and print the value for the foo object
print(r.get('foo'))
