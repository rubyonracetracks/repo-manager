#!/bin/bash

# NOTE: set -o pipefail is needed to ensure that any error or failure causes the whole pipeline to fail.
# Without this specification, the CI status will provide a false sense of security by showing builds
# as succeeding in spite of errors or failures.
set -eo pipefail

source bin/definitions

mkdir -p $DIR_APP
bin/git-config

git_start () {
  echo '# Simple Empty Test App' > "$APP_README"
  echo 'This app was automatically created with Repo Manager.' >> "$APP_README"
  wait
  git init
  wait
  git add .
  wait
  git commit -m "Added README.md"
  wait
  git branch -M main
  wait
  git remote add origin "git@github.com:$ORG_NAME/$APP_NAME.git"
  wait
}

echo '-----------------------'
echo 'BEGIN: creating the app'
echo '-----------------------'
wait
cd $DIR_APP && git_start
wait
echo '--------------------------'
echo 'FINISHED: creating the app'
echo '--------------------------'

echo "Name of application: $APP_NAME"
echo "Name of repository: $REPO_NAME"
echo "Name of organization: $ORG_NAME"
