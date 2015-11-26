using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OO
{
    class Pessoa : interfacePessoa // implementa a interface
    {
        //construtor
        public Pessoa() { }
        //agregando construtor
        public Pessoa(string attrPrivado)
        {
            this.attrPrivado = attrPrivado;
        }


        //constantes
        public const string CONTANTE = "valor que não muda";


        //atributos privados
        private string attrPrivado;

        //atributos protegido
        protected string AttrProtegido { get; set; }

        //atributos publicos
        public string AttrPublico { get; set; }



        //metodos privados
        private string metodoPrivado()
        {
            //CONTANTE = "valor que não muda";
            return "privado metodo";
        }

        //metodos protegidos
        protected string MetodoProtegido()
        {
            return "protegido metodo";
        }

        //metodos privados
        public string MetodoPublico()
        {
            return "publico metodo";
        }
        //agregando metodos privados
        public string MetodoPublico(string attr)
        {
            return "publico metodo agregado - " + attr;
        }

        //metodo para sobrescrever
        public virtual string MerodoSobrescrever()
        {
            return "metodo original";
        }

    }
}
