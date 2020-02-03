# Setting up Redis Enterprise on 3-Node K8s Cluster


# Installing Helm on PWK

## Installing OpenSSL

```
$ yum install -y openssl
```

# Installing Helm

```
$ curl https://raw.githubusercontent.com/helm/helm/master/scripts/get > get_helm.sh
$ chmod 700 get_helm.sh
$ ./get_helm.sh
```

## Initializing

```
helm init
```

## Enabling RBAC

```
kubectl --namespace kube-system create serviceaccount tiller
kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller
kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'
helm init --service-account tiller --upgrade
```

```
[node1 kubelabs]$ git clone https://github.com/RedisLabs/redislabs-helm
Cloning into 'redislabs-helm'...
remote: Enumerating objects: 87, done.
remote: Total 87 (delta 0), reused 0 (delta 0), pack-reused 87
Unpacking objects: 100% (87/87), done.
[node1 kubelabs]$ cd redislabs-helm/
[node1 redislabs-helm]$ helm install --namespace redis -n 'redis-enterprise' ./redis-enterprise
NAME:   redis-enterprise
LAST DEPLOYED: Mon Feb  3 06:32:53 2020
NAMESPACE: redis
STATUS: DEPLOYED

RESOURCES:
==> v1/Pod(related)
NAME                                          AGE
redis-enterprise-controller-7ddbcbf695-kch5t  0s
redisenterprisecluster-0                      0s

==> v1/Secret
NAME              AGE
redis-enterprise  0s

==> v1/Service
NAME                 AGE
redis-enterprise     0s
redis-enterprise-ui  0s

==> v1/ServiceAccount
NAME              AGE
redis-enterprise  0s

==> v1beta1/Deployment
NAME                         AGE
redis-enterprise-controller  0s

==> v1beta1/PodDisruptionBudget
NAME              AGE
redis-enterprise  0s

==> v1beta1/Role
NAME              AGE
redis-enterprise  0s

==> v1beta1/RoleBinding
NAME              AGE
redis-enterprise  0s

==> v1beta1/StatefulSet
NAME                    AGE
redisenterprisecluster  0s


NOTES:
Thank you for using redis enterprise.

Web UI:
=======

export POD_NAME=$(kubectl get pods --namespace redis -l "app=redis-enterprise,release=redis-enterprise" -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward --namespace redis $POD_NAME 8443

[node1 redislabs-helm]$
I0203 03:32:06.614020     517 version.go:240] remote version is much newer: v1.17.2; falling back to: stable-1.14
```
