#!/usr/bin/env sh

set -e

npm run build

cd dist

git init
git add -A
git commit -m "New Deplayment"
git push -f git@github.com:pragmatic-reviews/vue-mongo.git master:gh-pages

cd -

