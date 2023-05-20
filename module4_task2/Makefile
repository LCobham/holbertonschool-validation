POST_NAME ?= ''
POST_TITLE ?= ''


build-docker: ## Build the docker image with all dependencies from the Dockerfile in .build
	@docker build -t awesome:build .build/.

lint: ## Run the golangci-lint and exit if errors are present in .go src files
	@docker run --rm -i hadolint/hadolint < .build/Dockerfile
	@docker run --rm -v $(shell pwd):/app -w /app awesome:build \
		golangci-lint run *.go || exit

check: ## Check format of .md files in content folder
	@docker run --rm -v $(shell pwd):/app -w /app awesome:build \
		markdownlint 'content/**/*.md' || exit

docker-tests: ## Run tests on dockerfile
	@container-structure-test test -i awesome:build -c .build/cst.yml

validate: ## Validate index.html
	@if [ -f ./dist/index.html ]; then \
		@docker run --rm -v $(shell pwd):/app -w /app awesome:build \
			./w3c_validator.py ./dist/index.html || true; \
	fi;

build-hugo: ## Builds the static website using Hugo
	@docker run --rm -v $(shell pwd):/app -w /app awesome:build \
		hugo --quiet

build-api: ## Build the API from Go src files
	@docker run --rm -v $(shell pwd):/app -w /app awesome:build \
		go build -o awesome-api ./*.go

build: build-hugo build-api ## Builds the static website and the awesome-api API
	@echo "Build completed successfully"

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
	@docker run --rm --volume=$(shell pwd):/app --workdir=/app awesome:build \
		go test -v -short -coverprofile=coverage-units.out

integration-tests: ## Run Integration tests on the awesome-api
	@docker run --rm --volume=$(shell pwd):/app --workdir=/app awesome:build \
		go test -v -coverprofile=coverage-integrations.out

test: validate unit-tests integration-tests ## Tests the available endpoints in the API
	@echo "Finnished running all unit & integration tests"

package: ## Compress the dist directory and the awesome API in a ZIP file
	@zip -r awesome-website dist/ awesome-api

post: ## Makes a new post to the website. POST_TITLE and POST_NAME are passed as environment variables
	@docker run --rm -v $(shell pwd):/app -w /app awesome:build \
		hugo new posts/$(POST_NAME).md
	@sed -i '2s/.*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md
	@sed -i '4s/.*/draft: false/' content/posts/$(POST_NAME).md

help: ## Get help on available commands
	@fgrep -h "##" Makefile | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
