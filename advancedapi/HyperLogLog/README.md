# HyperLogLog –  Estimating the cardinality of a set

- A probabilistic data structure used in order to count unique things 
  - Use an algorithm that trade memory for precision  
  - Not actually store values

HLLs in Redis is encoded as a Redis string

## Commands 

- PFADD : add an element to the count with PFADD
- PFCOUNT : Retrieve the current approximation  of the unique elements added with PFADD so far

```
> PFADD hll a b c d
(integer) 1
> PFCOUNT hll
(integer) 4
```

