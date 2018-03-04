#!/usr/bin/env bash
if [[ -z "$1" ]]; then
	echo "No component name provided" >&2
	exit 1
fi
echo "Creating UI component $1" >&2
echo "Attemping to find component dir..." >&2
if [ -r ./.uirc ]; then
	echo ".uirc file found..." >&2
	. ./.uirc
  if [[ -z "$component_dir" ]]; then
		echo "component_dir variable not found in .uirc" >&2
		exit 1
	fi
	dest="$(pwd)/$component_dir$1"
	echo "Scaffolding out component $1 in dir $dest"
	mkdir -p $dest
	cd $dest
	name="$(tr '[:lower:]' '[:upper:]' <<< ${1:0:1})${1:1}"
  if [[ -e ./$name.js || -e ./$name.scss ]]; then
		echo "Files for $name component already exists; Exiting program"
		exit 1
	fi
	$(touch $name.js)
	$(touch $name.scss)
fi
