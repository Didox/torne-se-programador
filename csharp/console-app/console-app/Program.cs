using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace console_app
{
    class Program
    {
        static void Main(string[] args)
        {
            string[] a1 = new string[3];
            a1[0] = "Danilo1";
            a1[1] = "Danilo2";
            a1[2] = "Danilo3";

            int size = a1.Length;
            if(Array.Exists(a1, e=>e.IndexOf("Danilo") != -1))
            {
                Console.WriteLine("Existe o Danilo1 no meu array");
            }


            List<string> a = new List<string>();
            a.Add("Danilo");
            a.Add("Sheila");
            a.Add("Lana");

            foreach (string nome in a)
            {
                Console.WriteLine(nome);
            }

            if (a.Exists(e => e == "Danilo"))
            {
                Console.WriteLine("Encontrei o danilo no meu collection list");
            }

            int size_list = a.Count;





            Console.Read();
        }
    }
}
