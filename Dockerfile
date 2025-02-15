FROM ubuntu:latest
MAINTAINER devopsteam
RUN apt-get update && apt-get install -y apache2 wget unzip
WORKDIR /tmp
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page271/blugoon.zip
RUN unzip blugoon.zip && mv 2116_blugoon/* /var/www/html/
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
