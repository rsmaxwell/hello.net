@echo off
setlocal

set DIST=dist
set ARTIFACT=artifact


rmdir /s /q %DIST%
mkdir %DIST%

rmdir /s /q %ARTIFACT%
mkdir %ARTIFACT%


dotnet publish hello.net.csproj --output %DIST% 


cd %DIST%
copy ..\scripts\run.bat
zip ..\%ARTIFACT%\hello.net.zip * 

