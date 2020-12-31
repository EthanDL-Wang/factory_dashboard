# factory_dashboard
1.default : nginx images web config
2.docker-compose.yml : deploy container
3.Dockerfile : build docker images
4.factoryPanel.json : dashboard panel
5.grafana.ini : grafana config --- anyone can login
6.logo.png : moxa logo
7.netArch.bmp : network arch
8.saveFactoryDataToMysql.sh : update mysql data

grafana config
login in url : http://ip:3000


create data source
MySQL-factory
host : localhost:3306
database : factory
user&pwd : grafana


create databoard
copy factoryPanel to json model
