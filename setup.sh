minikube delete
# minikube start
minikube start --driver=virtualbox
minikube addons enable metallb

eval $(minikube -p minikube docker-env)

#build images
docker build -t local-nginx srcs/nginx
docker build -t local-phpmyadmin srcs/phpmyadmin
docker build -t local-wordpress srcs/wordpress

#apply yaml files
kubectl apply -f metallb-conf.yaml
kubectl apply -f nginx_dep-srvc.yaml
kubectl apply -f phpmyadmin-dep-srvc.yaml
kubectl apply -f wordpress-dep-srvc.yaml

minikube dashboard