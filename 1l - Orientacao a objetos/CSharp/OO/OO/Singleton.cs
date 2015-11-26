using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OO
{
    class Singleton
    {
        private Singleton() { }

        public string Attr { get; set; }

        private Singleton instancia;

        public Singleton CriarInstancia()
        {
            instancia = new Singleton();
            return instancia;
        }

        public Singleton getInstancia()
        {
            return instancia;
        }
    }
}
