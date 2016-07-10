//--------------------------------------------------------------------------------------
//                  Rotina de Alterar Clientes
//--------------------------------------------------------------------------------------

void CADASTRAR_ALT_CLIENTES()
{
    char CODIGO[8] = "";
    char NOME[30] = "";
    char RG[9] = "";
    char CPF[13] = "";
    char ENDERECO[40] = "";
    char CIDADE[30] = "";
    char UF[2] = "";
    char TELEFONE[13] = "";
    char OBSERVACAO[50] = "";
    int tecla=0,cont;
    printf(".........................................................\n");
    printf(".........................................................\n");
    printf("...............DIGITE O CODIGO DO CLIENTE.................\n");
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
	if (!strcmp(CODIGO,""))
	{
        strcpy(CODIGO, "-");
    }
    printf("\n");

    printf(".....NOME: ");
    for (cont=0;cont<30;cont++)
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
            NOME[cont]= tecla;	    
       		printf("%c",NOME[cont]);
        }    
	}
	if (!strcmp(NOME,""))
	{
        strcpy(NOME, "-");
    }
    printf("\n");
    
    printf(".....RG: ");
    tecla = 0;
    for (cont=0;cont<15;cont++)
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
            RG[cont]= tecla;	    
       		printf("%c",RG[cont]);
        }    
	}
	if (!strcmp(RG,""))
	{
        strcpy(RG, "-");
    }
    printf("\n");
    
    printf(".....CODIGO DA RESERVA: ");
    tecla = 0;
    for (cont=0;cont<4;cont++)
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
            CPF[cont]= tecla;	    
       		printf("%c",CPF[cont]);
        }    
	}
	if (!strcmp(CPF,""))
	{
	    strcpy(CPF, "-");
    }
    printf("\n");
    
    printf(".....ENDERECO: ");
    tecla = 0;
    for (cont=0;cont<40;cont++)
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
            ENDERECO[cont]= tecla;	    
       		printf("%c",ENDERECO[cont]);
        }    
	}    
	if (!strcmp(ENDERECO,""))
	{
	    strcpy(ENDERECO, "-");
    }
    printf("\n");
    
    printf(".....CIDADE: ");
    tecla = 0;
    for (cont=0;cont<30;cont++)
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
            CIDADE[cont]= tecla;	    
       		printf("%c",CIDADE[cont]);
        }    
	}    
	if (!strcmp(CIDADE,""))
	{
	    strcpy(CIDADE, "-");
    }
    printf("\n");
    
    printf(".....UF: ");
    tecla = 0;
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
            UF[cont]= tecla;	    
       		printf("%c",UF[cont]);
        }    
	}	
	if (!strcmp(UF,""))
	{
	    strcpy(UF, "-");
    }
    printf("\n");
    
    printf(".....TELEFONE: ");
    tecla = 0;
    for (cont=0;cont<13;cont++)
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
            TELEFONE[cont]= tecla;	    
       		printf("%c",TELEFONE[cont]);
        }    
	}
	if (!strcmp(TELEFONE,""))
	{
	    strcpy(TELEFONE, "-");
    }
    printf("\n");
    
    printf(".....OBSERVACAO: ");
    tecla = 0;
    for (cont=0;cont<13;cont++)
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
            OBSERVACAO[cont]= tecla;	    
       		printf("%c",OBSERVACAO[cont]);
        }    
        
	}
	if (!strcmp(OBSERVACAO,""))
	{
	    strcpy(OBSERVACAO, "-");
    }
    printf("\n");


    if (ALTERAR_CLIENTE(CODIGO,NOME,RG,CPF,ENDERECO,CIDADE,UF,TELEFONE,OBSERVACAO)==1)
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

int ALTERAR_CLIENTE(char CODIGO[8], char NOME[30],char RG[15],char CPF[13],char ENDERECO[40],char CIDADE[30],char UF[5],char TELEFONE[13],char OBSERVACAO[50])
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
       fCliente = fopen("database/CLIENTES.txt", "r++");

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
                   abilita = 2;
                }
                else
                {
                  fprintf(fCliente,"%s",Cliente[i].CLIENTE);
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
                      fprintf(fCliente,"%s \t",Cliente[i].CLIENTE);
                   }                   
                }
            }
            o++;    
       }
       if(abilita == 2) 
       {
           fprintf(fCliente,"%s \t", CODIGO);     
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
           printf(" \n\n ALTERACAO CONCLUIDA \n\n ");
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

