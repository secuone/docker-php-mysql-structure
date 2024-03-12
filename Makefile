default: help

.PHONY: help
help: # Show help for each of the Makefile recipes.
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

.PHONY: setup
setup: # Setup the app
	docker compose build
	make install

.PHONY: up
up: # Start the app
	docker compose up -d

.PHONY: stop
stop: # Stop the app
	docker compose stop

.PHONY: down
down: # Stop the app and delete containers
	docker compose down

.PHONY: restart
restart: # Restart the app
	make down && make build && make up

.PHONY: bash
bash: # Enter the bash shell of the specified docker container using 'container=<container_name>'
	docker exec -it $(container) /bin/bash

.PHONY: install
install: # Install composer dependencies
	docker compose run --rm composer install

.PHONY: update
update: # Update composer dependencies
	docker compose run --rm composer update

.PHONY: dumpauto
dumpauto: # Regenerate the Composer autoload files
	docker compose run --rm composer dumpauto
