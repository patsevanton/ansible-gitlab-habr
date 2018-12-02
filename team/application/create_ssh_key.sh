#!/bin/bash

which ssh-agent || ( apt-get update -y && apt-get install openssh-client -y )
eval $(ssh-agent -s)
echo "$SSH_PRIVATE_KEY" | tr -d '\r' | ssh-add - > /dev/null
mkdir -p ~/.ssh
chmod 700 ~/.ssh
echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config

# Old
#mkdir -p ~/.ssh && chmod 700 ~/.ssh
#echo "$SSH_PRIVATE_KEY" | tr -d '\r' > ~/.ssh/id_rsa
#chmod 600 ~/.ssh/id_rsa
#eval "$(ssh-agent -s)"
#ssh-add ~/.ssh/id_rsa
