using System;
using System.Collections;
using System.Text;

namespace BusinessRule2541.Business
{
    public class Clientes: CollectionBase
    {
        public int Add(Cliente Cliente)
        {
            return InnerList.Add(Cliente);
        }

        public void Remove(Cliente Cliente)
        {
            InnerList.Remove(Cliente);
        }

        public Cliente this[int index]
        {
            get
            {
                return (Cliente)InnerList[index];
            }
            set
            {
                InnerList[index] = value;
            }
        }
    }
}
