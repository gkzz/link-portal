up:
	docker-compose up -d

ps:
	docker-compose ps

logs:
	docker-compose logs

down:
	docker-compose down -v

stop:
	docker-compose stop

rebuild:
	docker-compose up -d --build

app:
	docker-compose exec app /bin/bash

db:
	docker-compose exec db /bin/bash

nginx:
	docker-compose exec nginx /bin/bash

curl:
	curl http://localhost:9999
