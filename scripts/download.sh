#!/usr/bin/env bash

set -eu

args=(
	--mirror
	--no-parent
	--convert-links
	--adjust-extension
	--no-page-requisites
	--compression=auto
	--domain=www.felixcloutier.com
	https://www.felixcloutier.com/x86/
)
wget "${args[@]}"
rm www.felixcloutier.com/robots.txt
rm www.felixcloutier.com/x86/style.css
#rm www.felixcloutier.com/x86/index.html
