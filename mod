#!/usr/bin/env bash

anybox_dir="$(dirname "$0")"
cd "$anybox_dir" || {
  echo "Failed to cd into anybox dir: $anybox_dir"
  exit 1
}

if [ $# -eq 0 ]; then
  echo "Usage: ./mod {$(echo $(ls ws) | tr ' ' '|')}"
fi
source loader

load_dir skel

