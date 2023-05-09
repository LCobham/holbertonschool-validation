POST_NAME ?= ''
POST_TITLE ?= ''


.PHONY: clean
clean: ## Removes the `dist/` directory, created when building the website. Removes the API executable and log file. 
	rm -rf dist/*
	rm -rf awesome-api awesome-api.log
	-kill $(shell pgrep awesome-api)

build: ## Builds the static website and the awesome-api API
	hugo --quiet
	make lint
	go build

run: ## Runs the application and redirects/appends the console output to file `awesome-api.log`
	./awesome-api >./awesome-api.log 2>&1 &

stop: ## Stops the awesome-api application
	-kill $(shell pgrep awesome-api)

test: ## Tests the available endpoints in the API
	curl "http://localhost:9999"
	curl "http://localhost:9999/health"

post: ## Makes a new post to the website. POST_TITLE and POST_NAME are passed as environment variables
	hugo new posts/$(POST_NAME).md
	sed -i '2s/.*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md
	sed -i '4s/.*/draft: false/' content/posts/$(POST_NAME).md

lint: ## Run the golangci-lint and exit if errors are present in .go src files
	golangci-lint run || exit

unit-tests: ## Run UnitTests on the awesome-api
	go test -v -short -coverprofile=coverage-units.out

help: ## Get help on available commands
	grep ": ##" Makefile | sed 's/## //' | head -n -1
