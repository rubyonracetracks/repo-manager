#!/bin/bash

# NOTE: set -o pipefail is needed to ensure that any error or failure causes the whole pipeline to fail.
# Without this specification, the CI status will provide a false sense of security by showing builds
# as succeeding in spite of errors or failures.
set -eo pipefail

source bin/definitions

mkdir -p $DIR_APP
echo '# Simple Empty Test App' > "$APP_README"
echo 'This app was automatically created with the Repo Manager' >> "$APP_README"

git config --global user.email 'ci@example.com'
git config --global user.name "Continuous Integration"

git_start () {
  git init
  git branch -m main
  git add .
  git commit -m "Added README.md"
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

gh api \
  --method POST \
  -H "Accept: application/vnd.github+json" \
  /orgs/$ORG_NAME/repos \
  -f name="$REPO_NAME" \
  -f description='Dummy test repository' \
  -F private=false
