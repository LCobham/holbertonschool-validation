POST_NAME ?= ''
POST_TITLE ?= ''


.PHONY: clean
clean:;
	rm -rf dist/*

.PHONY: build
build:;
	hugo --quiet

.PHONY: post
post:
	hugo new posts/$(POST_NAME).md
	sed '2s/.*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md
