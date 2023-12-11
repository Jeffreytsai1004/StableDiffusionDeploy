@CALL "%~dp0micromamba.exe" create -n stable-diffusion-webui-001 python==3.10.6 git git-lfs -c pytorch -c conda-forge -r "%~dp0\" -y
@CALL "%~dp0micromamba.exe" shell init --shell cmd.exe --prefix "%~dp0\"
@CALL condabin\micromamba.bat activate stable-diffusion-webui-001
@CALL set GDOWN_CACHE=cache\gdown
@CALL set TORCH_HOME=cache\torch
@CALL set HF_HOME=cache\huggingface
@CALL set PYTHONDONTWRITEBYTECODE=1
@CALL pip install xformer==0.0.21 torch==2.0.1+cu118 torchvision torchaudio torchtext
@CALL pip install -r requirements.txt
@CALL git clone -b v1.7.0-RC https://github.com/AUTOMATIC1111/stable-diffusion-webui/
@CALL mkdir stable-diffusion-webui\cache\gdown\
@CALL mkdir stable-diffusion-webui\cache\torch\
@CALL mkdir stable-diffusion-webui\cache\huggingface\
@CALL mkdir stable-diffusion-webui\repositories\
@CALL cd stable-diffusion-webui
@CALL git clone https://github.com/CompVis/stable-diffusion.git repositories\stable-diffusion
@CALL git clone https://github.com/CompVis/taming-transformers.git repositories\taming-transformers
@CALL git clone https://github.com/crowsonkb/k-diffusion.git repositories\k-diffusion
@CALL git clone https://github.com/sczhou/CodeFormer.git repositories\CodeFormer
@CALL git clone http://github.com/salesforce/BLIP.git repositories\BLIP
@CALL python -B launch.py --xformers --skip-torch-cuda-test
@CALL PAUSE
