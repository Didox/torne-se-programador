//-----------------------------------------------------------------------------------
// Rotina carrega lay-out de clientes
//-----------------------------------------------------------------------------------

void CADASTRAR_CLIENTES()
{
    char NOME[30] = "";
    char RG[9] = "";
    char CPF[13] = "";
    char ENDERECO[40] = "";
    char CIDADE[30] = "";
    char UF[2] = "";
    char TELEFONE[13] = "";
    char OBSERVACAO[50] = "";
    int tecla=0,cont;
    printf(".............................................................\n");
    printf(".............................................................\n");
    printf(".......................DIGITE SEUS DADOS.....................\n");
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
    
    printf(".....CPF: ");
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


    if (INCLUIR_CLIENTE(NOME,RG,CPF,ENDERECO,CIDADE,UF,TELEFONE,OBSERVACAO)==1)
    {
       printf("USUARIO INCLUIDO COM SUCESSO ! \n\n\n"); 
       system("PAUSE");
       Carregar_menu(); 
    }
    else
    {
        printf(".............................................................\n");
        printf(".............................................................\n");
        printf("...............ERRO NO CADASTRO..............................\n");
        printf(".............................................................\n");
        printf(".............................................................\n");
    }
}
