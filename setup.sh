#!/bin/bash

# NOTE: set -o pipefail is needed to ensure that any error or failure causes the whole pipeline to fail.
# Without this specification, the CI status will provide a false sense of security by showing builds
# as succeeding in spite of errors or failures.
set -eo pipefail

TYPE='ed25519'
FILENAME="id_$TYPE"
PATHNAME_PRIVATE="$HOME/.ssh/$FILENAME"
PATHNAME_PUBLIC="$PATHNAME_PRIVATE.pub"
PATHNAME_KNOWN_HOSTS="$HOME/.ssh/known_hosts"

# Use default path name for SSH key files.
# Use no password for the SSH key files.
# Piping in the newline character means automatically pressing enter.
echo 'STEP 1: generating the SSH key'
ssh-keygen -t "$TYPE" -N '' -f "$PATHNAME_PRIVATE" -C 'jhsu802701@jasonhsu.com' <<<$'\n'

wait
echo '------------'
echo 'ssh-agent -s'
eval "$(ssh-agent -s)"
echo ''
wait

echo 'STEP 2: adding the SSH private key to the ssh-agent'
ssh-add ~/.ssh/id_$TYPE
echo ''

# Necessary to establish the authenticity of the host and skip another prompt
echo 'STEP 3: ssh-keyscan'
ssh-keyscan -H github.com >> ~/.ssh/known_hosts

echo 'STEP 4: Go to https://github.com/settings/keys .'
echo "Copy the contents of $PATHNAME_PUBLIC to SSH Public Keys and"
echo 'click on "Save".'
echo 'Press Enter when finished.'
read
