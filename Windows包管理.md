# Windows包管理工具：Chocolatey

## 一、安装Chocolatey

> 修改默认安装路径
> 
> 在执行安装Chocolatey命令前，在环境变量->系统变量添加 ChocolateyInstall 变量，变量值=安装路径
> 
> 或者
> 
> 1.cmd.exe
> 
> ```
> setx ChocolateyInstall D:\Chocolatey /M
> ```
> 
> 2.powershell.exe
> 
> ```
> & setx.exe ChocolateyInstall D:\Chocolatey /M
> ```
> 
> 实际大部分程序还是会安装到C盘
> 


1. 方式一 启动powershell

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

2. 方式二 启动CMD

```
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
```



## 二、安装软件

> -y 不需要手动确认，自动安装
> --version 安装指定版本


可以安装ChocolateyGUI，这是一个图形化的界面，可以方便的执行上述命令。
```
choco install -y chocolateygui

//一次安装多个软件包
choco install -y potplayer teamviewer geekuninstaller

安装notepad++
choco install -y notepadplusplus.install
安装bandizip
choco install -y bandizip --version 6.25
安装typora
choco install -y typora --version 0.9.95

安装JDK8、Node、git、VS Code、mobaxterm、chrome
choco install -y jdk8 nodejs-lts git.install vscode mobaxterm googlechrome

安装IntelliJ IDEA：
choco install intellijidea-community //社区版
choco install intellijidea-ultimate //旗舰版

//安装dev-package.config文件内描述的所有软件包
choco install  -y dev-package.config
```

dev-package.config：
```xml
<?xml version="1.0" encoding="utf-8"?>
	<packages>
	  <package id="chocolateygui" />
	  
	  <package id="jdk8" />
	  <package id="nodejs-lts" />
	  <package id="git.install" />
	  <package id="googlechrome"/>
	  <package id="vscode" />
	  <package id="notepadplusplus.install"/>
	  <package id="mobaxterm" />
	  
	  <package id="bandizip" version="6.25" />
	  <!-- <package id="7zip.install" /> -->
	  <package id="potplayer" />
	  <package id="teamviewer" />
	  <package id="geekuninstaller" />
	  
	  <!-- <package id="typora" version="0.9.95" /> -->
	  <package id="marktext.install" />
	</packages>all" />
</packages>
```

<?xml version="1.0" encoding="utf-8"?>

文件名称随意，但是扩展名必须是.config。

通过传统方式安装软件，如果配置了环境变量，例如JAVA_HOME,PATH等等，都需要重启命令行工具，甚至要等一会才能生效。

Chocolatey提供了一个refreshenv命令，可以快速生效环境变量。



## 三、其他命令

查看Chocolatey版本
```
choco
```
搜索包
```
choco search <package>
choco list <package>

choco search <package> -all      搜索所有版本
choco search typora -all
choco search  bandizip -all

choco list --local 		查看本地程序安装列表
```

更新包
```
choco outdated  	检查更新，会把所有「过期」的应用全部列出来，可以按需更新

choco upgrade chocolatey
choco upgrade --yes Bandizip

choco upgrade --yes all  	升级所有程序

choco pin windirstat 	固定包的版本，防止包被升级 
```


卸载包
```
choco uninstall git
choco uninstall notepadplusplus googlechrome atom 7zip  同时卸载多个包
choco uninstall ruby --version 1.8.7.37402    卸载指定版本的包
choco uninstall nodejs.install --all-versions
```




## 四、卸载Chocolatey
```
1. 删除环境变量 ChocolateyInstall 对应的文件夹（默认：C:\ProgramData\chocolatey）
2. 删除环境变量 ChocolateyInstall 
3. 删除环境变量 ChocolateyToolsLocation，部分工具软件安装的位置，删除需谨慎
4. 删除环境变量 ChocolateyLastPathUpdate
5. 更新环境变量 PATH ，去掉 Chocolatey 相关的配置
```