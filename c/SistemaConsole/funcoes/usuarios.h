//--------------------------------------------------------------------------------------
//                   Biblilhoteca de funçÕes de usuarios do sistema
//--------------------------------------------------------------------------------------

void CADASTRAR_USUARIOS()
{
    char LOGIN[8] = "";
    char SENHA[7] = "";
    int tecla=0,cont;
    printf(".........................................................\n");
    printf(".........................................................\n");
    printf(".....................DIGITE SEUS DADOS...................\n");
    printf(".....LOGIN: ");
    scanf("%s", &LOGIN);
    printf("\n");
    
    printf(".....SENHA: ");
    tecla = 0;
    scanf("%s", &SENHA);
    printf("\n");

    if (INCLUIR_USUARIO(LOGIN,SENHA)==1)
    {
       printf("USUARIO INCLUIDO COM SUCESSO ! \n\n\n"); 
       system("PAUSE");
       Carregar_menu(); 
    }
    else
    {
        printf(".........................................................\n");
        printf(".........................................................\n");
        printf("...............ERRO NO CADASTRO..........................\n");
        printf(".........................................................\n");
        printf(".........................................................\n");
    }
}

//--------------------------------------------------------------------------------------

int INCLUIR_USUARIO(char LOGIN[8],char SENHA[7])
{
    // conta as linhas
    int linhas = 0;
    FILE* arq;
    char c[100];
    arq = fopen ("database/USUARIOS.txt", "r");
    if (arq==NULL) 
    {
        printf("erro ao abrir o arquivo");
        exit (1);
    }    
    while (!feof(arq))
    {                 
         fscanf(arq,"%s",&c);
         linhas++;            
    }
    fclose(arq); 
    // conta as linhas fim
    if(linhas < 50 && linhas > 1)
        linhas = 50;

    struct TUSUARIO
    {
        char USUARIO[linhas];
    };
    
    int i,j,o=1;
    struct TUSUARIO USUARIO[linhas];
    if(linhas > 1)
    {
      arq = fopen ("database/USUARIOS.txt", "r");
      if (arq==NULL) 
      {
          printf("erro ao abrir o arquivo");
          exit (1);
      }    


       //verifica se o arquivo é nulo
       j=0;
       while (!feof(arq))
       {                 
            fscanf(arq,"%s",&USUARIO[j]);
            j++;            
       }
       fclose(arq); 
    }    
    FILE* fUSUARIO;
    fUSUARIO = fopen("database/USUARIOS.txt", "r++");

    if(fUSUARIO == NULL)
    {
        printf("Erro na abertura do arquivo, contate o administrador");
        return(0);
    }   
    
      int x = 2;
      for (i=0; i<j; i++)
      { 
           if (o == 2)
           {
              fprintf(fUSUARIO,"%s",USUARIO[i].USUARIO);
              if(i+1<j)
                fprintf(fUSUARIO,"\n");
              
              o=0;
           }
           else
           {
              if(strcmp(USUARIO[i].USUARIO,""))
              {
                 fprintf(fUSUARIO,"%s",USUARIO[i].USUARIO);
                 if(i+1<j)                 
                   fprintf(fUSUARIO,"\t");
              }    
           }
           o++;    
       }
      fprintf(fUSUARIO, "\n"); 
      fprintf(fUSUARIO, "%s \t", LOGIN);
      fprintf(fUSUARIO, "%s", SENHA);
      /*Fecha o arquivo de saida*/
      fclose(fUSUARIO);
      return(1);
}

//--------------------------------------------------------------------------------------

