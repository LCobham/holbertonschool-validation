POST_NAME ?= ''
POST_TITLE ?= ''


.PHONY: clean
clean: ## Removes the `dist/` directory, created when building the website
	rm -rf dist/*

.PHONY: build
build: ## Builds the static website
	hugo --quiet

.PHONY: post
post: ## Makes a new post to the website. POST_TITLE and POST_NAME are passed as environment variables
	hugo new posts/$(POST_NAME).md
	sed -i '2s/.*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md
	sed -i '4s/.*/draft: false/' content/posts/$(POST_NAME).md

help: ## Get help on available commands
	grep ": ##" Makefile | sed '1,3s/## //' | head -n -1
