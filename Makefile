CC = sdcc
CFLAGS = -mz80

OUTPUT = my_program
SOURCES = main.c
OBJECTS = $(SOURCES:.c=.rel)

SUPPRESS = --disable-warning 283 # function declarator with no prototype

all: $(OUTPUT).rom

$(OUTPUT).rom: $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) -o $(OUTPUT).ihx
	makebin -s 16384 $(OUTPUT).ihx $(OUTPUT).rom

%.rel: %.c
	$(CC) $(CFLAGS) $(SUPPRESS) -c $<

clean:
	rm -f \
	$(OBJECTS) \
	$(OUTPUT).asm \
	$(OUTPUT).ihx \
	$(OUTPUT).lk \
	$(OUTPUT).lst \
	$(OUTPUT).map \
	$(OUTPUT).noi \
	$(OUTPUT).rel \
	$(OUTPUT).rom \
	$(OUTPUT).sym \

.PHONY: clean
