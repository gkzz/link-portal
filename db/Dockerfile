FROM postgres:11.9-alpine

RUN apk update \
    && apk upgrade \
    && apk add --no-cache --virtual vim

RUN chown -R postgres:postgres /var/lib/postgresql/data \
  && chown -R postgres:postgres /docker-entrypoint-initdb.d
USER postgres
