@echo off
SetLocal EnableDelayedExpansion

IF "%BUILD_ID%" == "" (
    set VERSION=0.0.1-SNAPSHOT
) else (
    set /a "NUMBER=%BUILD_ID%-0"
    set VERSION=0.0.!NUMBER!
)

for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "BUILD_DATE=%YYYY%%MM%%DD%-%HH%%Min%%Sec%"

for /F "delims=" %%G in ('dir /b /s .\Views\Home\About.cshtml') do (
   Echo File: %%G
   powershell -Command "(gc %%G) -replace '{{ VERSION }}',    '%VERSION%'    | Out-File -encoding ASCII %%G"
   powershell -Command "(gc %%G) -replace '{{ BUILD_ID }}',   '%BUILD_ID%'   | Out-File -encoding ASCII %%G"
   powershell -Command "(gc %%G) -replace '{{ BUILD_DATE }}', '%BUILD_DATE%' | Out-File -encoding ASCII %%G"
   powershell -Command "(gc %%G) -replace '{{ GIT_COMMIT }}', '%GIT_COMMIT%' | Out-File -encoding ASCII %%G"
   powershell -Command "(gc %%G) -replace '{{ GIT_BRANCH }}', '%GIT_BRANCH%' | Out-File -encoding ASCII %%G"
   powershell -Command "(gc %%G) -replace '{{ GIT_URL }}',    '%GIT_URL%'    | Out-File -encoding ASCII %%G"
)


