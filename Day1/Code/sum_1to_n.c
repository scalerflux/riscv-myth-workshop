#include <stdio.h>

int main(){

        int sum = 0, n=50;
        for(int i=1 ; i<=n; i++){
                sum += i;
        }
        printf("Sum of numbers 1 to %d is %d:" , n , sum);

        return 0;
}
