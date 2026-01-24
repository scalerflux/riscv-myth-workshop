Hi there

C Program To Compute Sum From 1 to N

~~~
vim sum_1ton.c
gcc sum_1ton.c -o sum
./sum
~~~

<img width="2440" height="948" alt="image" src="https://github.com/user-attachments/assets/b3bcebf2-09b0-41b7-a9f7-09b545319266" />

RISCV GCC compile And Disassemble
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

Spike Simulation And Debug
