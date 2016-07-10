//-----------------------------------------------------------------------------------
// Rotina carrega lay-out do menu Login
//-----------------------------------------------------------------------------------
 
void Carregar_meio_login()
{
    char vet_user[tmUser], vet_senha[tmSenha];
    int cont;
    printf(".............................................................\n");
    printf(".............................................................\n");
    printf("..................DIGITE USUARIO E SENHA ....................\n");
    printf(".....USUARIO:");
    scanf("%s", &vet_user);
    printf(".....SENHA:"); 
    int tecla=0;
    for (cont=0;cont<7;cont++)
	{	    
		tecla = getch();        
		if(tecla == 13)		
		{
    		printf("\n");
		    break;
        }
        else
        {
            vet_senha[cont]= tecla;	    
       		printf("*");
        }    
	}

    if (valida_usuario(vet_user,vet_senha)==1)
    {
        printf("\n");
        Carregar_menu();    
    }
    else
    {
        printf("\n");
        printf(".............................................................\n");
        printf(".............................................................\n");
        printf(".................Usuario ou senha invalido.!.................\n");
        printf(".............................................................\n");
        printf(".............................................................\n");
        system("pause");
        main();
    }
    
    
}
