# Deploy information

The `awesome-website.zip` contains the contents necessary to run
the webpage and the API. If a commit with a tag of `1.0.0` was
present, a release should point to that tag. The goal of this zip
file is to avoid building these repetitively...
instead, GitHub rebuilds the package everytime code is pushed to
the master branch (or, conversely, once every day at 6.15 am).

Nonetheless, both the webpage and the api must be started with
`make run`. (After unziping, of course). Logs showing the interactions
with the API should be written to `awesome-api.log`. To quickly check
the webpage is running as expected, we can run the application with
`make run` and ping the `/healthcheck` endpoint on port 9999:

```curl http://localhost:9999/healthcheck ; echo ""```

If the API is functioning well, `ALIVE` should be printed to the console.
