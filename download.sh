#!/bin/bash
mkdir ost
cd ost
set -euo pipefail
LOG=setup_rtl2gdsii.log
touch $LOG

echo "🔧 Updating and installing base packages..." | tee -a $LOG
sudo apt update && sudo apt upgrade -y | tee -a $LOG
sudo apt install -y build-essential git cmake g++ gcc autoconf automake m4 perl \
  flex bison gperf zlib1g-dev libffi-dev libreadline-dev gawk pkg-config \
  tcl8.6 tcl8.6-dev tk8.6 tk8.6-dev python3 doxygen wget curl unzip \
  libboost-system-dev libboost-python-dev libboost-filesystem-dev \
  swig libeigen3-dev libiconv-hook-dev graphviz xdot | tee -a $LOG

# -------------------------
# Icarus Verilog + GTKWave
# -------------------------
echo "🔧 Installing Icarus Verilog..." | tee -a $LOG
wget -q https://github.com/steveicarus/iverilog/archive/refs/tags/v12_0.tar.gz
tar -xzf v12_0.tar.gz && cd iverilog-12_0
sh autoconf.sh && ./configure
make -j$(nproc) | tee -a ../$LOG && sudo make install
cd .. && sudo apt install -y gtkwave

# -------------------------
# Covered + automatic fix
# -------------------------
echo "🔧 Installing Covered..." | tee -a $LOG
git clone https://github.com/chiphackers/covered.git && cd covered
./configure || true
# Patch if needed
if ! grep -q "USE_INTERP_RESULT" src/report.c; then
  sed -i '/#include <tcl.h>/i #define USE_INTERP_RESULT 1' src/report.c
fi
make -j$(nproc) && sudo make install
cd ..

# -------------------------
# Yosys
# -------------------------
echo "🔧 Installing Yosys..." | tee -a $LOG
git clone --recursive https://github.com/YosysHQ/yosys.git && cd yosys
make -j$(nproc) && sudo make install
cd ..

# -------------------------
# CUDD (for OpenSTA)
# -------------------------
echo "🔧 Installing CUDD..." | tee -a $LOG
git clone https://github.com/ivmai/cudd.git && cd cudd
autoreconf -i && mkdir build && cd build
../configure --prefix=$HOME/cudd && make -j$(nproc) && sudo make install
cd ../..

# -------------------------
# OpenSTA with CUDD
# -------------------------
echo "🔧 Installing OpenSTA..." | tee -a $LOG
git clone https://github.com/The-OpenROAD-Project/OpenSTA.git && cd OpenSTA
mkdir build && cd build
cmake .. -DUSE_CUDD=ON -DCUDD_DIR=$HOME/cudd || {
  export CMAKE_ROOT=/usr/share/cmake-3.28/Modules
  cmake .. -DUSE_CUDD=ON -DCUDD_DIR=$HOME/cudd
}
make -j$(nproc) && sudo make install
cd ../..

# -------------------------
# OpenROAD
# -------------------------
echo "🔧 Installing OpenROAD..." | tee -a $LOG
git clone --recursive https://github.com/The-OpenROAD-Project/OpenROAD.git
cd OpenROAD
sudo ./etc/DependencyInstaller.sh | tee -a ../$LOG
mkdir -p build && cd build
cmake .. || {
  export CMAKE_ROOT=/usr/share/cmake-3.28/Modules
  cmake ..
}
make -j$(nproc) && sudo make install
cd ../..

# -------------------------
# KLayout 
# -------------------------
echo "🔧 Installing KLayout..." | tee -a $LOG
wget -q https://www.klayout.org/downloads/Ubuntu-24/klayout_0.29.8-1_amd64.deb
chmod +x klayout_0.29.8-1_amd64.deb
sudo apt install -y ./klayout_0.29.8-1_amd64.deb

# -------------------------
# Final Checks
# -------------------------
echo "✅ Installation complete. Logs saved in download.log"
