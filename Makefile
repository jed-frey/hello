VER?=4.0

CC=clang-${VER}
LLC=llc-${VER}

BUILD_DIR?=$(notdir ${CC})

SRC_C=$(wildcard *.c)
IR_C =$(patsubst %.c,${BUILD_DIR}/%.ll,${SRC_C})
ASM_C=$(patsubst %.c,${BUILD_DIR}/%.s,${SRC_C})
OBJ_C=$(patsubst %.c,${BUILD_DIR}/%.o,${SRC_C})

CFLAGS+=-Wall

.PHONY: hello
hello: ${BUILD_DIR}/hello ${OBJ_C} ${ASM_C} ${IR_C}

.PHONY: debug
debug:
	$(info $${CC}=${CC} ${CFLAGS})
	$(info $${SRC_C}=${SRC_C})
	$(info $${IR_C}=${IR_C})
	$(info $${ASM_C}=${ASM_C})
	$(info $${OBJ_C}=${OBJ_C})
	$(info $${BUILD_DIR}=${BUILD_DIR})

.PHONY: obj
obj: ${OBJ_C}

.PHONY: asm
asm: ${ASM_C}

.PHONY: ir
ir: ${IR_C}

${BUILD_DIR}/hello: ${IR_C}
	${CC} ${CFLAGS} -o ${@} ${^}

${BUILD_DIR}/%.ll: %.c ${BUILD_DIR}
	${CC} ${CFLAGS} -S -emit-llvm -c ${<} -o ${@}

%.s: %.ll ${BUILD_DIR}
	${LLC} ${<} -o ${@}

${BUILD_DIR}/%.o: %.c ${BUILD_DIR}
	${CC} ${CFLAGS} -c ${<} -o ${@}

${BUILD_DIR}:
	mkdir -p ${@}

.PHONY: clean
clean:
	git clean -xfd
