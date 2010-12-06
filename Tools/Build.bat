@echo off

set FrameworkPath=%SystemRoot%\Microsoft.NET\Framework\v2.0.50727
if exist "%FrameworkPath%\csc.exe" goto :Start
set FrameworkPath=%SystemRoot%\Microsoft.NET\Framework\v4.0.30319
if exist "%FrameworkPath%\csc.exe" goto :Start
:start

%FrameworkPath%\csc.exe /target:library /out:..\Build\CommandBar.dll *.cs /keyfile:KeyPair.snk %1

