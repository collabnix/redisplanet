# Redis Graph

A Graph Database built on top of Redis

## Why is it needed?

- Facebook Social Media might be using it to connect you to new friends
- Companies like Ways might be using it find Quickest Route from Home to work
- Company might be using Graph for Network Load Balancing

Basic Entity:

## Node 
Simply a reference to Redis Hash

A Node called "Linus Torvald" pointing to Redis Hash which has some properties like shown below;


Linus Torvald ================>.  Linus Torvald {
                                   First_Name: Linus 
                                   Age: "59"
                                   }
 
# Relations


Once we have node, we would like to connect them,

Linus. =============. VISIT. =====================.  Finland

# How to store Graph in Redis?

With the help of Hexastore

  Subject.   Predicate            Object
     S           P                  0
     
     
We store all 6 permutation of the relationship

```
SPO
SOP
OPS                       Linus visit Finland
OSP                         (S)  (P)  (0)
PSO
POS
```

