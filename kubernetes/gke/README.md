# Setting up Redis on GKE Cluster


## cloning this Repo

```
$git clone https://github.com/collabnix/redis
cd redis/kubernetes/gke/

```


```
$ kubectl apply -f redis-sts.yaml
configmap/redis-cluster created
statefulset.apps/redis-cluster created
```

```
$ kubectl apply -f redis-svc.yaml
service/redis-cluster created
```

