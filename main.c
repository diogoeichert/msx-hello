void ROMHeader() {
	__asm
		.ascii	"AB"
		.dw	_main
		.dw	0x0000
		.dw	0x0000
		.dw	0x0000
		.dw	0x0000
		.dw	0x0000
		.dw	0x0000
	__endasm;
}

#include <stdio.h>

int putchar(int c) {
	// Dummy implementation to avoid error
	return c;
}

int main() {
	ROMHeader();
	printf("Hello, Z80!\n");
	return 0;
}
