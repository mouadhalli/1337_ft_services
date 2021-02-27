
sudo openrc reboot

# nginx
rc-service nginx start
# rc-service nginx start &
# nginx -g "daemon off;"

rc-service php-fpm7 start

tail -F /dev/null