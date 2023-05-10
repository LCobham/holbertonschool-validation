POST_NAME ?= ''
POST_TITLE ?= ''


.PHONY: clean
clean: stop ## Removes the `dist/` directory, created when building the website. Removes the API executable and log file. 
	-rm -rf dist
	-rm -rf awesome-api awesome-api.log
	-rm coverage-units.out coverage-integrations.out

build: lint check ## Builds the static website and the awesome-api API
	hugo --quiet
	go build -o awesome-api *.go

run: build ## Runs the application and redirects/appends the console output to file `awesome-api.log`
	./awesome-api >./awesome-api.log 2>&1 &
	make test

stop: ## Stops the awesome-api application
	-kill $(shell pgrep awesome-api)

test: validate ## Tests the available endpoints in the API
	make unit-tests
	make integration-tests

post: ## Makes a new post to the website. POST_TITLE and POST_NAME are passed as environment variables
	hugo new posts/$(POST_NAME).md
	sed -i '2s/.*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md
	sed -i '4s/.*/draft: false/' content/posts/$(POST_NAME).md

lint: ## Run the golangci-lint and exit if errors are present in .go src files
	golangci-lint run *.go || exit

unit-tests: ## Run UnitTests on the awesome-api
	go test -v -short -coverprofile=coverage-units.out

integration-tests: ## Run Integration tests on the awesome-api
	go test -v -coverprofile=coverage-integrations.out

check: ## Check format of .md files in content folder
	markdownlint 'content/**/*.md' || exit
	find ./content -name \*.md -print0 | xargs -0 -n1 markdown-link-check || exit

validate: ## Validate index.html
	if [ -f ./dist/index.html ]; then \
		./opt/W3C-Validator/w3c_validator.py ./dist/index.html || true; \
	fi;

help: ## Get help on available commands
	grep "##" Makefile | sed 's/:.*## /: /' | head -n -1
