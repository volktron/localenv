@ECHO OFF

if "%1" == "start" goto START
if "%1" == "stop" goto STOP
goto DONE

:START
echo Starting localenv
start php\php-cgi.exe -b localhost:9000

PUSHD nginx
start nginx.exe
POPD

goto DONE

:STOP
echo Stopping localenv

PUSHD nginx
nginx.exe -s stop
POPD

:DONE