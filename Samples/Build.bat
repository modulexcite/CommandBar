@echo off

set FrameworkPath=%SystemRoot%\Microsoft.NET\Framework\v2.0.50727
if exist "%FrameworkPath%\csc.exe" goto :start
set FrameworkPath=%SystemRoot%\Microsoft.NET\Framework\v4.0.30319
if exist "%FrameworkPath%\csc.exe" goto :start
:start

%FrameworkPath%\csc.exe /target:exe /out:..\Build\HelloWorld.exe *.cs /r:..\Build\CommandBar.dll %1 /res:ImageList16.png /res:ImageList24.png
