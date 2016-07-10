//--------------------------------------------------------------------------------------
//                  Rotina de Visualizar reservas
//--------------------------------------------------------------------------------------

void VerReservas()
{
    Carregar_topo();
    char s[3];
    int i, j, k, t, h;
    int mat[10][10];
    char status = 'V';
    int abilita = 0;
    FILE* arq;
    int c;
    char r[100];
    for(i=0, k=900; i<10; i++)
    {
   //     printf("       ");
        printf("|");
        for(j=0; j<10; j++, k++)
        {
                status = 'V';
                arq = fopen ("database/RESERVAS.txt", "r");
                if (arq==NULL) 
                {
                      printf("erro ao abrir o arquivo");
                      exit (1);
                }    
                t=1;
                h=5;
                while (!feof(arq))
                {                 
                    if(t == h)   
                    {
                       fscanf(arq,"%d",&c);
                       if(k==c)
                       {       
                           status = 'R';
                       }
                       h+=5;
                    }
                    else
                    {
                       fscanf(arq,"%s",&r);    
                    }
                    t++;
                }
                
                fclose(arq); 
                mat[i][j] = k;
                if(status == 'R')
                {
                   printf("%c",status);
                   printf("-%3d|", mat[i][j]);
                }
                else
                {
                   printf("%c",status);
                   printf("%4d|", mat[i][j]);
                }    
        }
        printf("\n");
    }
    Carregar_rodape();
    system("pause");
    Carregar_menu(); 
}
