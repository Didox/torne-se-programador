//--------------------------------------------------------------------------------------
//                  Rotina de reservas
//--------------------------------------------------------------------------------------

void CADASTRAR_RESERVAS()
{
    char COD_CLIENTE[6] = "";
    char DATA[10] = "";
    char VALOR[10] = "";
    char POLTRONA[8]= "";
    int tecla=0,cont;
    printf(".........................................................\n");
    printf(".........................................................\n");
    printf(".....................DIGITE SEUS DADOS...................\n");
    printf(".....COD_CLIENTE: ");
    scanf("%s", &COD_CLIENTE);
    printf("\n");
    
    int abilita = 0;
    FILE* arq;
    char c[100];
    arq = fopen ("database/CLIENTES.txt", "r");
    if (arq==NULL) 
    {
        printf("erro ao abrir o arquivo");
        exit (1);
    }    
    while (!feof(arq))
    {                 
         fscanf(arq,"%s",&c);
         if(!strcmp(COD_CLIENTE,c))
         {       
            abilita = 2;
         }

    }
    fclose(arq); 
    if(abilita == 2) 
    {
            // encontrou            
    
            printf(".....DATA: ");
            tecla = 0;
            scanf("%s", &DATA);
            printf("\n");

            printf(".....VALOR: ");
            tecla = 0;
            scanf("%s", &VALOR);
            printf("\n");

            printf(".....POLTRONA DE 900 ATE 999: ");
            tecla = 0;
            scanf("%s", &POLTRONA);
            printf("\n");

            if (INCLUIR_RESERVAS(COD_CLIENTE,DATA,VALOR,POLTRONA)==1)
            {
               printf("RESERVA INCLUIDO COM SUCESSO ! \n\n\n"); 
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
            //encontrou
    }    
    else
    {
          printf(" \n\n CLIENTE NAO ENCONTRADO \n\n ");
          system("pause");
          Carregar_menu();
    }      
}


void EXCLUIR_INI_RESERVAS();

int INCLUIR_RESERVAS(char COD_CLIENTE[6],char DATA[10], char VALOR[10], char POLTRONA[8])
{    
          // conta as linhas
          int linhas = 0;
          FILE* arq;
          char c[100];
          arq = fopen ("database/RESERVAS.txt", "r");
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
      
          struct TRESERVAS
          {
              char RESERVAS[linhas];
          };
          
          int i,j,o=1;
          struct TRESERVAS RESERVAS[linhas];
          if(linhas > 1)
          {
            arq = fopen ("database/RESERVAS.txt", "r");
            if (arq==NULL) 
            {
                printf("erro ao abrir o arquivo");
                exit (1);
            }    
      
      
                   //verifica se o arquivo é nulo
             j=0;
             while (!feof(arq))
             {                 
                  fscanf(arq,"%s",&RESERVAS[j]);
                  j++;            
             }
             fclose(arq); 
          }    
          FILE* fCODIGO;
          int COD_RESERVAS;
          fCODIGO = fopen("database/COD_RESERVAS.txt", "r");
          if(fCODIGO == NULL)
          {
              printf("Erro na abertura do arquivo, contate o administrador");
              return(0);
          }
          fscanf(fCODIGO, "%d",&COD_RESERVAS);      
          fclose(fCODIGO);      
       
     
          FILE* fRESERVAS;
          fRESERVAS = fopen("database/RESERVAS.txt", "w");
      
          if(fRESERVAS == NULL)
          {
              printf("Erro na abertura do arquivo, contate o administrador");
              return(0);
          }   
          
            int x = 5;
            for (i=0; i<j; i++)
            { 
                 if (o == 5)
                 {
                    fprintf(fRESERVAS,"%s",RESERVAS[i].RESERVAS);
                    if(i+1<=j)
                      fprintf(fRESERVAS,"\n");
     
                    o=0;
                 }
                 else
                 {
                    if(strcmp(RESERVAS[i].RESERVAS,""))
                    {
                       fprintf(fRESERVAS,"%s",RESERVAS[i].RESERVAS);
                       if(i+1<=j)                 
                         fprintf(fRESERVAS,"\t");
                    }    
                 }
                 o++;    
             }

            fprintf(fRESERVAS, "\n"); 
            fprintf(fRESERVAS, "%d \t", COD_RESERVAS);
            fprintf(fRESERVAS, "%s \t", COD_CLIENTE);
            fprintf(fRESERVAS, "%s \t", DATA);
            fprintf(fRESERVAS, "%s \t", VALOR);            
            fprintf(fRESERVAS, "%s", POLTRONA);            
            /*Fecha o arquivo de saida*/            
            fclose(fRESERVAS);
            
            printf(" \n\n O CODIGO DA RESERVAS E: %d  ",COD_RESERVAS);
            COD_RESERVAS++;      
            fCODIGO = fopen("database/COD_RESERVAS.txt", "w");
            if(fCODIGO == NULL)
            {
                printf("Erro na abertura do arquivo, contate o administrador");
                return(0);
            }
            fprintf(fCODIGO, "%d", COD_RESERVAS);      
            fclose(fCODIGO);   
      
            return(1);
}


void CADASTRAR_ALT_RESERVAS();
void EXCLUIR_INI_RESERVAS();

void CARREGAR_RESERVAS()
{
    // conta as linhas
    int linhas = 0;
    FILE* arq;
    char c[100];
    arq = fopen ("database/RESERVAS.txt", "r");
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
        printf("nao a RESERVAS a serem exibidos");
    }
    else
    {
    // conta as linhas fim
    if(linhas < 50 && linhas > 1)
        linhas = 50;
    
    struct TRESERVAS_CARREGAR
    {
        char RESERVAS[linhas];
    };
    
    int i,j,o=1;
    arq = fopen ("database/RESERVAS.txt", "r");
    if (arq==NULL) 
    {
        printf("erro ao abrir o arquivo");
        exit (1);
    }    

    struct TRESERVAS_CARREGAR RESERVAS[linhas];
    j=0;
    while (!feof(arq))
    {                 
         fscanf(arq,"%s",&RESERVAS[j]);
         j++;            
    }
    fclose(arq); 
    
    int x = 5, pagina = 1;
    printf("Paginado (sim)(nao)");
    char pg[3];
    scanf("%s",&pg);
    if(!strcmp(pg,"sim"))
    {
      printf("=====================================================================\n");
      for (i=0; i<j; i++)
      {
           if(strcmp(RESERVAS[i].RESERVAS,""))
           {
              printf("%s \t",RESERVAS[i].RESERVAS);         
              if (o == 5)
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
         if(strcmp(RESERVAS[i].RESERVAS,""))
         {
           printf("%s \t",RESERVAS[i].RESERVAS);
           
           if (o == 5)
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
        printf(" CADASTRAR RESERVAS \n");
        CADASTRAR_RESERVAS();   
        break;
     case 2:
        printf(" ALTERAR RESERVAS \n");
        CADASTRAR_ALT_RESERVAS();
        break;
     case 3:
        printf(" EXCLUIR RESERVAS \n");
        EXCLUIR_INI_RESERVAS();
        break;

     default:
        Carregar_menu();
        
  }
}

int EXCLUIR_RESERVAS(char COD_CLIENTE[6]);

void EXCLUIR_INI_RESERVAS()
{
    char COD_RESERVA[6] = "";
    int tecla=0,cont;
    printf(".........................................................\n");
    printf(".........................................................\n");
    printf("...............DIGITE O CODIGO DA RESERVA.................\n");
    printf(".....COD_RESERVA: ");
    for (cont=0;cont<5;cont++)
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
            COD_RESERVA[cont]= tecla;	    
       		printf("%c",COD_RESERVA[cont]);
        }    
	}    
    printf("\n");
    if (EXCLUIR_RESERVAS(COD_RESERVA)==1)
    {
      // printf("RESERVAS ALTERADO COM SUCESSO ! \n\n\n"); 
       system("PAUSE");
       Carregar_menu(); 
    }
    else
    {
        printf(".........................................................\n");
        printf(".........................................................\n");
        printf("...............RESERVA NAO EXCLUIDO......................\n");
        printf(".........................................................\n");
        printf(".........................................................\n");
    }
}


int EXCLUIR_RESERVAS(char COD_RESERVA[6])
{
    // conta as linhas
    int linhas = 0;
    FILE* arq;
    char c[100];
    arq = fopen ("database/RESERVAS.txt", "r");
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

    
    struct TRESERVAS
    {
        char RESERVAS[linhas];
    };    
    int i,j;
    struct TRESERVAS RESERVAS[linhas];
    if(linhas > 1)
    {
       arq = fopen ("database/RESERVAS.txt", "r");
       if (arq==NULL) 
       {
           printf("erro ao abrir o arquivo");
           exit (1);
       }
       //verifica se o arquivo é nulo
       j=0;

       while (!feof(arq))
       {          
            fscanf(arq,"%s",&RESERVAS[j]);
            j++;
       }

       fclose(arq);
       
       FILE* fRESERVAS;
       fRESERVAS = fopen("database/RESERVAS.txt", "w");

       if(fRESERVAS == NULL)
       {
           printf("Erro na abertura do arquivo, contate o administrador");
           return(0);
       }   
       int i;
       int x = 5;
       int abilita = 0;
       int o=1;
       for (i=0; i<j; i++)
       { 
            if (o == 5)
            {
                  if(strcmp(RESERVAS[i].RESERVAS,""))
                  {
                    fprintf(fRESERVAS,"%s",RESERVAS[i].RESERVAS);
                    if(i+1<=j)
                      if(strcmp(COD_RESERVA,RESERVAS[i+1].RESERVAS))
                      {       
                          fprintf(fRESERVAS,"\n");
                      }    
               
                    o=0;
                  }    
            }
            else
            { 
              if(o == 1)
              {
                if(!strcmp(COD_RESERVA,RESERVAS[i].RESERVAS))
                {       
                   i+=4;
                   abilita = 2;
                }
                else
                {
                   if(strcmp(RESERVAS[i].RESERVAS,""))
                   {
                      fprintf(fRESERVAS,"%s",RESERVAS[i].RESERVAS);                                      
                      if(i+1<=j)
                        fprintf(fRESERVAS,"\t");
                   } 
                }
              }
              else
              {
                  if(strcmp(RESERVAS[i].RESERVAS,""))
                   {
                      fprintf(fRESERVAS,"%s",RESERVAS[i].RESERVAS);                                      
                      if(i+1<=j)
                        fprintf(fRESERVAS,"\t");
                   }
              }  
            }
            o++;    
       }
       if(abilita == 2) 
       {
           /*Fecha o arquivo de saida*/
           fclose(fRESERVAS);
           printf(" \n\n RESERVAS EXCLUIDO \n\n ");
       }    
       else
       {
          printf(" \n\n RESERVAS NAO ENCONTRADO \n\n ");
          fclose(fRESERVAS);
       }
    }
    else
    {
      printf(" \n\n RESERVAS INESISTENTE. \n\n ");
    }      
    return(1);
}
   
int ALTERAR_RESERVAS(char COD_RESERVA[6], char COD_CLIENTE[6],char DATA[10],char VALOR[10],char POLTRONA[8]);
void CADASTRAR_ALT_RESERVAS()
{
    char COD_RESERVA[6] = "";
    char COD_CLIENTE[6] = "";
    char DATA[10] = "";
    char VALOR[10] = "";
    char POLTRONA[8]= "";

    int tecla=0,cont;
    printf(".........................................................\n");
    printf(".........................................................\n");
    printf("...............DIGITE O COD_CLIENTE DO RESERVAS.................\n");

    printf(".....COD_RESERVA: ");
    scanf("%s",COD_RESERVA);    
    printf("\n");    
    
    printf(".....COD_CLIENTE: ");
    scanf("%s", &COD_CLIENTE);
    printf("\n");
    
    int abilita = 0;
    FILE* arq;
    char c[100];
    arq = fopen ("database/CLIENTES.txt", "r");
    if (arq==NULL) 
    {
        printf("erro ao abrir o arquivo");
        exit (1);
    }    
    while (!feof(arq))
    {                 
         fscanf(arq,"%s",&c);
         if(!strcmp(COD_CLIENTE,c))
         {       
            abilita = 2;
         }

    }
    fclose(arq); 
    if(abilita == 2) 
    {
             // encontrou            
    
            printf(".....DATA: ");
            tecla = 0;
            scanf("%s", &DATA);
            printf("\n");

            printf(".....VALOR: ");
            tecla = 0;
            scanf("%s", &VALOR);
            printf("\n");

            printf(".....POLTRONA: ");
            tecla = 0;
            scanf("%s", &POLTRONA);
            printf("\n");

            if (ALTERAR_RESERVAS(COD_RESERVA,COD_CLIENTE,DATA,VALOR,POLTRONA)==1)
            {
               printf("RESERVA INCLUIDO COM SUCESSO ! \n\n\n"); 
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
            //encontrou
    }    
    else
    {
          printf(" \n\n CLIENTE NAO ENCONTRADO \n\n ");
          system("pause");
          Carregar_menu();
    }         
}


int ALTERAR_RESERVAS(char COD_RESERVA[6], char COD_CLIENTE[6],char DATA[10],char VALOR[10],char POLTRONA[8])
{
     

    // conta as linhas
    int linhas = 0;
    FILE* arq;
    char c[100];
    arq = fopen ("database/RESERVAS.txt", "r");
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

    
    struct TRESERVAS
    {
        char RESERVAS[linhas];
    };    
    int i,j,o=1;
    struct TRESERVAS RESERVAS[linhas];
    if(linhas > 1)
    {
       arq = fopen ("database/RESERVAS.txt", "r");
       if (arq==NULL) 
       {
           printf("erro ao abrir o arquivo");
           exit (1);
       }
       //verifica se o arquivo é nulo
       j=0;

       while (!feof(arq))
       {          
            fscanf(arq,"%s",&RESERVAS[j]);
            j++;
       }

       fclose(arq);
       
       FILE* fRESERVAS;
       fRESERVAS = fopen("database/RESERVAS.txt", "r++");

       if(fRESERVAS == NULL)
       {
           printf("Erro na abertura do arquivo, contate o administrador");
           return(0);
       }   
       int i;
       int x = 5;
       int abilita = 0;
       for (i=0; i<j; i++)
       { 
            if (o == 5)
            {
                  fprintf(fRESERVAS,"%s",RESERVAS[i].RESERVAS);
                  if(i+1<=j)
                     fprintf(fRESERVAS,"\n");
                  o=0;
                
            }
            else
            { 
              if(o == 1)
              {
                if(!strcmp(COD_RESERVA,RESERVAS[i].RESERVAS))
                {                         
                   i+=4;
                   abilita = 2;
                }
                else
                {
                   if(strcmp(RESERVAS[i].RESERVAS,""))
                   {
                      fprintf(fRESERVAS,"%s",RESERVAS[i].RESERVAS);
                      if(i+1<=j)
                         fprintf(fRESERVAS,"\t");

                   }                   
                }
               }
               else
               {
                   if(strcmp(RESERVAS[i].RESERVAS,""))
                   {
                      fprintf(fRESERVAS,"%s \t",RESERVAS[i].RESERVAS);
                   }                   
               }    
            }
            o++;    
       }
       if(abilita == 2) 
       {
           fprintf(fRESERVAS, "%s \t", COD_RESERVA);
           fprintf(fRESERVAS, "%s \t", COD_CLIENTE);
           fprintf(fRESERVAS, "%s \t", DATA);
           fprintf(fRESERVAS, "%s \t", VALOR);
           fprintf(fRESERVAS, "%s", POLTRONA);
           /*Fecha o arquivo de saida*/
           fclose(fRESERVAS);
           printf(" \n\n ALTERACAO CONCLUIDA \n\n ");
       }    
       else
       {
          printf(" \n\n RESERVAS NAO ENCONTRADO \n\n ");
       }
      }
      else
      {
        printf(" \n\n RESERVAS INESISTENTE. \n\n ");
      }      
      return(1);
}

