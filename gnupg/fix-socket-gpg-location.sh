#!/bin/bash

# https://disqus.com/home/discussion/flameeyes-blog/gnupg_agent_forwarding_with_openpgp_cards/#comment-2956228272

if [ -n "$SSH_CONNECTION" ]; then
  GPG_AGENT_SOCK="$(gpgconf --list-dirs agent-socket)"
  GPG_AGENT_SOCK_FWD=${HOME}/.gnupg/S.gpg-agent
if [ ! -e $GPG_AGENT_SOCK -a -S ${GPG_AGENT_SOCK_FWD} ];
then
  mkdir -p `basename $GPG_AGENT_SOCK`
  # The link might be present but point to nothing,
  ln -sf $GPG_AGENT_SOCK_FWD $GPG_AGENT_SOCK
fi
else
  unset SSH_AGENT_PID
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
  gpg-connect-agent /bye
fi
