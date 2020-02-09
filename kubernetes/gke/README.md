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

```
C:\Users\Ajeet_Raina\Desktop\redis\kubernetes\gke>kubectl get pvc
NAME                   STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS   AGE
data-redis-cluster-0   Bound    pvc-34bdf05b-4af2-11ea-9222-42010a8c00e8   1Gi        RWO            standard       2m15s
data-redis-cluster-1   Bound    pvc-4564abb9-4af2-11ea-9222-42010a8c00e8   1Gi        RWO            standard       107s
data-redis-cluster-2   Bound    pvc-51566907-4af2-11ea-9222-42010a8c00e8   1Gi        RWO            standard       87s
data-redis-cluster-3   Bound    pvc-5c8391a0-4af2-11ea-9222-42010a8c00e8   1Gi        RWO            standard       68s
data-redis-cluster-4   Bound    pvc-64a340d3-4af2-11ea-9222-42010a8c00e8   1Gi        RWO            standard       55s
data-redis-cluster-5   Bound    pvc-71024053-4af2-11ea-9222-42010a8c00e8   1Gi        RWO            standard       34s

C:\Users\Ajeet_Raina\Desktop\redis\kubernetes\gke>
```

```
C:\Users\Ajeet_Raina\Desktop\redis\kubernetes\gke>kubectl describe pods redis-cluster-0
Name:           redis-cluster-0
Namespace:      default
Priority:       0
Node:           gke-k8s-lab1-default-pool-f1fae040-9vd9/10.140.0.28
Start Time:     Sun, 09 Feb 2020 09:41:14 +0530
Labels:         app=redis-cluster
                controller-revision-hash=redis-cluster-fd959c7f4
                statefulset.kubernetes.io/pod-name=redis-cluster-0
Annotations:    kubernetes.io/limit-ranger: LimitRanger plugin set: cpu request for container redis
Status:         Running
IP:             10.12.2.3
Controlled By:  StatefulSet/redis-cluster
Containers:
  redis:
    Container ID:  docker://6c8c32c785afabff22323cf77103ae3df29a29580863cdfe8c46db12883d87eb
    Image:         redis:5.0.1-alpine
    Image ID:      docker-pullable://redis@sha256:6f1cbe37b4b486fb28e2b787de03a944a47004b7b379d0f8985760350640380b
    Ports:         6379/TCP, 16379/TCP
    Host Ports:    0/TCP, 0/TCP
    Command:
      /conf/update-node.sh
      redis-server
      /conf/redis.conf
    State:          Running
      Started:      Sun, 09 Feb 2020 09:41:38 +0530
    Ready:          True
    Restart Count:  0
    Requests:
      cpu:  100m
    Environment:
      POD_IP:   (v1:status.podIP)
    Mounts:
      /conf from conf (rw)
      /data from data (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from default-token-m9xql (ro)
Conditions:
  Type              Status
  Initialized       True
  Ready             True
  ContainersReady   True
  PodScheduled      True
Volumes:
  data:
    Type:       PersistentVolumeClaim (a reference to a PersistentVolumeClaim in the same namespace)
    ClaimName:  data-redis-cluster-0
    ReadOnly:   false
  conf:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      redis-cluster
    Optional:  false
  default-token-m9xql:
    Type:        Secret (a volume populated by a Secret)
    SecretName:  default-token-m9xql
    Optional:    false
QoS Class:       Burstable
Node-Selectors:  <none>
Tolerations:     node.kubernetes.io/not-ready:NoExecute for 300s
                 node.kubernetes.io/unreachable:NoExecute for 300s
Events:
  Type     Reason                  Age                    From                                              Message
  ----     ------                  ----                   ----                                              -------
  Warning  FailedScheduling        4m13s (x3 over 4m16s)  default-scheduler                                 pod has unbound immediate PersistentVolumeClaims (repeated 3 times)
  Normal   Scheduled               4m13s                  default-scheduler                                 Successfully assigned default/redis-cluster-0 to gke-k8s-lab1-default-pool-f1fae040-9vd9
  Normal   SuccessfulAttachVolume  4m8s                   attachdetach-controller                           AttachVolume.Attach succeeded for volume "pvc-34bdf05b-4af2-11ea-9222-42010a8c00e8"
  Normal   Pulling                 3m55s                  kubelet, gke-k8s-lab1-default-pool-f1fae040-9vd9  pulling image "redis:5.0.1-alpine"
  Normal   Pulled                  3m49s                  kubelet, gke-k8s-lab1-default-pool-f1fae040-9vd9  Successfully pulled image "redis:5.0.1-alpine"
  Normal   Created                 3m49s                  kubelet, gke-k8s-lab1-default-pool-f1fae040-9vd9  Created container
  Normal   Started                 3m49s                  kubelet, gke-k8s-lab1-default-pool-f1fae040-9vd9  Started container
```
