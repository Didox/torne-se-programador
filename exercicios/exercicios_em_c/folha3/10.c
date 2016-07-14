//10)
#include <stdio.h>
#include <stdlib.h> 
int main() 
{
  int i = 0, x = 0;

  for(i=1; i<=10; i++){
    printf("Taboada do %d é:\n", i);
    for(x=1; x<=10; x++){
      printf("%d X %d = %d\n", i, x, (i*x));
    }
  }
  system("pause");
}