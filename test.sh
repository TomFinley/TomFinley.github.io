#!/bin/bash

bundle install && \
  bundle exec jekyll serve --livereload

# Also use --port to control the port if necessary.
# Access the link that Jekyll displays under "Server address" once this script is run.
