CC?=
CPP?=

BUILD_DIR=$(notdir ${CC})

C=$(wildcard *.c)
OBJ=$(patsubst %.c,${BUILD_DIR}/%.o,${C})

.PHONY: debug
debug:
	$(info $${CC}=${CC})
	$(info $${C}=${C})
	$(info $${OBJ}=${OBJ})
	$(info $${BUILD_DIR}=${BUILD_DIR})

.PHONY: obj
obj: ${OBJ}

.PHONY: hello
hello: hello_${CC}

hello_${CC}: ${OBJ}
	${CC} -o ${@} ${OBJ}

${BUILD_DIR}/%.o: %.c ${BUILD_DIR}
	${CC} -Wall -c ${<} -o ${@}

${BUILD_DIR}:
	mkdir -p ${@}
