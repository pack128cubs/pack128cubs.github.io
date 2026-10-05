#!/usr/bin/env bash
# Local preview without installing Ruby: builds and serves the site in Docker.
# Usage: script/serve-docker.sh [port]     then open http://<host>:<port>/
set -euo pipefail
cd "$(dirname "$0")/.."
PORT="${1:-4000}"
exec docker run --rm --name pack128-site \
  -u "$(id -u):$(id -g)" -e HOME=/tmp -e BUNDLE_PATH=/site/vendor/bundle \
  -v "$PWD":/site -w /site \
  -p "$PORT":4000 ruby:3.4 \
  bash -c 'bundle install --quiet && bundle exec jekyll serve --host 0.0.0.0 --port 4000'
