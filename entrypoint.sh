#!/bin/sh -l

# Setup SSH
mkdir -p /root/.ssh
echo "$INPUT_SSH_PRIVATE_KEY" > /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa

git config --global --add safe.directory /github/workspace
git remote add destination "$INPUT_TARGET_REPO_URL"
git fetch --unshallow
git push destination "$INPUT_SOURCE_BRANCH:$INPUT_DESTINATION_BRANCH" -f
