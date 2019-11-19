FROM bitnami/mysql:5.7-debian-9

ENV MYSQL_ROOT_PASSWORD secret

ADD data/dump.sql /docker-entrypoint-initdb.d/
