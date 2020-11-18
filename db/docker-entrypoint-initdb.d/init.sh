#!/bin/bash

set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" << EOSQL
     CREATE USER $SQL_USER WITH ENCRYPTED PASSWORD '$SQL_PASSWORD';
     CREATE DATABASE $SQL_DB OWNER $SQL_USER;
     GRANT ALL PRIVILEGES ON DATABASE $SQL_DB TO $SQL_USER;
     ALTER USER $SQL_USER CREATEDB;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$SQL_USER" --dbname "$SQL_DB" << EOSQL
     CREATE TABLE links (
         id     serial8  primary key,
         title   text     not null unique,
         url   text     not null unique,
         tag   text not null,
         created_at timestamp,
         updated_at timestamp,
         is_completed boolean default 'f',
         is_active boolean default 't'
    );
    INSERT INTO links (
        title, url, tag
    )
    VALUES (
        'Getting started with Django', 'https://www.djangoproject.com/start/', 'tutorial'
    );
EOSQL

