REM Make a folder named "html-deployment-files"
mkdir html-deployment-files

REM Copy all contents of the web folder
xcopy /s build\web\*.* html-deployment-files

REM Go to "flash-deployment-files" folder
cd html-deployment-files

REM Delete runFlash.html
del runFlash.html

REM Delete runHTML5.html
del runHTML5.html

REM Delete html5.html
del flash.html

REM Delete index.html
del index.html

REM Rename flash.html to index.html
ren html5.html index.html

REM Copy all contents of the targets folder into the current directory
xcopy /s targets\*.*

REM Delete main-html.js.map
del main-html.js.map