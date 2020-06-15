#!/bin/sh

# Start the SSH agent and load key.
source agent-start "$GITHUB_ACTION"
echo "$INPUT_REMOTE_KEY" | agent-add
echo $INPUT_REMOTE_KEY
# Add strict errors and deploy.
set -x
sh -c "rsync $INPUT_SWITCHES -e 'ssh -o StrictHostKeyChecking=no -p $INPUT_REMOTE_PORT $INPUT_RSH' $GITHUB_WORKSPACE/$INPUT_PATH $INPUT_REMOTE_USER@$INPUT_REMOTE_HOST:$INPUT_REMOTE_PATH"
