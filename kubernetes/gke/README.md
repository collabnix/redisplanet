# Setting up Multi-Node Redis Cluster on Google Cloud Engine using Docker Desktop for Windows

Redis is a powerful tool for data storage and caching. Redis Cluster extends the functionality by offering sharding and correlated performance benefits, linear scaling, and higher availability because of how Redis stores data. The data is automatically split among multiple nodes, which allows operations to continue, even when a subset of the nodes are experiencing failures or are unable to communicate with the rest of the cluster.

## Pre-requisite

- Installing [Google Cloud SDK](https://dl.google.com/dl/cloudsdk/channels/rapid/GoogleCloudSDKInstaller.exe)

```
gcloud init
```


- Install GIT using Chocolatey

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

```
choco install git
```

 - Install Docker Desktop for Windows
 
 - Create 3 Node GKE Cluster
 
 ```
 gcloud container clusters create k8s-lab1 --disk-size 10 --zone asia-east1-a --machine-type n1-standard-2 --num-nodes 3 --scopes compute-rw
 ```
 
 
 ```
 PS C:\Users\Ajeet_Raina> kubectl config get-contexts
CURRENT   NAME                                         CLUSTER                                      AUTHINFO                                     NAMESPACE
*         gke_lofty-tea-249310_asia-east1-a_k8s-lab1   gke_lofty-tea-249310_asia-east1-a_k8s-lab1   gke_lofty-tea-249310_asia-east1-a_k8s-lab1
PS C:\Users\Ajeet_Raina> kubectl get nodes
NAME                                      STATUS   ROLES    AGE   VERSION
gke-k8s-lab1-default-pool-f1fae040-9vd9   Ready    <none>   64m   v1.13.11-gke.23
gke-k8s-lab1-default-pool-f1fae040-ghf5   Ready    <none>   64m   v1.13.11-gke.23
gke-k8s-lab1-default-pool-f1fae040-z0rf   Ready    <none>   64m   v1.13.11-gke.23
PS C:\Users\Ajeet_Raina>
```


## Cloning this Repo

```
$git clone https://github.com/collabnix/redis
cd redis/kubernetes/gke/

```


```
$ kubectl apply -f redis-statefulset.yaml
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


```
C:\Users\Ajeet_Raina\Desktop\redis\kubernetes\gke>kubectl apply -f redis-svc.yaml
service/redis-cluster created

C:\Users\Ajeet_Raina\Desktop\redis\kubernetes\gke>kubectl get svc
NAME            TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)              AGE
kubernetes      ClusterIP   10.15.240.1    <none>        443/TCP              28m
redis-cluster   ClusterIP   10.15.248.54   <none>        6379/TCP,16379/TCP   5s

C:\Users\Ajeet_Raina\Desktop\redis\kubernetes\gke>
```

```
C:\Users\Ajeet_Raina\Desktop\redis\kubernetes\gke>kubectl get pods -l app=redis-cluster -o jsonpath='{range.items[*]}{.status.podIP}:6379'
'10.12.2.3:6379'10.12.0.6:6379'10.12.1.7:6379'10.12.2.4:6379'10.12.1.8:6379'10.12.2.5:6379'
```

```
C:\Users\Ajeet_Raina\Desktop\redis\kubernetes\gke>kubectl exec -it redis-cluster-0 -- redis-cli --cluster create 10.12.2.3:6379 10.12.0.6:6379 10.12.1.7:6379 10.12.2.4:6379 10.12.1.8:6379 10.12.2.5:6379 --cluster-replicas 1
>>> Performing hash slots allocation on 6 nodes...
Master[0] -> Slots 0 - 5460
Master[1] -> Slots 5461 - 10922
Master[2] -> Slots 10923 - 16383
Adding replica 10.12.2.4:6379 to 10.12.2.3:6379
Adding replica 10.12.1.8:6379 to 10.12.0.6:6379
Adding replica 10.12.2.5:6379 to 10.12.1.7:6379
M: 8a78d53307bdde11f6e53a9c1e90b1a9949463f1 10.12.2.3:6379
   slots:[0-5460] (5461 slots) master
M: bf11440a398e88ad7bfc167dd3219a4f594ffa39 10.12.0.6:6379
   slots:[5461-10922] (5462 slots) master
M: c82e231121118c731194d31ddc20d848953174e7 10.12.1.7:6379
   slots:[10923-16383] (5461 slots) master
S: 707bb247a2ecc3fd36feb3c90cc58ff9194b5166 10.12.2.4:6379
   replicates 8a78d53307bdde11f6e53a9c1e90b1a9949463f1
S: 63abc45d61a9d9113db0c57f7fe0596da4c83a6e 10.12.1.8:6379
   replicates bf11440a398e88ad7bfc167dd3219a4f594ffa39
S: 10c2bc0cc626725b5a1afdc5e68142610e498fd7 10.12.2.5:6379
   replicates c82e231121118c731194d31ddc20d848953174e7
