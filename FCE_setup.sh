set -e

sudo apt-get update && sudo apt-get install build-essential
sudo apt-get install default-jdk
sudo apt-get install zlib1g-dev
sudo apt-get install libpng-dev
sudo apt-get install make
sudo apt-get install cmake
sudo apt install s3cmd

mkdir bin && cd bin

wget https://github.com/marbl/canu/releases/download/v1.8/canu-1.8.Linux-amd64.tar.xz
tar -xJf canu-1.8.*.tar.xz

git clone https://github.com/rrwick/Filtlong.git && (cd Filtlong && make -j)
git clone https://github.com/rrwick/Porechop.git && (cd Porechop && sudo python3 setup.py install)
git clone https://github.com/lh3/minimap2 && (cd minimap2 && make)
git clone https://github.com/lh3/miniasm  && (cd miniasm  && make)

git clone https://github.com/sanger-pathogens/assembly-stats
cd assembly-stats
mkdir build
cd build
sudo cmake -DINSTALL_DIR:PATH=/~/bin/assembly-stats/build/ ..
sudo make
make test
sudo make install
