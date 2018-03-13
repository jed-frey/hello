CC?=
CPP?=

BUILD_DIR=$(notdir ${CC})

C=$(wildcard *.c)
CPP=$(wildcard *.cpp)

OBJ_C=$(patsubst %.c,${BUILD_DIR}/%.o,${C})
OBJ_CPP=$(patsubst %.c,${BUILD_DIR}/%.o,${CPP})

CFLAGS+=-Wall
CXXFLAGS+=-Wall

.PHONY: debug
debug:
	$(info $${CC}=${CC} ${CFLAGS})
	$(info $${CXX}=${CXX} ${CXXFLAGS})
	$(info $${C}=${C})
	$(info $${OBJ}=${OBJ})
	$(info $${BUILD_DIR}=${BUILD_DIR})

.PHONY: obj
obj: ${OBJ}

.PHONY: hello
hello:	hello_c_${CC} hello_cpp_${CXX}

hello_c_${CC}: ${OBJ_C}
	${CC} ${CFLAGS} -o ${@} ${^}

hello_cpp_${CXX}: ${OBJ_CPP}
	${CXX} ${CXXLAGS} -o ${@} ${^}

${BUILD_DIR}/%.o: %.c ${BUILD_DIR}
	${CC} ${CFLAGS} -c ${<} -o ${@}

${BUILD_DIR}/%.o: %.cpp ${BUILD_DIR}
	${CXX} ${CXXLAGS} -c ${<} -o ${@}

${BUILD_DIR}:
	mkdir -p ${@}

.PHONY: clean
clean:
	git clean -xfd
