#!/bin/bash

## usage: source ssh-agent.sh > /dev/null

AGENT_DETAILS=~/.ssh/agent-details
AGENT_SOCKET=~/.ssh/agent

start_agent() {
	echo 'starting up a new SSH agent..'
	rm -f $AGENT_SOCKET
	rm -f $AGENT_DETAILS
	ssh-agent -s -a $AGENT_SOCKET > $AGENT_DETAILS
	source $AGENT_DETAILS
}

if [ $SSH_AUTH_SOCK ]; then
	return 0
elif [ -f $AGENT_DETAILS ]; then
	source $AGENT_DETAILS
	if ! kill -0 $SSH_AGENT_PID >/dev/null 2>&1; then
		start_agent
	fi
else
	start_agent
fi
