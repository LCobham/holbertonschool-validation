POST_NAME ?= ''
POST_TITLE ?= ''


lint: ## Run the golangci-lint and exit if errors are present in .go src files
	@golangci-lint run *.go || exit

check: ## Check format of .md files in content folder
	@markdownlint 'content/**/*.md' || exit
	@find ./content -name \*.md -print0 | xargs -0 -n1 markdown-link-check || exit

validate: ## Validate index.html
	@if [ -f ./dist/index.html ]; then \
		./opt/W3C-Validator/w3c_validator.py ./dist/index.html || true; \
	fi;

build: check ## Builds the static website and the awesome-api API
	@hugo --quiet
	@go build -o awesome-api *.go

run: ## Runs the application and redirects/appends the console output to file `awesome-api.log`
	@./awesome-api >./awesome-api.log 2>&1 &

stop: ## Stops the awesome-api application
	@pkill awesome-api || true

.PHONY: clean
clean: stop ## Removes the `dist/` directory, created when building the website. Removes the API executable and log file. 
	@rm -rf dist || true
	@rm -rf awesome-api awesome-api.log || true
	@rm coverage-units.out coverage-integrations.out || true
	@rm awesome-website.zip || true

unit-tests: ## Run UnitTests on the awesome-api
	@go test -v -short -coverprofile=coverage-units.out

integration-tests: ## Run Integration tests on the awesome-api
	@go test -v -coverprofile=coverage-integrations.out

test: validate unit-tests integration-tests ## Tests the available endpoints in the API
	@echo "Finnished running all unit & integration tests"

package: ## Compress the dist directory and the awesome API in a ZIP file
	@zip -r awesome-website dist/ awesome-api

post: ## Makes a new post to the website. POST_TITLE and POST_NAME are passed as environment variables
	@hugo new posts/$(POST_NAME).md
	@sed -i '2s/.*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md
	@sed -i '4s/.*/draft: false/' content/posts/$(POST_NAME).md

help: ## Get help on available commands
	@grep "##" Makefile | sed 's/:.*## /: /' | head -n -1
