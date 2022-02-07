
QEMU = qemu-system-aarch64
KERNEL_IMG = kernel.img

.PHONY: clean

all: $(KERNEL_IMG)

run: $(KERNEL_IMG)
	$(QEMU) -M raspi3 \
	-display none \
	-d in_asm\
	-kernel $<

clean:
	$(RM) $(KERNEL_IMG)
	make -C ./src clean

$(KERNEL_IMG):
	$(DOCKER) make -C ./src
	cp src/$(KERNEL_IMG) $@