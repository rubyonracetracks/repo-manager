#!/bin/bash

# NOTE: set -o pipefail is needed to ensure that any error or failure causes the whole pipeline to fail.
# Without this specification, the CI status will provide a false sense of security by showing builds
# as succeeding in spite of errors or failures.
set -eo pipefail

source bin/definitions

echo "Name of organization: $ORG_NAME"
echo ''
REPO_JSON=$(curl -s https://api.github.com/orgs/$ORG_NAME/repos | jq '.[]' | jq '.name')
for REPO_NAME_WITH_QUOTES in $REPO_JSON; do
  REPO_NAME=`sed -e 's/^"//' -e 's/"$//' <<<"$REPO_NAME_WITH_QUOTES"` 
  if [[ "$REPO_NAME" == *'test'* ]]; then
    bin/gh-api-delete-repo "$ORG_NAME" "$REPO_NAME"
  fi
done
