sudo apt-get update
sudo apt-get update
sudo apt-get install gperf
sudo apt-get install autoconf
sudo apt-get install gcc g ++
sudo apt-get install flex
sudo apt-get install bison

# install icarus verilog and gtkwave
wget https://github.com/steveicarus/iverilog/archive/refs/tags/v12_0.tar.gz

tar -xvzf v12_0.tar.gz

cd iverilog-12_0
sh autoconf.sh
./configure

sudo make
sudo make install

cd 

sudo apt install gtkwave

sudo apt update
sudo apt-get install zlib1g-dev
git clone https://git.savannah.gnu.org/git/libiconv.git

sudo apt-get install tcl8.6
sudo apt-get install tcl8.6-dev
sudo apt-get install tk8.6
sudo apt-get install tk8.6-dev
sudo apt-get install doxygen

git clone https://github.com/chiphackers/covered

#install yosys

sudo apt-get install -y build-essential clang bison flex libreadline-dev gawk tcl-dev libffi-dev git graphviz xdot pkg-config python3 libboost-system-dev libboost-python-dev libboost-filesystem-dev zlib1g-dev

git clone --recursive https://github.com/YosysHQ/yosys.git
cd
#install opensta

sudo apt-get update
sudo apt-get install -y build-essential tcl-dev tk-dev cmake git

git clone https://github.com/The-OpenROAD-Project/OpenSTA.git

sudo apt-get install libeigen3-dev

cd
git clone https://github.com/ivmai/cudd.git
sudo apt-get install -y automake
sudo apt-get install -y autoconf m4 perl

sudo apt install -y swig
sudo apt update

#install openroad

git clone --recursive https://github.com/The-OpenROAD-Project/OpenROAD.git
cd OpenROAD

sudo ./etc/DependencyInstaller.sh
cd 
#install klayout
wget https://www.klayout.org/downloads/Ubuntu-24/klayout_0.29.8-1_amd64.deb
chmod +x klayout_0.29.8-1_amd64.deb

sudo apt install ./klayout_0.29.8-1_amd64.deb

cd

sudo apt update

sudo apt upgrade

echo " yosys, opensta, openroad, cudd, covered is downloaded. Please install those using readme https://github.com/nishit0072e/RTL-to-GDSII/blob/main/README.md "
