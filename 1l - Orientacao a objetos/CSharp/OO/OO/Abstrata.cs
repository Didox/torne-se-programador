using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OO
{
    abstract class Abstrata
    {
        public abstract string ForcaInplementacao();

        public string SemForcar()
        {
            return "sem forcar";
        }
    }
}
