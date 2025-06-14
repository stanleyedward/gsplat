conda create -n gsplat python=3.10 -y
conda activate gsplat
conda install conda-forge::gxx=9.5.0 -y
conda install cuda -c nvidia/label/cuda-11.8.0 -y
conda install pytorch==2.4.1 torchvision==0.19.1 torchaudio==2.4.1  pytorch-cuda=11.8 -c pytorch -c nvidia
#install gsplat
pip install ninja numpy jaxtyping rich wheel packaging
pip install gsplat --index-url https://docs.gsplat.studio/whl/pt24cu118

# if you run into CUDA mismatch errors try these
unset LD_LIBRARY_PATH #check if its pointing to the wrong /bin/
unset CUDA_HOME #same for this
pip install --no-build-isolation -e .
# Set CUDA_HOME to your conda environment
export CUDA_HOME=$CONDA_PREFIX
# Update LD_LIBRARY_PATH with the specific CUDA lib paths
export LD_LIBRARY_PATH=$CONDA_PREFIX/lib:$CONDA_PREFIX/lib/stubs:$LD_LIBRARY_PATH
python "$@"

#install cuda (need this for examples)
pip install -r examples/requirements.txt

sudo pacman -S \
  base-devel \
  glew \
  assimp \
  boost \
  gtk3 \
  opencv \
  glfw \
  ffmpeg \
  eigen \
  libxxf86vm \
  embree \ 
  lib32-glm

#dev deps
black[jupyter]==22.3.0
isort==5.10.1
pylint==2.13.4
pytest==7.1.2
pytest-xdist==2.5.0
typeguard>=2.13.3
pyyaml
build
twine
