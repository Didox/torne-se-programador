using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace UnitTestProject1
{
    [TestClass]
    public class Joao
    {
        [TestMethod]
        public void test()
        {
            var j = new OO.Joao();
            Assert.AreEqual(j.MetodoPublico(), "teste");
        }
    }
}
