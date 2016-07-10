//--------------------------------------------------------------------------------------
//                  Rotina de Inclusão de clientes
//--------------------------------------------------------------------------------------

int INCLUIR_CLIENTE(char NOME[30],char RG[15],char CPF[13],char ENDERECO[40],char CIDADE[30],char UF[5],char TELEFONE[13],char OBSERVACAO[50])
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
    }    
    FILE* fCODIGO;
    int COD_CLIENTE;
    fCODIGO = fopen("database/COD_CLIENTES.txt", "r");
    if(fCODIGO == NULL)
    {
        printf("Erro na abertura do arquivo, contate o administrador");
        return(0);
    }
    fscanf(fCODIGO, "%d",&COD_CLIENTE);      
    fclose(fCODIGO);      
    
    FILE* fCliente;
    fCliente = fopen("database/CLIENTES.txt", "w");

    if(fCliente == NULL)
    {
        printf("Erro na abertura do arquivo, contate o administrador");
        return(0);
    }   
    
      int x = 9;
      for (i=0; i<j; i++)
      { 
           if (o == 9)
           {
              fprintf(fCliente,"%s",Cliente[i].CLIENTE);
              if(i+1<j)
                 fprintf(fCliente,"\n");
              
              o=0;
           }
           else
           {
              if(strcmp(Cliente[i].CLIENTE,""))
              {
                 fprintf(fCliente,"%s",Cliente[i].CLIENTE);
                 if(i+1<j)
                    fprintf(fCliente,"\t");
              }                  
           }
           o++;    
       }
      fprintf(fCliente, "\n"); 
      fprintf(fCliente,"%d \t", COD_CLIENTE);     
      fprintf(fCliente, "%s \t", NOME);
      fprintf(fCliente, "%s \t", RG);
      fprintf(fCliente, "%s \t", CPF);
      fprintf(fCliente, "%s \t", ENDERECO);
      fprintf(fCliente, "%s \t", CIDADE);
      fprintf(fCliente, "%s \t", UF);
      fprintf(fCliente, "%s \t", TELEFONE);
      fprintf(fCliente, "%s", OBSERVACAO);
      /*Fecha o arquivo de saida*/
      fclose(fCliente);
      printf(" \n\n O CODIGO DO CLIENTE E: %d  ",COD_CLIENTE);
      COD_CLIENTE++;      
      fCODIGO = fopen("database/COD_CLIENTES.txt", "w");
      if(fCODIGO == NULL)
      {
          printf("Erro na abertura do arquivo, contate o administrador");
          return(0);
      }
      fprintf(fCODIGO, "%d", COD_CLIENTE);      
      fclose(fCODIGO);   
    
      return(1);
}

//--------------------------------------------------------------------------------------

void CARREGAR_CLIENTES()
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
    if(linhas <= 1)
    {
        printf("nao a clientes a serem exibidos");
    }
    else
    {
    // conta as linhas fim
    
    struct TCliente_CARREGAR
    {
        char CLIENTE[linhas];
    };
    
    int i,j,o=1;
    arq = fopen ("database/CLIENTES.txt", "r");
    if (arq==NULL) 
    {
        printf("erro ao abrir o arquivo");
        exit (1);
    }    

    struct TCliente_CARREGAR Cliente[linhas];
    j=0;
    while (!feof(arq))
    {                 
         fscanf(arq,"%s",&Cliente[j]);
         j++;            
    }
    fclose(arq); 
    
    int x = 9, pagina = 1;
    printf("Paginado (sim)(nao)");
    char pg[3];
    scanf("%s",&pg);
    if(!strcmp(pg,"sim"))
    {
      printf("=====================================================================\n");
      for (i=0; i<j; i++)
      {
           if(strcmp(Cliente[i].CLIENTE,""))
           {
              printf("%s \t",Cliente[i].CLIENTE);         
              if (o == 9)
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
              i-=1;
           } 
      }
    }
    else
    {
      printf("\n=====================================================================\n");

      for (i=0; i<j; i++)
      {
         if(strcmp(Cliente[i].CLIENTE,""))
         {
           printf("%s \t",Cliente[i].CLIENTE);
           
           if (o == 9)
           {
              printf("\n");
              printf("\n=====================================================================\n");
              
              o=0;
           }
           o++;
         }    
         else
         {
            i-=1;    
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
        printf(" CADASTRAR CLIENTES \n");
        CADASTRAR_CLIENTES();   
        break;
     case 2:
        printf(" ALTERAR CLIENTE \n");
        CADASTRAR_ALT_CLIENTES();
        break;
     case 3:
        printf(" EXCLUIR CLIENTE \n");
        EXCLUIR_INI_CLIENTES();
        break;

     default:
        Carregar_menu();
        
  }
}
