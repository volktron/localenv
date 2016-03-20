echo Installing nginx
url="http://nginx.org/download/"
curl -s nginx.org/en/download.html | grep --max-count=1 -Po 'nginx[^"]{1,}.zip' | head -n 1 | xargs echo "$url$1" | tr -d ' ' | xargs curl > nginx.zip

unzip nginx.zip > /dev/null
mkdir nginx
mv nginx-*/* nginx
rmdir nginx-*

echo Setting nginx.conf
pwd -W | xargs -i echo {} '/www/;' | tr -d ' ' | xargs echo 'c\\root ' | xargs echo '/root localenv.root/' | xargs -i sed {} config/nginx/nginx.conf > nginx/conf/nginx.conf

echo Installing PHP
url="http://windows.php.net/downloads/releases/"
curl -s http://windows.php.net/download | tac | tac | grep --max-count=1 -Po 'php[^"]{1,}-x64.zip' | xargs echo "$url$1" | tr -d ' ' | xargs curl > php.zip

unzip php.zip -d php > /dev/null

cp config/php/php.ini php/php.ini
cp config/php/vcruntime140.dll php/vcruntime140.dll

echo Cleaning up

rm php.zip
rm nginx.zip

echo Done.