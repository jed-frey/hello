#include <stdio.h>
#include "square.h"

#define A_FLOAT (4.0)
#define A_CHAR  (2.0)

void do_math() {
    printf("%f\n", square_float(A_FLOAT));
    printf("%f\n", square_float(A_CHAR));
}
