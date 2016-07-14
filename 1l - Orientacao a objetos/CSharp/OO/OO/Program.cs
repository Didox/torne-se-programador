using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OO
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Digite o CPF"); //igual o mostre do algoritimo
            var cpf = Console.Read(); // igual o leia do algoritimo

            // exemplo de classe agregada
            Empresa e = new Empresa();
            e.FacaTrabalho();
            e.VaAlmocar();

        }
    }
}
