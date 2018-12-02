#!/bin/bash

mkdir -p ~/.ssh && chmod 700 ~/.ssh
echo "$SSH_PRIVATE_KEY" | tr -d '\r' > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config
