build:
	docker compose build

up:
	docker compose up

down:
	docker compose down

setup_db:
	docker compose run --rm web rails db:create
	docker compose run --rm web rails db:migrate

web_init:
	docker compose exec web bash

db_init:
	docker compose exec db psql -U postgres

db_reset:
	docker compose run --rm web rails db:reset

web_test:
	docker compose exec web rails test
