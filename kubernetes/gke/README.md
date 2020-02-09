# Setting up Redis on GKE Cluster

## Pre-requisite

- Install GIT using Chocolatey

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

```
choco install git
```

 - Install Docker Desktop for Windows


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

```
C:\Users\Ajeet_Raina\Desktop\redis\kubernetes\gke>kubectl get po
NAME              READY   STATUS              RESTARTS   AGE
redis-cluster-0   1/1     Running             0          92s
redis-cluster-1   1/1     Running             0          64s
redis-cluster-2   1/1     Running             0          44s
redis-cluster-3   1/1     Running             0          25s
redis-cluster-4   0/1     ContainerCreating   0          12s
```



