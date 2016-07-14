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
            looping(1);
        }

        public static void looping(int a)
        {
            Console.WriteLine(a);
            if(a < 3) {
                looping(a + 1);
            } 
        }
    }
}
