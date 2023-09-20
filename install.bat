@CALL echo off

@CALL echo ---------------------------------------------------------------------------------------
@CALL echo Setting VARIABLES
@CALL set WEUI_VERSION=v1.6.0
@CALL set VENV_NAME=VENV_SD_WEUI_%WEUI_VERSION%_aP5GXiY2Eg
@CALL set PYTHON_VERISON=3.10.11
@CALL set GIT_VERSION=2.41.0
@CALL set GITLFS_VERSION=3.2.0
@CALL set XFORMERS_VERSION=0.0.20
@CALL set TORCH_VERSION=2.0.1+cu118
@CALL set CLIP_CACHE=cache\clip
@CALL set GDOWN_CACHE=cache\gdown
@CALL set TORCH_HOME=cache\torch
@CALL set HF_HOME=cache\huggingface
@CALL set PYTHONDONTWRITEBYTECODE=1
@CALL set COMMANDLINE_ARGS=--theme dark --xformers --opt-sdp-attention --api --autolaunch --listen --enable-insecure-extension-access
@CALL echo VARIABLES setted

@CALL echo "-------------------------------------------------------------------------------------"
@CALL echo "          ___ _        _    _         ___  _  __  __         _            _          "
@CALL echo "         / __| |_ __ _| |__| |___ ___|   \(_)/ _|/ _|_  _ __(_)___ _ _   | |         "
@CALL echo "         \__ \  _/ _` | '_ \ / -_)___| |) | |  _|  _| || (_-< / _ \ ' \  |_|         "
@CALL echo "         |___/\__\__,_|_.__/_\___|   |___/|_|_| |_|  \_,_/__/_\___/_||_| (_)         "
@CALL echo "-------------------------------------------------------------------------------------"
@CALL echo INSTALL STABLE-DIFFUSION !!!!!

@CALL echo ---------------------------------------------------------------------------------------
@CALL echo LAUNCH ARGS:
@CALL echo   WEUI_VERSION:                 %WEUI_VERSION%
@CALL echo   VENV_NAME:                    %VENV_NAME%
@CALL echo   PYTHON_VERISON:               %PYTHON_VERISON%
@CALL echo   GIT_VERSION:                  %GIT_VERSION%
@CALL echo   GITLFS_VERSION:               %GITLFS_VERSION%
@CALL echo   XFORMERS_VERSION:             %XFORMERS_VERSION%
@CALL echo   TORCH_VERSION:                %TORCH_VERSION%
@CALL echo   CLIP_CACHE:                   %CLIP_CACHE%
@CALL echo   GDOWN_CACHE:                  %GDOWN_CACHE%
@CALL echo   HF_HOME:                      %HF_HOME%
@CALL echo   PYTHONDONTWRITEBYTECODE:      %PYTHONDONTWRITEBYTECODE%
@CALL echo   COMMANDLINE_ARGS:             %COMMANDLINE_ARGS%

@CALL echo ---------------------------------------------------------------------------------------
@CALL echo Deploying %VENV_NAME%
@CALL "%~dp0micromamba.exe" create -n %VENV_NAME% python=%PYTHON_VERISON% git=%GIT_VERSION% git-lfs=%GITLFS_VERSION% -c conda-forge -r "%~dp0\" -y
@CALL echo %VENV_NAME% depolyed

@CALL echo ---------------------------------------------------------------------------------------
@CALL echo Initializing %VENV_NAME%
@CALL "%~dp0micromamba.exe" shell init --shell=cmd.exe --prefix="%~dp0\" -y
@CALL echo %VENV_NAME% Initialized

@CALL echo ---------------------------------------------------------------------------------------
@CALL echo Activating %VENV_NAME%
@CALL condabin\micromamba.bat activate %VENV_NAME%
@CALL echo %VENV_NAME% activated

@CALL echo ---------------------------------------------------------------------------------------
@CALL echo Cloning stable-diffusion-webui
@CALL git clone --branch %WEUI_VERSION% https://github.com/AUTOMATIC1111/stable-diffusion-webui
@CALL echo Stable-diffusion-webui cloned

@CALL echo ---------------------------------------------------------------------------------------
@CALL echo Installing stable-diffusion-webui dependencies
@CALL pip install xformers==%XFORMERS_VERSION% --no-cache-dir
@CALL pip install torch==%TORCH_VERSION% torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118 --no-cache-dir
@CALL pip install -r stable-diffusion-webui\requirements.txt --no-cache-dir
@CALL echo Stable-diffusion-webui dependencies installed

@CALL echo ---------------------------------------------------------------------------------------
@CALL echo Creating cache folders
@CALL mkdir .\stable-diffusion-webui\cache\gdown
@CALL mkdir .\stable-diffusion-webui\cache\torch
@CALL mkdir .\stable-diffusion-webui\cache\huggingface
@CALL mkdir .\stable-diffusion-webui\repositories
@CALL echo Cache folders created

@CALL echo ---------------------------------------------------------------------------------------
@CALL echo Launching webui
@CALL cd stable-diffusion-webui
@CALL python -B launch.py  %COMMANDLINE_ARGS%

@CALL PAUSE
