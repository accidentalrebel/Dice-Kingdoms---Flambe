REM Make a folder named "flash-deployment-files"
mkdir flash-deployment-files

REM Copy all contents of the web folder into the flash-deployment-files folder
xcopy /s build\web\*.* flash-deployment-files

REM Go to "flash-deployment-files" folder
cd flash-deployment-files

REM Delete runFlash.html
del runFlash.html

REM Delete runHTML5.html
del runHTML5.html

REM Delete html5.html
del html5.html

REM Delete index.html
del index.html

REM Rename flash.html to index.html
ren flash.html index.html

REM Copy all contents of the targets folder into the current directory
xcopy /s targets\*.*