//--------------------------------------------------------------------------------------
//                  Rotina de verificação de login
//--------------------------------------------------------------------------------------


int valida_usuario(char vet_user[tmUser], char vet_senha[tmSenha])
{       
    int i, j, l, retorno = 0;
    FILE* arq;
    char cab [100][100];
     
    arq = fopen ("DATABASE/USUARIOS.txt","r");
    if (arq==NULL) 
    {
    printf("erro ao abrir o arquivo");
    exit (1);
    }
    int q=0;
    while (!feof(arq))
    {
        fscanf(arq,"%s",&cab[q]);
        q++;
    }       
    fclose(arq);
   
    for(i=0; i<q; i++)
    {
       //printf(" \n");
       //printf("%s \t",cab[i]); 
       //printf("%s \t",cab[i+1]);  
       
       if (!strcmp(vet_user,cab[i]) && !strcmp(vet_senha,cab[i+1]))
       {                   
           retorno = 1;
           break;
       } 
                 
       i=i+1;
    }     
    printf("\n");
   
    return(retorno);
}
