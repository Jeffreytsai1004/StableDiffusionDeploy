@CALL echo off
@CALL set WEUI_VERSION=v1.5.1
@CALL set VENV_NAME=VENV_SD_WEUI_%WEUI_VERSION%_SDXL_001
@CALL set PYTHON_VERISON=3.10.11
@CALL set GIT_VERSION=2.41.0
@CALL set GITLFS_VERSION=3.2.0
@CALL set TORCH_VERSION=2.0.1+cu118
@CALL set GDOWN_CACHE=cache\gdown
@CALL set TORCH_HOME=cache\torch
@CALL set HF_HOME=cache\huggingface
@CALL set PYTHONDONTWRITEBYTECODE=1
@CALL set COMMANDLINE_ARGS=--xformers --opt-sdp-attention --theme dark --api --autolaunch --listen --enable-insecure-extension-access
@CALL echo "-------------------------------------------------------------------------------------"
@CALL echo "          ___ _        _    _         ___  _  __  __         _            _          "
@CALL echo "         / __| |_ __ _| |__| |___ ___|   \(_)/ _|/ _|_  _ __(_)___ _ _   | |         "
@CALL echo "         \__ \  _/ _` | '_ \ / -_)___| |) | |  _|  _| || (_-< / _ \ ' \  |_|         "
@CALL echo "         |___/\__\__,_|_.__/_\___|   |___/|_|_| |_|  \_,_/__/_\___/_||_| (_)         "
@CALL echo "-------------------------------------------------------------------------------------"
@CALL echo LAUNCHING STABLE-DIFFUSION !!!!!
@CALL echo ---------------------------------------------------------------------------------------
@CALL echo LAUNCH ARGS:
@CALL echo   WEUI_VERSION:                 %WEUI_VERSION%
@CALL echo   VENV_NAME:                    %VENV_NAME%
@CALL echo   PYTHON_VERISON:               %PYTHON_VERISON%
@CALL echo   GIT_VERSION:                  %GIT_VERSION%
@CALL echo   GITLFS_VERSION:               %GITLFS_VERSION%
@CALL echo   TORCH_VERSION:                %TORCH_VERSION%
@CALL echo   GDOWN_CACHE:                  %GDOWN_CACHE%
@CALL echo   HF_HOME:                      %HF_HOME%
@CALL echo   PYTHONDONTWRITEBYTECODE:      %PYTHONDONTWRITEBYTECODE%
@CALL echo   COMMANDLINE_ARGS:             %COMMANDLINE_ARGS%
@CALL echo ---------------------------------------------------------------------------------------
@CALL "%~dp0micromamba.exe" shell init --shell=cmd.exe --prefix="%~dp0\"
@CALL condabin\micromamba.bat activate %VENV_NAME%
@CALL cd stable-diffusion-webui
@CALL python -B webui.py %COMMANDLINE_ARGS%
@CALL PAUSE