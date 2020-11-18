
on local
```
$ python3.8 -m venv 38
$ source 38/bin/activate
(38)$ pip install pip --upgrade && pip install -r requirements.txt 
(38)$ django-admin.py startproject portal .
(38)$ python manage.py migrate
(38)$ python manage.py runserver
```

(38)$ deactivate
```

mv app/portal/settings.py app/portal/common.py, and modify it


on local
```
$ docker-compose -f docker-compose-init.yml up -d --build
$ docker-compose -f docker-compose-init.yml run app mkdir -p portal/bookmarks && python manage.py startapp bookmarks portal/bookmarks
```


Delete settings.py, Create settings directory
```
$ tree portal/settings/ -I *.pyc
portal/settings/
├── common.py
├── __init__.py
├── local_postgres.py
├── local_sqlite.py
```



```
$ docker-compose run app python manage.py migrate
$ dokcer-compose up -d
```
