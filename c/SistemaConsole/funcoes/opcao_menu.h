//--------------------------------------------------------------------------------------
//                  Rotina de verificação do menu
//--------------------------------------------------------------------------------------

void verifica_opcao_menu(int opcao)
{
  switch (opcao)
  {
     case 1:
        printf(" CADASTRAR CLIENTES \n");
        CARREGAR_CLIENTES();   
        break;
     case 2:
        printf(" CADASTRAR RESERVAS \n");
        CARREGAR_RESERVAS();   
        break;

     case 3:
        printf("\n\n\n                 VISUALIZAR RESERVAS \n");
        VerReservas();   
        break;

     case 4:
        printf(" CADASTRAR USUARIOS \n");
        CARREGAR_USUARIOS();   
        break;
     case 5:
        printf(" DESENVOLVEDORES \n");
        CARREGAR_DESENVOLVEDORES();   
        break;
     case 6:
        main();
        
  }
}
