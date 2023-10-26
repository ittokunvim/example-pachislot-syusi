build:
	docker compose build

up:
	docker compose up

down:
	docker compose down

web_bash:
	docker compose exec web bash

db_init:
	docker compose exec db psql -U postgres
