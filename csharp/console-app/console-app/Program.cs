using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace console_app
{
    class Program
    {
        //PacalCase
        //camelCase
        //under_line
        public int CalcularSoma2()
        {
            int a = 1;
            int b = 2;
            int c = a + b;
            return c;
        }

        public static int CalcularSoma()
        {
            int a = 1;
            int b = 2;
            int c = a + b;
            return c;
        }

        public static void MostrarMensagemNaTela()
        {
            Console.WriteLine("Ola pessoal");
        }

        public static void Tabuada(int numero)
        {
            Console.WriteLine("============================================");
            for(int i = 1;i<= 10; i++)
            {
                Console.WriteLine(numero + " X " + i + " = " + (numero*i));
            }
            Console.WriteLine("============================================");
        }

        private static void LerArquivo(int numeroArquivo)
        {
            string arquivoComCaminho = @"C:\arquivos\arq" + numeroArquivo + ".txt";
            if (File.Exists(arquivoComCaminho))
            {
                using (StreamReader arquivo = File.OpenText(arquivoComCaminho))
                {
                    string linha;
                    while ((linha = arquivo.ReadLine()) != null)
                    {
                        Console.WriteLine(linha);
                    }
                }
            }

            string arquivoComCaminho2 = @"C:\arquivos\arq" + (numeroArquivo + 1) + ".txt";
            if (File.Exists(arquivoComCaminho2))
            {
                LerArquivo(numeroArquivo + 1);
            }
        }

        public const int SAIDA_PROGRAMA = 1;

        static void Main(string[] args)
        {
            while (true)
            {
                Console.WriteLine("Digite " + SAIDA_PROGRAMA + " para sair do programa");
                int valor = int.Parse(Console.ReadLine());

                if(SAIDA_PROGRAMA == valor)
                {
                    break;
                }
            }

            LerArquivo(1);
        }
    }
}
