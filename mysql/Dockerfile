FROM mysql:latest

ENV MYSQL_ROOT_PASSWORD secret

ADD dump.sql /docker-entrypoint-initdb.d/
