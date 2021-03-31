CFLAGS += -Wall -std=c99
LDFLAGS += -lncurses

OBJECTS=smines.o minefield.o window.o draw.o helper.o help.o

all: smines

run: smines
	./smines

debug: CFLAGS += -g -Og
debug: clean smines

dbgrun: debug
	./smines

valgrind: debug
	valgrind --leak-check=full --log-file=vgdump ./smines


smines: $(OBJECTS)
	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJECTS) -o smines

$(OBJECTS): %.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm -f *.o
	rm -f smines

.PHONY: all run debug dbgrun valgrind clean
