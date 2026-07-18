#!/usr/bin/env bash

if [[ -z "$1" ]]; then
  echo -e "Network was not given.\n"
  echo -e "Available networks: 'songbird' | 'flare (default)'\n"
  echo -e "Exiting...\n"
  exit 1
else
  if [[ "$1" == "songbird" ]]; then
    docker run -it --rm -v ${PWD}/:/srv/tempo/signing-tool node:24 /bin/bash -c 'cd /srv/tempo/signing-tool ; rm -f .env ; ln -s .env_songbird .env ; npm install -g pnpm ; pnpm install ; pnpm build ; /bin/bash'
  else
    docker run -it --rm -v ${PWD}/:/srv/tempo/signing-tool node:24 /bin/bash -c 'cd /srv/tempo/signing-tool ; rm -f .env ; ln -s .env_flare .env ; npm install -g pnpm ; pnpm install ; pnpm build ; /bin/bash'
  fi
fi
