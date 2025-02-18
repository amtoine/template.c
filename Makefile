COPT = $(if $(OPT),-O3 -flto,)
CC = gcc
CFLAGS = -g -Wall $(COPT) -I./include/
LDFLAGS =

SRC_DIR = src
BUILD_DIR = build

SRCS = $(wildcard $(SRC_DIR)/*.c)
OBJS = build/main.o $(SRCS:$(SRC_DIR)/%.c=$(BUILD_DIR)/%.o)

.DEFAULT_GOAL = clean

.PHONY: clean
clean:
	find . -type f -name *.o   -delete
	find . -type f -executable -delete

.PHONY: fmt-check
fmt-check:
	clang-format --Werror --dry-run -i *.c **/*.c

.PHONY: fmt
fmt:
	clang-format -i *.c **/*.c

$(BUILD_DIR)/%.o: %.c
	@mkdir -p ${BUILD_DIR}
	$(CC) $(CFLAGS) -c $< -o $@ $(LDFLAGS)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p ${BUILD_DIR}
	$(CC) $(CFLAGS) -c $< -o $@ $(LDFLAGS)

.PHONY: compile
compile: $(OBJS)

.PHONY: link
link:
	$(CC) $(CFLAGS) $(OBJS) -o a.out $(LDFLAGS)

.PHONY: build
build: compile link
