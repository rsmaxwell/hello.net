@echo on
setlocal

set OUTPUT=bin

rmdir /s /q %OUTPUT%
mkdir %OUTPUT%

dotnet build
