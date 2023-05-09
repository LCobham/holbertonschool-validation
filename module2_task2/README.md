
# Awesome Inc. Website

This file guives a short guideline for the usage of our static website, created with Go-Hugo.


## Prerequisites
- Have Go installed in your computer (version 1.16 onwards)
- Have Hugo installed (version 0.84, otherwise theme won't render correctly)

## Lifecycle
To build the website, simply type `hugo` or `make build`, which will build the website with the `--quiet` flag. This will also build the `awesome-api` binary. The binary, when executed, will run on localhost, port 9999 (unless a port is specified in the environment variable `PORT`). To run the API use `make run`; commands will be logged on `awesome-api.log`. The API is stopped with `make stop`.
To actually visualize the created website, run the command `hugo server`, which will create the website on `localhost:1313`.
The website will be created in the `dist/` directory. To remove this directory and it's contents, run `make clean`. This will also stop the API and remove the API binary and the logs. To test the api, run `make test`, which pings the homepage, and the `/health` endpoint of the API.
To post a new article to the website, run `make POST_NAME=<insert name here> POST_TITLE=<insert title here> post`
The command `make lint` checks for correct coding style in Go source files. `make build` will not execute if the linting process exits with an error.

Help on all commands is available with `make help`.
Unit tests can be run to check the behaviour of the API with `make unit-tests`.
