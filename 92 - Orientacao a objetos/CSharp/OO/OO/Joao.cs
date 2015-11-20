using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OO
{
    class Joao : Pessoa
    {
        //sobrescrevi e falei que ninguem pode sobrescrever mais
        public sealed override string MerodoSobrescrever()
        {
            return base.MerodoSobrescrever() + " mais o meu";
        }

        // forca override de metodo
        public new string MetodoPublico()
        {
            return "teste";
        }
    }
}
