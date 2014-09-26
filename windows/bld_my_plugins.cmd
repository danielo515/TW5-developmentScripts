@echo off

rem builds demo version of my plugins. Change the paths and names acording 

rem Set up the build output directory

if "x%TW5_BUILD_OUTPUT%" == "x" (
	set TW5_BUILD_OUTPUT=..\danielo515.github.com
)

if not exist %TW5_BUILD_OUTPUT%\nul (
	echo A valid TW5_BUILD_OUTPUT environment variable must be set
	exit 1
)

echo Using TW5_BUILD_OUTPUT as %TW5_BUILD_OUTPUT%
echo.

rem Create the `static` directories if necessary

setlocal enableextensions
mkdir %TW5_BUILD_OUTPUT%\static
setlocal disableextensions

rem Delete any existing content

del /q /s %TW5_BUILD_OUTPUT%\static


rem plugin-name.html: wiki to demo import-tools plugin

node .\tiddlywiki.js ^
	.\editions\plugin-name ^
	--verbose ^
	--output %TW5_BUILD_OUTPUT% ^
	--rendertiddler $:/core/save/all plugin-name.html text/plain ^
	|| exit 1

rem Make the CNAME file that GitHub Pages requires

echo tiddlywiki.com > %TW5_BUILD_OUTPUT%\CNAME

rem Run the test edition to run the Node.js tests and to generate test.html for tests in the browser

.\test.cmd
