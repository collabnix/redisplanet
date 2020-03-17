

```
cat data.csv
id1,1528961481,45.0,45.0
id1,1528961482,45.1,45.1
id2,1528961483,50.0,50.0
id2,1528961484,50.1,50.0
```


```
cat data.csv | awk -F "," '{print $1" "$2" "$3" "$4}' | xargs -n4 sh -c 'redis-cli -h ajeet-1shard-noreplication.8mys2u.ng.0001.use2.cache.amazonaws.com -p 6379 zadd $1 $2 "$3,$4"' sh
```


# Sample Beer Dataset

```
https://raw.githubusercontent.com/nickhould/craft-beers-dataset/master/data/processed/beers.csv
```
