**Установка кластера RKE2**

ansible-playbook -i inventory.yaml playbook.yaml -e ansible_user=devops --private-key ~/.ssh/ssh_key.pub -b

**после установки обязательно установить лейблы на воркерах для longhorn**

kubectl label node rke2-worker01 node.longhorn.io/create-default-disk=true
kubectl label node rke2-worker02 node.longhorn.io/create-default-disk=true
kubectl label node rke2-worker03 node.longhorn.io/create-default-disk=true
kubectl label node rke2-worker04 node.longhorn.io/create-default-disk=true
kubectl label node rke2-worker05 node.longhorn.io/create-default-disk=true

**Установка кластера traefik**

kubectl create -f crds/
kubectl create -f traefik.yml

**Установка кластера longhorn**

kubectl create ns longhorn-system
kubectl apply -n longhorn-system -f ingress-longhorn.yaml
kubectl apply -n longhorn-system -f longhorn.yaml