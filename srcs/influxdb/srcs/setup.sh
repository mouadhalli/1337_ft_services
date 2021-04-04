mkdir /var/run/utmp
nohup influxd run &
influx -execute "create database telegraf"
influx -execute "CREATE USER mhalli WITH PASSWORD 'mhalli' WITH ALL PRIVILEGES"
telegraf
tail -F /dev/null