@echo off
SetLocal EnableDelayedExpansion

set GROUPID=com.rsmaxwell.hello
set ARTIFACTID=hello.net
set PACKAGING=zip
set REPOSITORY_URL=http://192.168.5.38:8080

IF "%BUILD_ID%" == "" (
    set REPOSITORY=snapshots
    set REPOSITORYID=snapshots
    set VERSION=0.0.1-SNAPSHOT
) else (
    set REPOSITORY=build
    set REPOSITORYID=build

    set /a "NUMBER=%BUILD_ID%-0"
    set VERSION=0.0.!NUMBER!
)

set FILENAME=artifact/%ARTIFACTID%.%PACKAGING%
set URL=%REPOSITORY_URL%/repository/%REPOSITORY%

cd C:\Users\jenkins\.jenkins\workspace\hello\artifact

@echo on
mvn deploy:deploy-file -DgroupId=%GROUPID% -DartifactId=%ARTIFACTID% -Dversion=%VERSION% -Dpackaging=%PACKAGING% -Dfile=%FILENAME% -DrepositoryId=%REPOSITORYID% -Durl=%URL%

