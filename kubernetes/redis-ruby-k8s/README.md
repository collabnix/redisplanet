# How to run redis cluster on kubernetes

---

### Prerequisites

- Install minikube or kubernetes

Follow this guide: [Install minikube on local machine](https://kubernetes.io/docs/getting-started-guides/minikube/)

Follow this guide: [Install kubernetes by kubeadm on cluster](https://kubernetes.io/docs/getting-started-guides/kubeadm/)

- Install docker-engine

Follow this guide: [Install Docker and run hello-world](https://docs.docker.com/engine/getstarted/step_one/)

---

### Clone the git repository

- Clone the git repository and change working directory to ```kubernetes-redis-cluster/```

```sh
$ git clone https://github.com/cookeem/kubernetes-redis-cluster.git
Cloning into 'kubernetes-redis-cluster'...
remote: Counting objects: 17, done.
remote: Compressing objects: 100% (11/11), done.
remote: Total 17 (delta 6), reused 17 (delta 6), pack-reused 0
Unpacking objects: 100% (17/17), done.
Checking connectivity... done.

$ cd kubernetes-redis-cluster/
```

---

### Build the redis cluster image

- Use docker to build redis cluster image

```sh
$ docker build docker-images-redis-ruby/ -t redis:ruby
```

- Deploy 6 nodes redis cluster to kubernetes, it will create 6 pods and 6 service in kubernetes.

Redis service port 7000, but we must enable 17000 port to make create redis cluster work!

```sh
$ kubectl create -f .
deployment "redis-0" created
deployment "redis-1" created
deployment "redis-2" created
deployment "redis-3" created
deployment "redis-4" created
deployment "redis-5" created
service "redis-0" created
service "redis-1" created
service "redis-2" created
service "redis-3" created
service "redis-4" created
service "redis-5" created
```

Check the pods:

```sh
$ kubectl get pods -l app=redis
NAME                       READY     STATUS    RESTARTS   AGE
redis-0-2560206902-b8fvk   1/1       Running   0          6s
redis-1-2919540793-4pbxm   1/1       Running   0          6s
redis-2-3476006974-8wtrn   1/1       Running   0          6s
redis-3-3933907010-4kvnm   1/1       Running   0          6s
redis-4-97822790-vk3js     1/1       Running   0          5s
redis-5-555722826-w0vxs    1/1       Running   0          5s
```

Use ssh to connect pod container, copy the shell in start-cluster.sh, and run it in container:
```sh
$ kubectl exec -ti redis-node1-2942478609-lqk6j -- /bin/bash
root@redis-node1-2942478609-lqk6j:/data# echo 'yes' | /root/redis-trib.rb create --replicas 1 \
> `getent hosts redis-0 | awk '{ print $1 }'`:7000 \
> `getent hosts redis-1 | awk '{ print $1 }'`:7000 \
> `getent hosts redis-2 | awk '{ print $1 }'`:7000 \
> `getent hosts redis-3 | awk '{ print $1 }'`:7000 \
> `getent hosts redis-4 | awk '{ print $1 }'`:7000 \
> `getent hosts redis-5 | awk '{ print $1 }'`:7000

>>> Creating cluster
>>> Performing hash slots allocation on 7 nodes...
Using 3 masters:
10.0.0.134:7000
10.0.0.99:7000
10.0.0.157:7000
Adding replica 10.0.0.62:7000 to 10.0.0.134:7000
Adding replica 10.0.0.201:7000 to 10.0.0.99:7000
Adding replica 10.0.0.149:7000 to 10.0.0.157:7000
Adding replica 10.0.0.134:7000 to 10.0.0.134:7000
S: a678b2e1acb26a9ddcb2200895614ebc028da621 10.0.0.201:7000
   replicates 436870b83b9cbc14dc1edfc3ca5210c265ad5500
S: 63a60d597ed30c333b8abffe27f399d2a827d7e5 10.0.0.149:7000
   replicates 460a9f8276f1756953364d61c5b50bcf0a519e2d
S: c247aac89ad61f52651eb5506afc7d1761066f54 10.0.0.62:7000
   replicates 7dfbe35cbd42719e2e4688147fb7b4bbe6e05ea5
M: 460a9f8276f1756953364d61c5b50bcf0a519e2d 10.0.0.157:7000
   slots:10923-16383 (5461 slots) master
M: 436870b83b9cbc14dc1edfc3ca5210c265ad5500 10.0.0.99:7000
   slots:5461-10922 (5462 slots) master
M: 7dfbe35cbd42719e2e4688147fb7b4bbe6e05ea5 10.0.0.134:7000
   slots:0-5460 (5461 slots) master
S: 7dfbe35cbd42719e2e4688147fb7b4bbe6e05ea5 10.0.0.134:7000
   replicates 7dfbe35cbd42719e2e4688147fb7b4bbe6e05ea5
Can I set the above configuration? (type 'yes' to accept): >>> Nodes configuration updated
>>> Assign a different config epoch to each node
>>> Sending CLUSTER MEET messages to join the cluster
Waiting for the cluster to join..
>>> Performing Cluster Check (using node 10.0.0.201:7000)
S: a678b2e1acb26a9ddcb2200895614ebc028da621 10.0.0.201:7000
   slots: (0 slots) slave
   replicates 436870b83b9cbc14dc1edfc3ca5210c265ad5500
M: 436870b83b9cbc14dc1edfc3ca5210c265ad5500 172.17.0.11:7000
   slots:5461-10922 (5462 slots) master
   1 additional replica(s)
M: 7dfbe35cbd42719e2e4688147fb7b4bbe6e05ea5 172.17.0.12:7000
   slots:0-5460 (5461 slots) master
   1 additional replica(s)
S: 63a60d597ed30c333b8abffe27f399d2a827d7e5 172.17.0.4:7000
   slots: (0 slots) slave
   replicates 460a9f8276f1756953364d61c5b50bcf0a519e2d
S: c247aac89ad61f52651eb5506afc7d1761066f54 172.17.0.6:7000
   slots: (0 slots) slave
   replicates 7dfbe35cbd42719e2e4688147fb7b4bbe6e05ea5
M: 460a9f8276f1756953364d61c5b50bcf0a519e2d 172.17.0.10:7000
   slots:10923-16383 (5461 slots) master
   1 additional replica(s)
[OK] All nodes agree about slots configuration.
>>> Check for open slots...
>>> Check slots coverage...
[OK] All 16384 slots covered.
```

Verify the cluster start correct or not

```sh
root@redis-node1-2942478609-lqk6j:/data# redis-cli -c -h redis-2 -p 7000
redis-node1-svc:7000> set k1 v1
-> Redirected to slot [12706] located at 172.17.0.10:7000
OK
172.17.0.10:7000> set k2 v2
-> Redirected to slot [449] located at 172.17.0.12:7000
OK
172.17.0.12:7000> get k1
-> Redirected to slot [12706] located at 172.17.0.10:7000
"v1"
172.17.0.10:7000> get k2
-> Redirected to slot [449] located at 172.17.0.12:7000
"v2"
172.17.0.12:7000> exit
```