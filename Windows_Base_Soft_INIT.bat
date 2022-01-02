@echo off
rem 安装Chocolatey
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

rem 设置Chocolatey的安装目录
setx ChocolateyInstall D:\Chocolatey /M

rem 安装Windows_Chocolatey_Package_Config.config文件内描述的所有软件包
choco install Windows_Chocolatey_Package_Config.config -y 
pause