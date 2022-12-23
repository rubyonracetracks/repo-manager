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

git_start {
  git init
  git branch -m main
  git add .
  git commit -m "Added README.md"
}

cd $DIR_APP && git_start

curl -u 'jhsu802701' "https://api.github.com/orgs/$ORG_NAME/repos" -d '{"name":"$NAME_OF_REPO", "description":"Dummy test app", "private": false, "has_issues": false, "has_projects": false, "has_wiki":false }'
