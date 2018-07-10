# React UI Component Cauldron

## This is CLI that can be used to generate the base code for a react component that is part of a UI library. 

Usage: Simply download and add the directory to your PATH variable, then call the script in root directory of your UI Library project like so...

```shell
component_cauldron ComponentName
```
Arguments:
* ComponentName : Required string with no whitespaces

Once run under default settings, your project directory will look like this: 

.
* lib/
 * components/
  * ComponentName/
    * ComponentName.js
    * ComponentName.scss
    * index.js
 * styles/
    * core.scss
* index.js


If you want to change the save structure, create a `.uirc` file in the root project directory and define them there

```shell
component_dir="foo/bar/fiz/"
```
.uirc Variable | Description
-------------- | -------------
component_dir  | Directory from root where you want your components saved (default: "lib/components/")
core_styles_dir | Directory from root where you want styles saved (default: "lib/styles/")
core_scss | Name of core sass file you will export component styles from (default: "core.scss")
core_js | File where you will export all components from (default: "lib/core.js")
