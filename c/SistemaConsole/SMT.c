//============================================
//Sistema de gerenciamento Teatro
//============================================
// Desenvolvido por alunos sa escola FSA 
// Data de Inicio: 27/08/2005
//============================================

// Esta é a camada de interface com o usuário onde será feito as 
// validações e onde carregará a interface visual do sistema.

#define tmUser 50
#define tmSenha 6

//---------------------------------------------------------------------------------
//                      Declareção de todos os Protótipos.
//---------------------------------------------------------------------------------

void Carregar_menu();   
int INCLUIR_USUARIO(char LOGIN[8],char SENHA[7]);
void CARREGAR_USUARIOS();
void EXCLUIR_INI_USUARIO();
void CADASTRAR_ALT_USUARIOS();
void EXCLUIR_INI_USUARIOS();
int EXCLUIR_USUARIO(char LOGIN[8]);
int ALTERAR_USUARIO(char LOGIN[8],char SENHA[7]);
void CARREGAR_CLIENTES();
int EXCLUIR_CLIENTE(char CODIGO[8]);
void CARREGAR_CLIENTES();
int ALTERAR_CLIENTE(char CODIGO[8], char NOME[30],char RG[9],char CPF[13],char ENDERECO[40],char CIDADE[30],char UF[2],char TELEFONE[13],char OBSERVACAO[50]);
void CADASTRAR_CLIENTES();
void EXCLUIR_INI_CLIENTES();
void Carregar_topo();
void sair(int opcao);
void CADASTRAR_ALT_CLIENTES();
void CARREGAR_CLIENTES();
void CARREGAR_USUARIOS();
void CARREGAR_RESERVAS();
void VerReservas();
int INCLUIR_RESERVAS(char COD_CLIENTE[6],char DATA[10], char VALOR[10], char POLTRONA[8]);
void CARREGAR_RESERVAS();
void Carregar_topo();
void Carregar_rodape();  
int INCLUIR_CLIENTE(char NOME[30],char RG[9],char CPF[13],char ENDERECO[40],char CIDADE[30],char UF[2],char TELEFONE[13],char OBSERVACAO[50]);
void verifica_opcao_menu(int opcao);
void Carregar_topo();
void Carregar_rodape();
void CARREGAR_DESENVOLVEDORES();

//---------------------------------------------------------------------------------
//          Inportação das Bibilhotecas
//---------------------------------------------------------------------------------
#include<stdio.h>
#include<stdlib.h>
#include <string.h>
#include"layout/topo.h"
#include"layout/meiologin.h"
#include"layout/rodape.h"
#include"funcoes/funcao_login.h"
#include"layout/menu_principal.h"
#include"funcoes/opcao_menu.h"
#include"layout/clientes.h"
#include"funcoes/fclientes.h"
#include"funcoes/fAlteraCliente.h"
#include"funcoes/Excluir_cliente.h"
#include"funcoes/usuarios.h"
#include"funcoes/Reservas.h"
#include"funcoes/VerReserva.h"
#include"layout/Desenvolvedores.h"

//---------------------------------------------------------------------------------
//          Inicio do sistema
//---------------------------------------------------------------------------------

int main()
{
    int opcao;
    Carregar_topo();
    printf(".............................................................\n");
    printf(".............................................................\n");
    printf(".............................................................\n");
    printf(".............................................................\n");
    printf("............DIGITE (1) PARA SE LOGAR ........................\n");
    printf("............OU (0) PARA SAIR DO SISTEMA......................\n");
    printf(".............................................................\n");
    printf(".............................................................\n");
    printf(".............................................................\n");
    printf(".............................................................\n");
    
    Carregar_rodape();
    scanf("%d",&opcao);
    if (opcao == 1)
    {
        Carregar_topo();
        Carregar_meio_login();
    }    
    return(0);
}
