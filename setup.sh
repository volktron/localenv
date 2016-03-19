echo Installing nginx
url="http://nginx.org/download/"
curl -s nginx.org/en/download.html | grep --max-count=1 -Po 'nginx[^"]{1,}.zip' | head -n 1 | xargs echo "$url$1" | tr -d ' ' | xargs curl > nginx.zip

unzip nginx.zip > /dev/null
mkdir nginx
mv nginx-*/* nginx
rmdir nginx-*

echo Installing PHP
url="http://windows.php.net/downloads/releases/"
curl -s http://windows.php.net/download | tac | tac | grep --max-count=1 -Po 'php[^"]{1,}-x64.zip' | xargs echo "$url$1" | tr -d ' ' | xargs curl > php.zip

unzip php.zip -d php > /dev/null

echo Done.