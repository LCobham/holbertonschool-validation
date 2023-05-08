POST_NAME ?= ''
POST_TITLE ?= ''


.PHONY: clean
clean: ## Removes the `dist/` directory, created when building the website
	-make stop
	rm -rf dist/*
	rm -rf awesome-api awesome-api.log

build: ## Builds the static website
	hugo --quiet
	go build

run: ## Runs the application and redirects/appends the console output to file `awesome-api.log`
	./awesome-api >./awesome-api.log 2>&1 &

stop: ## Stops the awesome-api application
	kill $(shell pgrep awesome-api)

test: ## Tests the available endpoints in the API
	curl "http://localhost:9999"
	curl "http://localhost:9999/health"

post: ## Makes a new post to the website. POST_TITLE and POST_NAME are passed as environment variables
	hugo new posts/$(POST_NAME).md
	sed -i '2s/.*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md
	sed -i '4s/.*/draft: false/' content/posts/$(POST_NAME).md

help: ## Get help on available commands
	grep ": ##" Makefile | sed 's/## //' | head -n -1
