# 编译C代码，并执行编译后的结果

# 保存汇编文件，主要是.o文件 #
BIN = ./bin
# 源码目录 #
SRC = ./
# 头文件目录 #
INC = ./
# 编译结果目录 #
OBJ = ./obj

# 源文件 #
SOURCE = $(wildcard ${SRC}/*.c)
# 汇编文件依赖 #
OBJECT = $(patsubst %.c,${OBJ}/%.o,$(notdir ${SOURCE}))
# 编译目标 #
TARGET = main
# 目标存放位置 #
BIN_TARGET = ${BIN}/${TARGET}
# 编译器 #
CC = gcc
# 编译条件 #
CFLAGS = -Wall -I${INC}
# 编译目标依赖 下面分别是编译目标和执行编译结果 #
${BIN_TARGET}:${OBJECT}
	$(CC) -o $@ ${OBJECT}
	${BIN}/${TARGET}

# 编译源文件到汇编文件 #
${OBJ}/%.o:${SRC}/%.c
	$(CC) $(CFLAGS) -o $@ -c $<
# 清理编译目录 #
.PHONY:clean
clean:
	find $(OBJ) -name '*.o' -exec rm -rf {} \;
	rm -rf $(BIN_TARGET)
