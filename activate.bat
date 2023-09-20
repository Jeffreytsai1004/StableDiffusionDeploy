@CALL set WEUI_VERSION=v1.6.0
@CALL set VENV_NAME=VENV_SD_WEUI_%WEUI_VERSION%_aP5GXiY2Eg
@CALL "%~dp0micromamba.exe" shell init --shell=cmd.exe --prefix="%~dp0\"
start cmd /k "%~dp0condabin\micromamba.bat" activate %VENV_NAME%
