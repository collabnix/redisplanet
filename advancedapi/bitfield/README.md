
# BITFIELD

- BITFIELD treats a Redis string as a array of bits 
- Is capable of addressing specific integer fields of varying bit widths and arbitrary non (necessary) aligned offset 
- Are not an actual data type.

Similarly the command handles increments and decrements of the specified integers



```
> BITFIELD mykey incrby i5 100 1 get u4 0
1) (integer) 1
2) (integer) 0
```

-  More on BITFIELD Operations http://redis.io/commands/BITFIELD 

