sudo apt update
sudo apt install -y git build-essential ninja-build cmake python3-pip python3-cffi redis unzip wget

git clone https://github.com/RedisAI/RedisAI.git

cd RedisAI

mkdir build

WITH_PT=0 WITH_TF=0 WITH_TFLITE=0 WITH_ORT=0 bash get_deps.sh

mv deps/linux-arm64v8-cpu deps/linux-x64-cpu

mkdir deps/linux-x64-cpu/libtorch

cd deps/linux-x64-cpu/libtorch

# https://forums.developer.nvidia.com/t/pytorch-for-jetson-nano-version-1-5-0-now-available/72048
# wget https://nvidia.box.com/shared/static/phqe92v26cbhqjohwtvxorrwnmrnfx1o.whl -O torch-1.3.0-cp36-cp36m-linux_aarch64.whl

# unzip torch-1.3.0-cp36-cp36m-linux_aarch64.whl
# mv torch/* .

#wget https://nvidia.box.com/shared/static/ncgzus5o23uck9i5oth2n8n06k340l6k.whl -O torch-1.4.0-cp36-cp36m-linux_aarch64.whl
# sudo apt install -y libopenblas-base

# unzip torch-1.4.0-cp36-cp36m-linux_aarch64.whl
# mv torch/* .

wget https://nvidia.box.com/shared/static/3ibazbiwtkl181n95n9em3wtrca7tdzp.whl -O torch-1.5.0-cp36-cp36m-linux_aarch64.whl
sudo apt install -y libopenblas-base

unzip torch-1.5.0-cp36-cp36m-linux_aarch64.whl
mv torch/* .

cd -

cd build

cmake -DBUILD_TF=OFF -DBUILD_TFLITE=OFF -DBUILD_TORCH=ON -DBUILD_ORT=OFF -DCMAKE_BUILD_TYPE=Release ../

make -j4 && make install
