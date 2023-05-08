This repo automates the creation of a web API using Go and a Makefile.
The `awesome-api` binary can be executed to run the API.

Syntax:
-   `make build`: builds the API, which can be used by running `make run`
-   `make run`: runs the API on *localhost:PORT* where *PORT* is an environment variable (defaults to *9999* if no such variable). Logs all actions on the `awesome-api.log` file.
-   `make stop`: kills the process running the API
-   `make test`: pings the homepage and the `/health` endpoint
-   `make clean`: deletes the API executable and the logs
-   `make help`: provides a description of all commands