void CARREGAR_USUARIOS()
{
    // conta as linhas
    int linhas = 0;
    FILE* arq;
    char c[100];
    arq = fopen ("database/USUARIOS.txt", "r");
    if (arq==NULL) 
    {
        printf("erro ao abrir o arquivo");
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
        printf("nao a USUARIOs a serem exibidos");
    }
    else
    {
    // conta as linhas fim
    if(linhas < 50 && linhas > 1)
        linhas = 50;
    
    struct TUSUARIO_CARREGAR
    {
        char USUARIO[linhas];
    };
    
    int i,j,o=1;
    arq = fopen ("database/USUARIOS.txt", "r");
    if (arq==NULL) 
    {
        printf("erro ao abrir o arquivo");
        exit (1);
    }    

    struct TUSUARIO_CARREGAR USUARIO[linhas];
    j=0;
    while (!feof(arq))
    {                 
         fscanf(arq,"%s",&USUARIO[j]);
         j++;            
    }
    fclose(arq); 
    
    int x = 2, pagina = 1;
    printf("Paginado (sim)(nao)");
    char pg[3];
    scanf("%s",&pg);
    if(!strcmp(pg,"sim"))
    {
      printf("=====================================================================\n");
      for (i=0; i<j; i++)
      {
           if(strcmp(USUARIO[i].USUARIO,""))
           {
              printf("%s \t",USUARIO[i].USUARIO);         
              if (o == 2)
              {
                 printf("\n");
                 printf("=====================================================================\n");              
                 o=0;
                 if (pagina == 5)
                 {
                    system("PAUSE");    
                 }
                 
                 pagina++;
              }
              o++;
           }    
           else
           {
              //i-=1;
           } 
      }
    }
    else
    {
      printf("\n=====================================================================\n");

      for (i=0; i<j; i++)
      {
         if(strcmp(USUARIO[i].USUARIO,""))
         {
           printf("%s \t",USUARIO[i].USUARIO);
           
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
    }       
    printf("\n=====================================================================\n");    
    printf("...........INCLUIR(1)...ALTERAR(2)...EXCLUIR(3)...VOLTAR(4)............."); 
    printf("\n=====================================================================\n");    
    int opcao;
    scanf("%d", &opcao);
  switch (opcao)
  {
     case 1:
        printf(" CADASTRAR USUARIOS \n");
        CADASTRAR_USUARIOS();   
        break;
     case 2:
        printf(" ALTERAR USUARIO \n");
        CADASTRAR_ALT_USUARIOS();
        break;
     case 3:
        printf(" EXCLUIR USUARIO \n");
        EXCLUIR_INI_USUARIOS();
        break;

     default:
        Carregar_menu();
        
  }
}

//--------------------------------------------------------------------------------------

void EXCLUIR_INI_USUARIOS()
{
    char LOGIN[8] = "";
    int tecla=0,cont;
    printf(".........................................................\n");
    printf(".........................................................\n");
    printf("...............DIGITE O LOGIN DO USUARIO.................\n");
    printf(".....LOGIN: ");
    for (cont=0;cont<25;cont++)
	{	    
		tecla = getch();        
		if(tecla == 13)		
		{		
    		break;
        }
        else if(tecla == 8)
        {
   		   printf("%c",tecla);
           cont--;    
        }
        else
        {
            LOGIN[cont]= tecla;	    
       		printf("%c",LOGIN[cont]);
        }    
	}    
    printf("\n");
    if (EXCLUIR_USUARIO(LOGIN)==1)
    {
      // printf("USUARIO ALTERADO COM SUCESSO ! \n\n\n"); 
       system("PAUSE");
       Carregar_menu(); 
    }
    else
    {
        printf(".........................................................\n");
        printf(".........................................................\n");
        printf("...............USUARIO NAO EXCLUIDO......................\n");
        printf(".........................................................\n");
        printf(".........................................................\n");
    }
}

//--------------------------------------------------------------------------------------

int EXCLUIR_USUARIO(char LOGIN[8])
{
    // conta as linhas
    int linhas = 0;
    FILE* arq;
    char c[100];
    arq = fopen ("database/USUARIOS.txt", "r");
    if (arq==NULL) 
    {
        printf("erro ao abrir o arquivo");
        exit (1);
    }    
    while (!feof(arq))
    {                 
         fscanf(arq,"%s",&c);         
         linhas++;            
    }
    fclose(arq); 
    // conta as linhas fim
     if(linhas < 50 && linhas > 1)
        linhas = 50;

    
    struct TUSUARIO
    {
        char USUARIO[linhas];
    };    
    int i,j;
    struct TUSUARIO USUARIO[linhas];
    if(linhas > 1)
    {
       arq = fopen ("database/USUARIOS.txt", "r");
       if (arq==NULL) 
       {
           printf("erro ao abrir o arquivo");
           exit (1);
       }
       //verifica se o arquivo é nulo
       j=0;

       while (!feof(arq))
       {          
            fscanf(arq,"%s",&USUARIO[j]);
            j++;
       }

       fclose(arq);
       
       FILE* fUSUARIO;
       fUSUARIO = fopen("database/USUARIOS.txt", "w");

       if(fUSUARIO == NULL)
       {
           printf("Erro na abertura do arquivo, contate o administrador");
           return(0);
       }   
       int i;
       int x = 2;
       int abilita = 0;
       int o=1;
       for (i=0; i<j; i++)
       { 
            if (o == 2)
            {
                 fprintf(fUSUARIO,"%s",USUARIO[i].USUARIO);
                 if(strcmp(LOGIN,USUARIO[i+1].USUARIO))
                 { 
                   if(i+1<j)
                     fprintf(fUSUARIO,"\n");
                 }    
               
                  o=0;
            }
            else
            { 
                if(!strcmp(LOGIN,USUARIO[i].USUARIO))
                {       
                   i+=1;
                   abilita = 2;
                }
                else
                {
                   if(strcmp(USUARIO[i].USUARIO,""))
                   {
                      fprintf(fUSUARIO,"%s",USUARIO[i].USUARIO);
                   }                   
                   if(i+1<=j)
                     fprintf(fUSUARIO,"\t");
                }
            }
            o++;    
       }
       if(abilita == 2) 
       {
           /*Fecha o arquivo de saida*/
           fclose(fUSUARIO);
           printf(" \n\n USUARIO EXCLUIDO \n\n ");
       }    
       else
       {
          printf(" \n\n USUARIO NAO ENCONTRADO \n\n ");
          fclose(fUSUARIO);
       }
    }
    else
    {
      printf(" \n\n USUARIO INESISTENTE. \n\n ");
    }      
    return(1);
}
   
//--------------------------------------------------------------------------------------
   
void CADASTRAR_ALT_USUARIOS()
{
    char LOGIN[8] = "";
    char SENHA[7] = "";
    int tecla=0,cont;
    printf(".........................................................\n");
    printf(".........................................................\n");
    printf("...............DIGITE O LOGIN DO USUARIO.................\n");
    printf(".....LOGIN: ");
    scanf("%s",LOGIN);    
    printf("\n");    
    printf(".....SENHA: ");    
    scanf("%s",SENHA);
    
    if (ALTERAR_USUARIO(LOGIN,SENHA)==1)
    {
      // printf("USUARIO ALTERADO COM SUCESSO ! \n\n\n"); 
       system("PAUSE");
       Carregar_menu(); 
    }
    else
    {
        printf(".........................................................\n");
        printf(".........................................................\n");
        printf("...............ERRO NO CADASTRO..........................\n");
        printf(".........................................................\n");
        printf(".........................................................\n");
    }
}

//--------------------------------------------------------------------------------------

int ALTERAR_USUARIO(char LOGIN[8],char SENHA[7])
{
     

    // conta as linhas
    int linhas = 0;
    FILE* arq;
    char c[100];
    arq = fopen ("database/USUARIOS.txt", "r");
    if (arq==NULL) 
    {
        printf("erro ao abrir o arquivo");
        exit (1);
    }    
    while (!feof(arq))
    {                 
         fscanf(arq,"%s",&c);         
         linhas++;            
    }
    fclose(arq); 
    // conta as linhas fim
    if(linhas < 50 && linhas > 1)
        linhas = 50;

    
    struct TUSUARIO
    {
        char USUARIO[linhas];
    };    
    int i,j,o=1;
    struct TUSUARIO USUARIO[linhas];
    if(linhas > 1)
    {
       arq = fopen ("database/USUARIOS.txt", "r");
       if (arq==NULL) 
       {
           printf("erro ao abrir o arquivo");
           exit (1);
       }
       //verifica se o arquivo é nulo
       j=0;

       while (!feof(arq))
       {          
            fscanf(arq,"%s",&USUARIO[j]);
            j++;
       }

       fclose(arq);
       
       FILE* fUSUARIO;
       fUSUARIO = fopen("database/USUARIOS.txt", "r++");

       if(fUSUARIO == NULL)
       {
           printf("Erro na abertura do arquivo, contate o administrador");
           return(0);
       }   
       int i;
       int x = 2;
       int abilita = 0;
       for (i=0; i<j; i++)
       { 
            if (o == 2)
            {
                if(!strcmp(LOGIN,USUARIO[i].USUARIO))
                {       
                   i+=1;
                   abilita = 2;
                }
                else
                {
                  fprintf(fUSUARIO,"%s",USUARIO[i].USUARIO);
                  fprintf(fUSUARIO,"\n");
               
                  o=0;
                }
            }
            else
            { 
                if(!strcmp(LOGIN,USUARIO[i].USUARIO))
                {                         
                   i+=1;
                   abilita = 2;
                }
                else
                {
                   if(strcmp(USUARIO[i].USUARIO,""))
                   {
                      fprintf(fUSUARIO,"%s \t",USUARIO[i].USUARIO);
                   }                   
                }
            }
            o++;    
       }
       if(abilita == 2) 
       {
           fprintf(fUSUARIO, "%s \t", LOGIN);
           fprintf(fUSUARIO, "%s", SENHA);
           /*Fecha o arquivo de saida*/
           fclose(fUSUARIO);
           printf(" \n\n ALTERACAO CONCLUIDA \n\n ");
       }    
       else
       {
          printf(" \n\n USUARIO NAO ENCONTRADO \n\n ");
       }
      }
      else
      {
        printf(" \n\n USUARIO INESISTENTE. \n\n ");
      }      
      return(1);
}

