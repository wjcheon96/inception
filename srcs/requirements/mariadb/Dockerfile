FROM debian:buster

RUN apt-get update -y && apt-get -y install mariadb-server mariadb-client
RUN mkdir -p /var/lib/mysqld
RUN chown -R mysql:mysql /var/lib/mysql

COPY ./conf/my.cnf /etc/mysql/
COPY ./tools/entry.sh .

RUN chmod +x /entry.sh 
ENTRYPOINT ["sh", "entry.sh"]

EXPOSE 3306
