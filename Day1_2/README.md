

This was done on arm ubuntu running on Mac via UTM, since there no preloaded vdi image for arm machines you can follwo the below steps to match the workshop(credit- Claude) 

set up RISC-V GCC(there are 2-3 other options as well, but this the only one that worked for me
~~~
# Install dependencies
sudo apt update
sudo apt install autoconf automake autotools-dev curl python3 python3-pip \
    libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex \
    texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev ninja-build \
    git cmake libglib2.0-dev

# Clone the repository
git clone https://github.com/riscv-collab/riscv-gnu-toolchain
cd riscv-gnu-toolchain

# Configure and build (this takes a while)
./configure --prefix=/opt/riscv
sudo make -j$(nproc)

# Add to PATH
echo 'export PATH="/opt/riscv/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
~~~

Spike simulator

~~~
# Install dependencies
sudo apt install device-tree-compiler libboost-regex-dev libboost-system-dev

# Clone Spike
cd ~
git clone https://github.com/riscv-software/riscv-isa-sim.git
cd riscv-isa-sim

# Build and install
mkdir build
cd build
../configure --prefix=$HOME/riscv-tools
make -j$(nproc)
make install

# Add to PATH
echo 'export PATH="$HOME/riscv-tools/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# Verify
spike --version
~~~

Also build pk (proxy kernel) - needed to run programs in Spike:
~~~
cd ~
git clone https://github.com/riscv-software/riscv-pk.git
cd riscv-pk

mkdir build
cd build
../configure --prefix=$HOME/riscv-tools --host=riscv64-unknown-elf
make -j$(nproc)
make install
~~~

## C Program To Compute Sum From 1 to N

~~~
vim sum_1ton.c
gcc sum_1ton.c -o sum
./sum
~~~

<img width="2440" height="948" alt="image" src="https://github.com/user-attachments/assets/b3bcebf2-09b0-41b7-a9f7-09b545319266" />

## RISCV GCC compile And Disassemble
~~~
riscv64-unknown-elf-gcc -O1 -mabi=lp64 -march=rv64i -o sum.o sum_1to_n.c
riscv64-unknown-elf-objdump -d sum.o
riscv64-unknown-elf-objdump -d sum.o | less
/main
n
~~~

~~~
riscv64-unknown-elf-gcc -Ofast -mabi=lp64 -march=rv64i -o sum.o sum_1to_n.c
riscv64-unknown-elf-objdump -d sum.o | less
~~~


<img width="3042" height="1592" alt="image" src="https://github.com/user-attachments/assets/4a57ba1e-52b0-41ee-a4f8-ba8608086d6b" />

total 11 aseembly instructions in main

<img width="686" height="249" alt="Screenshot from 2026-01-24 05-09-25" src="https://github.com/user-attachments/assets/d6c89f98-45fa-4a7d-8d5f-c8bc3de780ca" />

## Spike Simulation And Debug
~~~
riscv64-unknown-elf-gcc -Ofast -mabi=lp64 -march=rv64i -o sum sum_1to_n.c
spike pk sum
spike -d pk sum // takes to the debug mode
~~~

## Signed numbers
<img width="2504" height="436" alt="image" src="https://github.com/user-attachments/assets/84a77125-472e-417d-afd0-a351a97873bb" />



<img width="2312" height="1120" alt="image" src="https://github.com/user-attachments/assets/ef724490-0934-4416-95ce-91891f8cc9d0" />


## Algorithm For Sum 1 to N Using ASM

~~~
riscv64-unknown-elf-gcc -O1 -mabi=lp64 -march=rv64i -o 1to9.o 1to9_custom.c load.S
spike pk 1to9.o
riscv64-unknown-elf-objdump -d 1to9.o | less
~~~


<img width="3818" height="2340" alt="image" src="https://github.com/user-attachments/assets/5900f6d3-3591-4391-931e-ed06aa53e834" />

## Program On RISC-V CPU
~~~
git clone https://github.com/kunalg123/riscv_workshop_collaterals.git
cd riscv_workshop_collaterals
cd labs
vim picorv32.v 
vim testbench.v
vim rv32im.sh
chmod 777 rv32im.sh
./rv32im.sh
~~~

<img width="2326" height="1862" alt="image" src="https://github.com/user-attachments/assets/fa854d46-1093-4629-a9e2-a7fb34b9e7b3" />


