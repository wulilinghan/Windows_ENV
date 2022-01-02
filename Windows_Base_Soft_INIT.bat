@echo off
rem CMD 获取管理员权限
if exist "%SystemRoot%\SysWOW64" path %path%;%windir%\SysNative;%SystemRoot%\SysWOW64;%~dp0
bcdedit >nul
if '%errorlevel%' NEQ '0' (goto UACPrompt) else (goto UACAdmin)
:UACPrompt
%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&exit
exit /B
:UACAdmin
cd /d "%~dp0"

rem 设置Chocolatey的安装目录
rem setx ChocolateyInstall D:\Chocolatey /M

rem CMD 安装Chocolatey
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

rem 当前程序休眠先5秒，再继续执行
rem timeout /nobreak /t 5

rem 查看chocolatey版本
rem choco

rem 进入当前脚本的文件夹
cd %~dp0 

rem 安装Windows_Chocolatey_Package_Config.config文件内描述的所有软件包
choco install Windows_Chocolatey_Package_Config.config -y

pause