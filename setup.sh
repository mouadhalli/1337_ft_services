# minikube delete
# minikube start
minikube start --driver=virtualbox
minikube addons enable metallb

eval $(minikube -p minikube docker-env)

#build images
docker build -t local-nginx srcs/nginx
docker build -t local-mysql srcs/mysql
docker build -t local-phpmyadmin srcs/phpmyadmin
docker build -t local-wordpress srcs/wordpress
docker build -t local-ftps srcs/ftps

#apply yaml files
kubectl apply -f yamls
# kubectl apply -f yamls/nginx-dep-srvc.yaml
# kubectl apply -f yamls/mysql-dep-srvc.yaml
# kubectl apply -f yamls/phpmyadmin-dep-srvc.yaml
# kubectl apply -f yamls/wordpress-dep-srvc.yaml

minikube dashboard
