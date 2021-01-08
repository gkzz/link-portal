.DEFAULT_GOAL := help
.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: up
up: ## docker-compose up -d
	docker-compose up -d

.PHONY: ps
ps: ## docker-compose ps
	docker-compose ps

.PHONY: logs
logs: ## docker-compose logs
	docker-compose logs

.PHONY: down
down: ## docker-compose down -v
	docker-compose down -v

.PHONY: stop
stop: ## docker-compose stop
	docker-compose stop

.PHONY: rebuild
rebuild: ## docker-compose up -d --build
	docker-compose up -d --build

.PHONY: app
app: ## docker-compose exec app /bin/bash
	docker-compose exec app /bin/bash

.PHONY: db
db: ## docker-compose exec db /bin/bash
	docker-compose exec db /bin/bash

.PHONY: logapp
logapp: ## docker-compose logs app
	docker-compose logs app

.PHONY: logdb
logdb: ## docker-compose logs db
	docker-compose logs db

.PHONY: curl
curl: ## curl -I http://localhost:9999
	curl -I http://localhost:9999
