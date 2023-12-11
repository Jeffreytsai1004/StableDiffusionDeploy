@CALL "%~dp0micromamba.exe" shell init --shell cmd.exe --prefix "%~dp0\"
@CALL condabin\micromamba.bat activate stable-diffusion-webui-001
@CALL set GDOWN_CACHE=cache\gdown
@CALL set TORCH_HOME=cache\torch
@CALL set HF_HOME=cache\huggingface
@CALL set PYTHONDONTWRITEBYTECODE=1
@CALL set COMMANDLINE_ARGS=--theme dark --xformers --opt-sdp-attention --autolaunch --listen 0.0.0.0 --port 7860 --skip-torch-cuda-test
@CALL cd stable-diffusion-webui
@CALL python -B webui.py %COMMANDLINE_ARGS%
@CALL PAUSE