Can I set the above configuration? (type 'yes' to accept): yes
>>> Nodes configuration updated
>>> Assign a different config epoch to each node
>>> Sending CLUSTER MEET messages to join the cluster
Waiting for the cluster to join
.....
>>> Performing Cluster Check (using node 10.12.2.3:6379)
M: 8a78d53307bdde11f6e53a9c1e90b1a9949463f1 10.12.2.3:6379
   slots:[0-5460] (5461 slots) master
   1 additional replica(s)
S: 63abc45d61a9d9113db0c57f7fe0596da4c83a6e 10.12.1.8:6379
   slots: (0 slots) slave
   replicates bf11440a398e88ad7bfc167dd3219a4f594ffa39
M: c82e231121118c731194d31ddc20d848953174e7 10.12.1.7:6379
   slots:[10923-16383] (5461 slots) master
   1 additional replica(s)
S: 10c2bc0cc626725b5a1afdc5e68142610e498fd7 10.12.2.5:6379
   slots: (0 slots) slave
   replicates c82e231121118c731194d31ddc20d848953174e7
S: 707bb247a2ecc3fd36feb3c90cc58ff9194b5166 10.12.2.4:6379
   slots: (0 slots) slave
   replicates 8a78d53307bdde11f6e53a9c1e90b1a9949463f1
M: bf11440a398e88ad7bfc167dd3219a4f594ffa39 10.12.0.6:6379
   slots:[5461-10922] (5462 slots) master
   1 additional replica(s)
[OK] All nodes agree about slots configuration.
>>> Check for open slots...
>>> Check slots coverage...
[OK] All 16384 slots covered.
```

```
C:\Users\Ajeet_Raina\Desktop\redis\kubernetes\gke>kubectl exec -it redis-cluster-0 -- redis-cli cluster info
cluster_state:ok
cluster_slots_assigned:16384
cluster_slots_ok:16384
cluster_slots_pfail:0
cluster_slots_fail:0
cluster_known_nodes:6
cluster_size:3
cluster_current_epoch:6
cluster_my_epoch:1
cluster_stats_messages_ping_sent:126
cluster_stats_messages_pong_sent:130
cluster_stats_messages_sent:256
cluster_stats_messages_ping_received:125
cluster_stats_messages_pong_received:126
cluster_stats_messages_meet_received:5
cluster_stats_messages_received:256

C:\Users\Ajeet_Raina\Desktop\redis\kubernetes\gke>
```

```
kubectl apply -f app-depolyment.yaml
```

```
C:\Users\Ajeet_Raina\Desktop\redis\kubernetes\gke>kubectl get svc
NAME             TYPE           CLUSTER-IP      EXTERNAL-IP      PORT(S)              AGE
hit-counter-lb   LoadBalancer   10.15.253.213   35.187.144.200   80:31309/TCP         103s
kubernetes       ClusterIP      10.15.240.1     <none>           443/TCP              46m
redis-cluster    ClusterIP      10.15.248.54    <none>           6379/TCP,16379/TCP   18m
```

## Simulate a Node Failure

We can simulate the failure of a cluster member by deleting the Pod. When we delete redis-cluster-0, which was originally a master, we see that Kubernetes promotes redis-cluster-3 to master, and when redis-cluster-0 returns, it does so as a slave

```
C:\Users\Ajeet_Raina\Desktop\redis\kubernetes\gke>kubectl exec -it redis-cluster-0 -- redis-cli role
1) "master"
2) (integer) 854
3) 1) 1) "10.12.2.4"
      2) "6379"
      3) "854"
```

```
C:\Users\Ajeet_Raina\Desktop\redis\kubernetes\gke>kubectl exec -it redis-cluster-1 -- redis-cli role
1) "master"
2) (integer) 994
3) 1) 1) "10.12.1.8"
      2) "6379"
      3) "994"

C:\Users\Ajeet_Raina\Desktop\redis\kubernetes\gke>kubectl exec -it redis-cluster-2 -- redis-cli role
1) "master"
2) (integer) 1008
3) 1) 1) "10.12.2.5"
      2) "6379"
      3) "1008"

C:\Users\Ajeet_Raina\Desktop\redis\kubernetes\gke>kubectl exec -it redis-cluster-3 -- redis-cli role
1) "slave"
2) "10.12.2.3"
3) (integer) 6379
4) "connected"
5) (integer) 1008

C:\Users\Ajeet_Raina\Desktop\redis\kubernetes\gke>kubectl exec -it redis-cluster-4 -- redis-cli role
1) "slave"
2) "10.12.0.6"
3) (integer) 6379
4) "connected"
5) (integer) 1022

C:\Users\Ajeet_Raina\Desktop\redis\kubernetes\gke>kubectl exec -it redis-cluster-5 -- redis-cli role
1) "slave"
2) "10.12.1.7"
3) (integer) 6379
4) "connected"
5) (integer) 1022
```
