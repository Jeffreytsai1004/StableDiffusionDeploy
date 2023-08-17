@CALL set VENV_NAME=VENV_SD_WEUI_v1.5.1_SDXL_001
@CALL "%~dp0micromamba.exe" shell init --shell=cmd.exe --prefix="%~dp0\"
start cmd /k "%~dp0condabin\micromamba.bat" activate %VENV_NAME%
