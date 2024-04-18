up::
	mkdir -p volumes/data
	mkdir -p volumes/log
	mkdir -p volumes/secrets
	mkdir -p volumes/backup
	sudo chmod 777 volumes/data
	sudo chmod 777 volumes/log
	sudo chmod 777 volumes/secrets
	sudo chmod 777 volumes/backup
	$(MAKE) down || true
	docker-compose up -d
PHONY: up

enter::
	docker-compose exec mssql /bin/bash
.PHONY: enter

down::
	docker-compose down
.PHONY: down

build::
	$(MAKE) down || true
	docker-compose rm -f || true
	docker-compose up --build -d
.PHONY: build
