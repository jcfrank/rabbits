#include<stdio.h>
#include<stdlib.h>

int main(int argc, char* argv[]) {
    if (argc < 2) {
        printf("Please give months.");
        return -1;
    }
    int months = atoi(argv[1]);
    int new_rabbits = 2, m1_rabbits = 0,  m2_rabbits = 0, adult_rabbits = 0;
    for (int m = 0; m < months; m++) {
        adult_rabbits += m2_rabbits;
        m2_rabbits = m1_rabbits;
        m1_rabbits = new_rabbits;
        new_rabbits = adult_rabbits;
    }

    printf("Months %d, rabbits %d\n", months, adult_rabbits + m2_rabbits + m1_rabbits + new_rabbits);
    return 0;
}

