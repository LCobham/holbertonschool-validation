
.PHONY: clean
clean: ## Removes the `awesome-api` executable and the logs
	rm -rf awesome-api awesome-api.log

.PHONY: run
run: ## Runs the application and redirects/appends the console output to file `awesome-api.log`
	./awesome-api >./awesome-api.log 2>&1 &

.PHONY: stop
stop: ## Stops the awesome-api application
	kill $(shell pgrep awesome-api)

.PHONY: build
build: ## Compile the src code into the binary `awesome-api`
	go build

.PHONY: test
test: ## Tests the available endpoints in the API
	-curl "http://localhost:9999"
	-curl "http://localhost:9999/health"

help: ## Get help on available commands
	grep ": ##" Makefile | sed 's/## //' | head -n -1
