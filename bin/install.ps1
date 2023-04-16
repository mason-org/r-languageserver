$ErrorActionPreference = "Stop"

$SCRIPT_DIR = Split-Path -Parent $MyInvocation.MyCommand.Path
$PKG_ROOT = (Get-Item $SCRIPT_DIR).Parent.FullName
$BUILD_DIR = Join-Path $PKG_ROOT "build"

New-Item -ItemType Directory -Path $BUILD_DIR -Force | Out-Null

R.exe -f "$($PKG_ROOT)/src/install.r" --args "$BUILD_DIR" "$($args[0])"
