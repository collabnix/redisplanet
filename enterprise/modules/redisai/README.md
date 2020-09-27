
# What is Redis?

Redis is a key-value database system. It stores pairs of keys and values. It is optimized for the real-time web. It has in-memory data structure, meaning it stores data using RAM. THis makes it much faster than traditional databases and ideal to use as a caching solution.

# What is Redis Enterprise?

Even though Redis is an in-memory database, the goal of Redis Labs is to help enterprises with “use it as more than cache”.  The company is primarily doing this via Redis Enterprise

# What are Redis Modules?

The way in which the core functionality of Redis is being extended into a “full database platform” by Redis Labs is via modules. Now there are several modules like 

- RedisTimeSeries,
- RedisGraph, 
- RedisJSON, 
- Redisearch, 
- RedisBloom and 
- RedisAI. 


# What is RedisAI?

- RedisAI is a Redis module for executing Deep Learning/Machine Learning models and managing their data. Redis is an in-memory data structure server RedisAI uses for storing all of its data. 


- The main data type supported by RedisAI is the Tensor that is the standard representation of data in the DL/ML domain. 
Because tensors are stored in the memory space of the Redis server, they are readily accessible to any of RedisAI’s backend libraries at minimal latency.


- Its purpose is being a "workhorse" for model serving, by providing out-of-the-box support for popular DL/ML frameworks and unparalleled performance. 
RedisAI both simplifies the deployment and serving of graphs by leveraging on Redis' production-proven infrastructure, as well as maximizes computation throughput by adhering to the principle of data locality.

## Please remember:

- The RedisAI module doesn’t train your data - for that you need a tool like TensorFlow and PyTorch(Two open source projects for machine learning).
- Where RedisAI comes in is at the application layer, when it’s time to apply logic to the data(inferencing) and then serve it to the user.
- When you want to train your AI model somewhere in the Cloud. Once you want to do serving or the inferencing, Redis is the right database to do that


# Blogs


- [ Installing RedisAI on Jetson Nano](https://github.com/collabnix/redisplanet/blob/master/enterprise/modules/redisai/install/README.md)
