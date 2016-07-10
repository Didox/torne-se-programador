using System;
using System.Collections.Generic;
using System.Text;

namespace BusinessRule2541.Business
{
    public class Cliente
    {
        private int _Id;

        public int Id
        {
            get { return _Id; }
            set { _Id = value; }
        }
        
        private string _Nome;

        public string Nome
        {
            get { return _Nome; }
            set { _Nome = value; }
        }
    }
}
