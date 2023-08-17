# StableDiffusion
 部署前必须修改虚拟环境名称,并且指定Python,Git,Gitls,以及WebUI版本等变量,例如:
```
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
```
