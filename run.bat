@CALL "%~dp0micromamba.exe" shell init --shell cmd.exe --prefix "%~dp0\"
@CALL condabin\micromamba.bat activate StableDiffusion_001
@CALL set GDOWN_CACHE=cache\gdown
@CALL set TORCH_HOME=cache\torch
@CALL set HF_HOME=cache\huggingface
@CALL set PYTHONDONTWRITEBYTECODE=1
@CALL set TF_ENABLE_ONEDNN_OPTS=0
@CALL set COMMANDLINE_ARGS=--listen --port 7860 --autolaunch --theme dark --xformers --opt-sdp-attention --api --skip-install --skip-torch-cuda-test --skip-version-check --enable-insecure-extension-access
@CALL cd stable-diffusion-webui
@CALL python -B webui.py %COMMANDLINE_ARGS%
@CALL PAUSE
