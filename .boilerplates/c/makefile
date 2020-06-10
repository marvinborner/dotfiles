TARGET=out/name
CC=gcc
CFLAGS=-Iinc -Wall -Wextra -g

SRC=$(wildcard src/*.c)
OBJ=$(patsubst src/%.c,out/%.o,$(SRC))
MAKEFLAGS+=--silent

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

out/%.o: src/%.c
	@mkdir -p "$(@D)"
	$(CC) $(CFLAGS) -MD -o $@ -c $<


clean:
	rm -rf out/ $(TARGET)

-include $(OBJECTS:.o=.d)

.PHONY: all clean run
