all: firmware.elf

hello.txt:
	echo "hello world!" > hello.txt

PICO_TOOLCHAIN_PATH?=~/.pico-sdk/toolchain/13_2_Rel1
CPP=arm-none-eabi-cpp
CC=arm-none-eabi-gcc
AS=arm-none-eabi-as
LD=arm-none-eabi-ld
SRC=main.c second.c
OBJS=$(patsubst %.c,%.o,$(SRC))

firmware.elf: $(OBJS)
	$(LD) -o $@ $^

%.i: %.c
	$(CPP) $< > $@

%.s: %.i
	$(CC) -S $@

%.o: %.s
	$(AS) $< -o $@

clean:
	rm -f *.i *.s *.o firmware.elf hello.txt 

.PHONY: clean all