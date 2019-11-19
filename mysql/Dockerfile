FROM mysql:8.0.18

ENV MYSQL_ROOT_PASSWORD secret

ADD data/dump.sql /docker-entrypoint-initdb.d/
