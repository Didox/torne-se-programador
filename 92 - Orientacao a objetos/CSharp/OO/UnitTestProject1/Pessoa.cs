using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace UnitTest
{
    [TestClass]
    public class Pessoa
    {
        [TestMethod]
        public void PessoaConstructor()
        {
            OO.Pessoa p = new OO.Pessoa("Danilo");
            Assert.AreEqual(p.getAttrPrivado(), "Danilo");
        }
    }
}
