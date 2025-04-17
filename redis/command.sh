helm repo add bitnami https://charts.bitnami.com/bitnami
helm upgrade --install redis bitnami/redis \
  --namespace game-platform-kg \
  --create-namespace \
  -f values-longhorn.yaml