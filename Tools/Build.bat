@echo off

set FrameworkPath=%SystemRoot%\Microsoft.NET\Framework\v2.0.50727
if exist "%FrameworkPath%\csc.exe" goto :Start
set FrameworkPath=%SystemRoot%\Microsoft.NET\Framework\v4.0.30319
if exist "%FrameworkPath%\csc.exe" goto :Start
:start

if exist ..\Build rd /q /s ..\Build
md ..\Build

pushd ..\Source
%FrameworkPath%\csc.exe /target:library /out:..\Build\CommandBar.dll *.cs /keyfile:KeyPair.snk %1
popd

pushd ..\Example
%FrameworkPath%\csc.exe /target:winexe /out:..\Build\Example.exe *.cs /r:..\Build\CommandBar.dll /res:ImageList16.png /res:ImageList24.png
popd
