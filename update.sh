#!/usr/bin/env nix-shell
#!nix-shell -p bash -p nix-update
#!nix-shell -i bash

exec nix-update -f update.nix --version=branch x86-manpages
