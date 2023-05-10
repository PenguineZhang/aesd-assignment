CROSS_COMPILE=gcc

CFLAGS = -Wall -g

SRC = writer.c
OBJ = $(SRC:.c=.o)

writer: writer.o
	$(CROSS_COMPILE) $(CFLAGS) $^ -o $@

writer.o: writer.c
	$(CROSS_COMPILE) $(CFLAGS) -c $< -o $@

clean:
	rm -f writer writer.o