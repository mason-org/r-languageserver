@echo off

set "PKG_ROOT=%~dp0.."

R --slave -f "%PKG_ROOT%/src/server.r" --args "%PKG_ROOT%/build"
