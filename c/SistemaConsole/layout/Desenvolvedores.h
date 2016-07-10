//-----------------------------------------------------------------------------------
// Rotina carrega Desenvolvedores do sistema
//-----------------------------------------------------------------------------------
void CARREGAR_DESENVOLVEDORES()
{
    // conta as linhas
    int linhas = 0;
    FILE* arq;
    char c[100];
    arq = fopen ("database/DESENVOLVEDORES.txt", "r");
    if (arq==NULL) 
    {
        printf("erro ao abrir o arquivo");
        system("pause");
        exit (1);
    }    
    while (!feof(arq))
    {                 
         fscanf(arq,"%s",&c);
         linhas++;            
    }
    fclose(arq); 
    if(linhas <= 1)
    {
        printf("nao a DESENVOLVEDORES a serem exibidos");        
    }
    else
    {
    // conta as linhas fim
    if(linhas < 50 && linhas > 1)
        linhas = 50;
    
    struct TDESENVOLVEDORES_CARREGAR
    {
        char DESENVOLVEDORES[linhas];
    };
    
    int i,j,o=1;
    arq = fopen ("database/DESENVOLVEDORES.txt", "r");
    if (arq==NULL) 
    {
        printf("erro ao abrir o arquivo");
        exit (1);
    }    

    struct TDESENVOLVEDORES_CARREGAR DESENVOLVEDORES[linhas];
    j=0;
    while (!feof(arq))
    {                 
         fscanf(arq,"%s",&DESENVOLVEDORES[j]);
         j++;            
    }
    fclose(arq); 
    
    int x = 2, pagina = 1;   
      printf("\n=====================================================================\n");

      for (i=0; i<j; i++)
      {
         if(strcmp(DESENVOLVEDORES[i].DESENVOLVEDORES,""))
         {
           printf("%s \t",DESENVOLVEDORES[i].DESENVOLVEDORES);
           
           if (o == 2)
           {
              printf("\n");
              printf("\n=====================================================================\n");
              
              o=0;
           }
           o++;
         }    
         else
         {
            //i-=1;    
         }
      }  
    }
       
    system("Pause");
    Carregar_menu();
}

//--------------------------------------------------------------------------------------
