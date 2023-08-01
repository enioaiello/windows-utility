@echo off
setlocal enabledelayedexpansion

echo Downloading updates...

set "github_user=enioaiello"
set "repo_name=windows-utility"

set "destination_folder=%USERPROFILE%\Downloads\windows-utility"

for /f "usebackq tokens=2" %%i in (`curl -s https://api.github.com/repos/%github_user%/%repo_name%/releases ^| findstr "tag_name"`) do (
    set "release_name=%%~i"
    set "release_name=!release_name:~1,-1!"
    
    mkdir "!destination_folder!\!release_name!"
    
    curl -LJO "https://github.com/%github_user%/%repo_name%/releases/download/!release_name!/fichier_binaire.ext"
    
    move "fichier_binaire.ext" "!destination_folder!\!release_name!\fichier_binaire.ext"
)

echo Please, restart the application.
pause