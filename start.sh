#!/usr/bin/env bash

if [[ -z "$1" ]]; then
  echo -e "Network was not given.\n"
  echo -e "Available networks: 'songbird' | 'flare (default)'\n"
  echo -e "Exiting...\n"
  exit 1
else
  rm -f .env

  if [[ "$1" == "songbird" ]]; then
    ln -s .env_songbird .env
  else
    ln -s .env_flare .env
  fi

  docker run -it --rm -v ${PWD}/:/srv/tempo/signing-tool node:18 /bin/bash -c 'cd /srv/tempo/signing-tool ; /bin/bash'
fi
