# Link

Self-hosted bookmark service

![linkdemo](https://user-images.githubusercontent.com/38461277/99528905-4ca28880-29e2-11eb-8450-fef1a64129bf.png)

## TL;DR

```
$ git clone https://github.com/gkzz/link-portal.git
$ cp app/.env.dev.tmpl app/.env.dev \
  && cp db/.env.dev.tmpl db/.env.dev
$ make rebuild
$ make ps
$ make app
docker-compose exec app /bin/bash
app@app:~$ python manage.py migrate --noinput
app@app:~$ python manage.py collectstatic --noinput --clear
```

## Technology Used

### on local

- Ubuntu 20.04.1 LTS (Focal Fossa)
- Docker 19.03.3
- docker-compose 1.24.1

### on docker

- App

  - Python
  ```
  $ grep "FROM" app/Dockerfile
  FROM python:3.7.9-buster
  ```
  - psql Client
  ```
  app@app:~$ psql --version
  psql (PostgreSQL) 11.9 (Debian 11.9-0+deb10u1)
  app@app:~$ 
  ```

  - Python Library
  ```
  app@app:~$ cat requirements.txt 
  Django==3.1.2
  djangorestframework==3.12.2
  gunicorn==20.0.4
  psycopg2-binary==2.8.6
  requests==2.24.0
  beautifulsoup4==4.9.3
  app@app:~$ 
  ```

- DB
  ```
  $ grep "FROM" db/Dockerfile
  FROM postgres:11.9-alpine
  ```

- Nginx
  ```
  $ grep FROM nginx/Dockerfile 
  FROM nginx:1.19.0-alpine
  ```

## Notes

### Directory Architecture
```
$ tree -L 2
.
├── app                              ## Route Directory of App service
│   ├── 38                           ### Python venv (for local)
│   ├── Dockerfile                   ### Dockerfile with docker-compose.yml
│   ├── Dockerfile.init              ### Dockerfile with docker-compose.init.yml
│   ├── Dockerfile.nginx             ### Dockerfile with docker-compose-nginx.yml
│   ├── manage.py
│   ├── portal                       ### Route Directory of Django
│   ├── requirements.txt
│   └── scripts                      ### useful shellscripts
├── db                               ## Route Directory of  DB service
│   ├── docker-entrypoint-initdb.d
│   ├── Dockerfile                   ## Dockerfile with both of docker-compose.yml and docker-compose-nginx.yml
├── docker-compose.init.yml
├── docker-compose.nginx.yml
├── docker-compose.yml
├── docs
│   └── tutorial.md
├── LICENSE
├── memo.md
├── nginx                           ## Route Directory of Nginx service
│   ├── conf.d
│   ├── Dockerfile                  ### Dockerfile with docker-compose-nginx.yml
│   └── log
├── README.md
├── scripts                        ## useful shellscripts for `docker-compose commands`
│   ├── build-dc.sh                ### when you build
│   └── down-dc.sh                 ### when you down
└── staticdata                     ## Route Directory of Django's staticfiles, which Nginx also makes a use of
    ├── 404.html
    ├── 50x.html
    ├── admin
    └── rest_framework

15 directories, 19 files

```

### How to use `Makefile`
```
$ make help
up                   docker-compose up -d
ps                   docker-compose ps
logs                 docker-compose logs
down                 docker-compose down -v
stop                 docker-compose stop
rebuild              docker-compose up -d --build
app                  docker-compose exec app /bin/bash
db                   docker-compose exec db /bin/bash
logapp               docker-compose logs app
logdb                docker-compose logs db
curl                 curl -I http://localhost:9999
```


## License
Copyright (c) 2020 [gkz](https://gkz.mit-license.org/2020)

Licensed under the [MIT license](LICENSE).

Unless attributed otherwise, everything is under the MIT licence. Some stuff is not from me, and without attribution, and I no longer remember where I got it from. I apologize for that.
