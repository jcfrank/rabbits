#include<stdio.h>
#include<stdlib.h>

int count_rabbits(int months) {
    if (months < 3) {
        return 2;
    }
    return count_rabbits(months - 1) + count_rabbits(months - 3);
}

int main(int argc, char* argv[]) {
    if (argc < 2) {
        printf("Please give months.\n");
        return -1;
    }
    
    int months = atoi(argv[1]);
    int result = count_rabbits(months);
    printf("Month %d, rabbits %d\n", months, result);
    return 0;
}

