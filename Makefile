hello.txt:
	echo "hello world!" > hello.txt

PICO_TOOLCHAIN_PATH?=~/.pico-sdk/toolchain/13_2_Rel1
CPP=arm-none-eabi-cpp
CC=arm-none-eabi-gcc
AS=arm-none-eabi-as

main.i: main.c
	$(CPP) main.c > main.i

main.s: main.i
	$(CC) -S main.i

main.o: main.s
	$(AS) main.s -o main.o

clean:
	rm -f main.i main.s main.o hello.txt 

.PHONY: clean