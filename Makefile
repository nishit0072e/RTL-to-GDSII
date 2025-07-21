# Makefile for installing VLSI design tools and dependencies with error handling

# Default target: Install dependencies and show message
all: dependencies
	@echo "All dependencies are installed, now proceed to install tools."

# Install all dependencies and tools
all-tools: dependencies bambu iverilog covered yosys sta openroad
	@echo "Bambu HLS installation Successful, test with:"
	@echo "./bambu-0.9.7.AppImage <path-to-c-file> --top-fname=<accelerator-function-to-be-implemented-in-hardware>"
	@echo "Icarus Verilog, COVERED, GTKWave, Yosys, OpenSTA, OpenROAD installation Successful, test them one by one by running names in terminal"

# Install dependencies non-interactively
dependencies:
	sudo apt-get update
	sudo apt-get install -y --no-install-recommends build-essential ca-certificates gcc-multilib git verilator wget
	sudo add-apt-repository universe -y
	sudo apt-get install -y libfuse2
	sudo apt-get install -y gperf
	sudo apt-get install -y autoconf
	sudo apt-get install -y gcc g++
	sudo apt-get install -y flex
	sudo apt-get install -y bison
	sudo apt-get install -y make
	sudo apt-get update
	sudo apt-get install -y zlib1g-dev
	sudo apt-get install -y libiconv
	sudo apt-get install -y tcl8.6
	sudo apt-get install -y tcl8.6-dev
	sudo apt-get install -y doxygen
	sudo apt-get install -y clang gcc tcl8.6 swig bison flex
	sudo apt-get install -y build-essential clang bison flex
	sudo apt-get install -y libreadline-dev gawk tcl-dev libffi-dev git
	sudo apt-get install -y libboost-python-dev libboost-filesystem-dev zlib1g-dev

# Install Bambu HLS
bambu:
	wget https://releases.bambuhls.eu/appimage/bambu-0.9.7.AppImage
	chmod +x bambu-0.9.7.AppImage

# Install Icarus Verilog and GTKWave
iverilog:
	git clone https://github.com/steveicarus/iverilog.git
	cd iverilog && sh autoconf.sh && ./configure && sudo make && sudo make install
	sudo apt-get install -y gtkwave
	cd ..

# Install COVERED with error handling for TclInterp
covered:
	git clone https://github.com/chiphackers/covered.git
	cd covered && \
	./configure && \
	sed -i '/#include <tcl.h>/i #define USE_INTERP_RESULT 1' src/report.c && \
	sudo make && sudo make install
	cd ..

# Install Yosys
yosys:
	git clone https://github.com/YosysHQ/yosys.git
	cd yosys && sudo make && sudo make install
	cd ..

# Install OpenSTA with error handling for tcl.h
sta:
	git clone https://github.com/The-OpenROAD-Project/OpenSTA.git
	cd OpenSTA && \
	sed -i 's|PATH_SUFFIXES include include/tcl|PATH_SUFFIXES include include/tcl8.6|' cmake/FindTCL.cmake && \
	mkdir build && cd build && cmake .. && sudo make && sudo make install
	cd ../..

# Install OpenROAD
openroad:
	git clone --recursive https://github.com/The-OpenROAD-Project/OpenROAD.git
	cd OpenROAD && sudo ./etc/DependencyInstaller.sh && mkdir build && cd build && cmake .. && sudo make && sudo make install
	cd ../..

# Clean up cloned repositories and Bambu AppImage
clean:
	rm -rf iverilog covered yosys OpenSTA OpenROAD bambu-0.9.7.AppImage

.PHONY: all all-tools dependencies bambu iverilog covered yosys sta openroad clean
