#!/bin/bash

# NOTE: set -o pipefail is needed to ensure that any error or failure causes the whole pipeline to fail.
# Without this specification, the CI status will provide a false sense of security by showing builds
# as succeeding in spite of errors or failures.
set -eo pipefail

source bin/definitions

echo "Name of organization: $ORG_NAME"
echo ''
REPO_JSON=$(curl -s https://api.github.com/orgs/$ORG_NAME/repos | jq '.[]' | jq '.name')
for REPO_NAME in $REPO_JSON; do
  echo "Deleting $REPO_NAME"
  gh api \
  --method DELETE \
  -H "Accept: application/vnd.github+json" \
  /orgs/$ORG_NAME/repos \
  -f name="$REPO_NAME"
done


