FROM ubuntu:18.04
RUN apt update && \
    apt install -y mysql-server && \
    apt install -y wget && \
    wget https://dl.grafana.com/enterprise/release/grafana-enterprise_7.3.1_amd64.deb && \
    apt install -y adduser && \
    apt install -y libfontconfig && \
    dpkg -i grafana-enterprise_7.3.1_amd64.deb && \
    apt install -y net-tools && \
    apt install -y nginx && \
    apt install -y vim

RUN mkdir /var/www/images
COPY ./logo.png ./netArch.bmp /var/www/images/
COPY ./default /etc/nginx/sites-available/default

COPY ./grafana.ini /etc/grafana/grafana.ini
RUN chmod 777 /etc/grafana/grafana.ini

ENV APP app
RUN mkdir /${APP}
COPY ./saveFactoryDataToMysql.sh /${APP}
COPY ./factoryPanel.json /${APP}
WORKDIR /${APP}


CMD ["/app/saveFactoryDataToMysql.sh"]    