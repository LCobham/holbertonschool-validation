
# Awesome Inc. Website

This file guives a short guideline for the usage of our static website, created with Go-Hugo.


## Prerequisites
- Have Go installed in your computer (version 1.16 onwards)
- Have Hugo installed (version 0.84, otherwise theme won't render correctly)

## Lifecycle
To build the website, simply type `hugo` or `make build`, which will build the website with the `--quiet` flag.
To actually visualize the created website, run the command `hugo server`, which will create the website on `localhost:1313`.
The website will be created in the `dist/` directory. To remove this directory and it's contents, run `make clean`
To post a new article to the website, run `make POST_NAME=<insert name here> POST_TITLE=<insert title here> post`

Help on all commands is available with `make help`.
