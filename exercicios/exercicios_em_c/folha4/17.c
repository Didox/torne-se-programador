
#include <stdio.h>
#include <stdlib.h> 
#include <string.h>
int main() 
{
  int vetnum1[] = {41,7,5,48,32,15,9,6,10,11};
  int vetnum2[] = {40,77,1,8,23,15,9,56,10,151};
  int v[20];

  int i,j,aux, x=0;
  for(i=0;i<9;i++){  
    for(j=i+1;j<10;j++)
    {
      if(vetnum1[i]<vetnum1[j])
      {
        aux=vetnum1[i];
        vetnum1[i]=vetnum1[j];
        vetnum1[j]=aux;
      }
    }
  }

  for(i=0;i<9;i++){  
    for(j=i+1;j<10;j++)
    {
      if(vetnum2[i]<vetnum2[j])
      {
        aux=vetnum2[i];
        vetnum2[i]=vetnum2[j];
        vetnum2[j]=aux;
      }
    }
  }

  for(i=0;i<10;i++){
    v[x] = vetnum1[i];
    x++;
  }

  for(i=0;i<10;i++){
    v[x] = vetnum2[i];
    x++;
  }


  for(i=0;i<20;i++){  
    for(j=i+1;j<20;j++)
    {
      if(v[i]<v[j])
      {
        aux=v[i];
        v[i]=v[j];
        v[j]=aux;
      }
    }
  }

  for(i=0;i<20;i++){  
    printf("Vetores ordenados %d: %d\n",(i+1),v[i]);
  }

  system("pause");
}