CC?=
BUILD_DIR=$(notdir ${CC})

SRC_C=$(wildcard *.c)
ASM_C=$(patsubst %.s,${BUILD_DIR}/%.o,${SRC_C})
OBJ_C=$(patsubst %.c,${BUILD_DIR}/%.o,${SRC_C})


CFLAGS+=-Wall

.PHONY: debug
debug:
	$(info $${CC}=${CC} ${CFLAGS})
	$(info $${SRC_C}=${SRC_C})
	$(info $${OBJ_C}=${OBJ_C})
	$(info $${BUILD_DIR}=${BUILD_DIR})

.PHONY: obj
obj: ${OBJ}

.PHONY: hello
hello: ${BUILD_DIR}/hello

${BUILD_DIR}/hello: ${OBJ_C}
	${CC} ${CFLAGS} -o ${@} ${^}

${BUILD_DIR}/%.o: %.c ${BUILD_DIR}
	${CC} ${CFLAGS} -c ${<} -o ${@}

${BUILD_DIR}:
	mkdir -p ${@}

.PHONY: clean
clean:
	git clean -xfd
