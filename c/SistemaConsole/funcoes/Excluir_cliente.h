//--------------------------------------------------------------------------------------
//                  Rotina de exclusão de clientes
//--------------------------------------------------------------------------------------

void EXCLUIR_INI_CLIENTES()
{
    char CODIGO[8] = "";
    int tecla=0,cont;
    printf(".............................................................\n");
    printf(".............................................................\n");
    printf(".................DIGITE O CODIGO DO CLIENTE..................\n");
    printf(".....CODIGO: ");
    for (cont=0;cont<8;cont++)
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
            CODIGO[cont]= tecla;	    
       		printf("%c",CODIGO[cont]);
        }    
	}    
    printf("\n");
    if (EXCLUIR_CLIENTE(CODIGO)==1)
    {
      // printf("USUARIO ALTERADO COM SUCESSO ! \n\n\n"); 
       system("PAUSE");
       Carregar_menu(); 
    }
    else
    {
        printf(".............................................................\n");
        printf(".............................................................\n");
        printf("...............CLIENTE NAO EXCLUIDO..........................\n");
        printf(".............................................................\n");
        printf(".............................................................\n");
    }
}

//--------------------------------------------------------------------------------------

int EXCLUIR_CLIENTE(char CODIGO[8])
{
    // conta as linhas
    int linhas = 0;
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
         linhas++;            
    }
    fclose(arq); 
    // conta as linhas fim
    
    struct TCliente
    {
        char CLIENTE[linhas];
    };    
    int i,j,o=1;
    struct TCliente Cliente[linhas];
    if(linhas > 1)
    {
       arq = fopen ("database/CLIENTES.txt", "r");
       if (arq==NULL) 
       {
           printf("erro ao abrir o arquivo");
           exit (1);
       }
       //verifica se o arquivo é nulo
       j=0;

       while (!feof(arq))
       {          
            fscanf(arq,"%s",&Cliente[j]);
            j++;
       }

       fclose(arq);
       
       FILE* fCliente;
       fCliente = fopen("database/CLIENTES.txt", "w");

       if(fCliente == NULL)
       {
           printf("Erro na abertura do arquivo, contate o administrador");
           return(0);
       }   
       int i;
       int x = 9;
       int abilita = 0;
       for (i=0; i<j; i++)
       { 
            if (o == 9)
            {
               if(!strcmp(CODIGO,Cliente[i].CLIENTE))
                {       
                   i+=8;
                   o=0;
                   abilita = 2;
                }
                else
                {
                  fprintf(fCliente,"%s",Cliente[i].CLIENTE);
                  if(i+1<j)
                     fprintf(fCliente,"\n");
               
                  o=0;
                }
            }
            else
            { 
                if(!strcmp(CODIGO,Cliente[i].CLIENTE))
                {       
                   i+=8;
                   abilita = 2;
                }
                else
                {
                   if(strcmp(Cliente[i].CLIENTE,""))
                   {
                      fprintf(fCliente,"%s",Cliente[i].CLIENTE);
                   }                   
                   if(i+1<j)
                        fprintf(fCliente,"\t");

                }
            }
            o++;    
       }
       if(abilita == 2) 
       {
           /*Fecha o arquivo de saida*/
           fclose(fCliente);
           printf(" \n\n CLIENTE EXCLUIDO \n\n ");
       }    
       else
       {
          printf(" \n\n CLIENTE NAO ENCONTRADO \n\n ");
       }
      }
      else
      {
        printf(" \n\n CLIENTE INESISTENTE. \n\n ");
      }      
      return(1);
}

