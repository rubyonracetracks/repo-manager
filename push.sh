#!/bin/bash

# NOTE: set -o pipefail is needed to ensure that any error or failure causes the whole pipeline to fail.
# Without this specification, the CI status will provide a false sense of security by showing builds
# as succeeding in spite of errors or failures.
set -eo pipefail

source bin/definitions

echo "Name of application: $APP_NAME"
echo "Name of repository: $REPO_NAME"
echo "Name of organization: $ORG_NAME"

echo 'Pushing the app to GitHub'

cd $DIR_APP && git_push origin main
