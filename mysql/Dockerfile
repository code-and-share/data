FROM mysql:latest

ENV MYSQL_ROOT_PASSWORD secret

ADD data/dump.sql /docker-entrypoint-initdb.d/
