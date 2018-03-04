#!/usr/bin/env bash
component_dir="lib/components"
core_styles_dir="lib/styles"
core_scss="core.scss"
core_js="lib/core.js"

if [[ -z "$1" ]]; then
  echo "No component name provided" >&2
	exit 1
fi
echo "Creating UI component $1" >&2
echo "Attemping to find component dir..." >&2
if [[ -r ./.uirc ]]; then
	echo ".uirc file found..." >&2
	. ./.uirc
fi
componentName="$(tr '[:lower:]' '[:upper:]' <<< ${1:0:1})${1:1}"	
dest="$(pwd)/$component_dir$componentName"

if [[ ! -d $(pwd)/$core_styles_dir ]]; then
  mkdir -p $(pwd)/$core_styles_dir
fi
coreSass=$(pwd)/$core_styles_dir$core_scss
`touch $coreSass`
echo "import \"../components/$componentName/$componentName.scss\";" >> $coreSass
`touch $(pwd)/core_js`

echo "Scaffolding out component $1 in dir $dest"
mkdir -p $dest
cd $dest
if [[ -e ./$componentName.js || -e ./$name.scss ]]; then
	echo "Files for $componentName component already exists; Exiting program"
	exit 1
fi

#Create file for sass and js, populate js file with basic react component tempalte
$(touch $componentName.scss)
$(touch $componentName.js)

echo "Templating JS file..."
echo -e "import React, { PureComponent } from 'react';
import PropTypes from 'prop-types';

export default class $componentName extends PureComponent {
  constructor() {
    super();
  }

  render() {

  }
}

$componentName.propTypes = {

}
" > $componentName.js

#Add files to the core files for exporting as library

cd ..
`touch index.js`
echo "export { default as $componentName } from './$componentName/$componentName';" >> index.js
exit 0
