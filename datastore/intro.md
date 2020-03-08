
# Data Store

- A single very large data store
- Key can be any String/Byte Array
- Value can be any of the  following types
- Strings (Byte Arrays)
- Lists
- Sets
- ZSET (Sorted Sets)
- Hashes
- Bitmap and HyperLogLogs


## Key & Value

- Both key and value can be at max 512 Megabytes in length
- Within complex data structure every value in the data structure can be at max 512 Megabytes 
- Key/Value basic command families
- Setters – associating a key with a value
- A Setter command name is dependent on the data structure you use
- Getters – specifying a key and returning the value
- A getter command name is dependent on the data structure you use
- EXISTS command returns 1 or 0 to signal if a given key exists or not in the database
- DEL command deletes a key and associated value
