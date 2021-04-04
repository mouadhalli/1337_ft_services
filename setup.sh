minikube delete
minikube start --driver=virtualbox
minikube addons enable metallb

eval $(minikube -p minikube docker-env)

#build images
docker build -t local-nginx srcs/nginx
docker build -t local-mysql srcs/mysql
docker build -t local-phpmyadmin srcs/phpmyadmin
docker build -t local-wordpress srcs/wordpress
docker build -t local-ftps srcs/ftps
docker build -t local-influxdb srcs/influxdb
docker build -t local-grafana srcs/grafana

#apply yaml files
kubectl apply -f yamls

minikube dashboard