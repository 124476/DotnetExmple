using Desctop.Pages;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace UnitTestExmple
{
    [TestClass]
    public class UnitTest
    {
        [TestMethod]
        public void TestNotNullPassword()
        {
            var heshPassword = PageHech.HashPassword("aa", "htytgrqwgfrqewgerg");
            Assert.IsNotNull(heshPassword);
        }

        [TestMethod]
        public void TestPasswordEqual()
        {
            var heshPassword = PageHech.HashPassword("aa", "htytgrqwgfrqewgerg");
            var heshPasswordTwo = PageHech.HashPassword("aa", "htytgrqwgfrqewgerg");

            Assert.AreEqual(heshPassword, heshPasswordTwo);
        }

        [TestMethod]
        public void TestDifferentSolts()
        {
            var heshPassword = PageHech.HashPassword("aa", "htytgrqwgfrqewgerg");
            var heshPasswordTwo = PageHech.HashPassword("aa", "rtwhrj35j53j53j");

            Assert.AreNotEqual(heshPassword, heshPasswordTwo);
        }

        [TestMethod]
        public void TestDifferentPassword()
        {
            var heshPassword = PageHech.HashPassword("aa", "htytgrqwgfrqewgerg");
            var heshPasswordTwo = PageHech.HashPassword("bb", "htytgrqwgfrqewgerg");

            Assert.AreNotEqual(heshPassword, heshPasswordTwo);
        }

        [TestMethod]
        public void TestGenerateRandomPasswordNotNull()
        {
            var randomPassword = PageRandom.GenerateRandomPassword();

            Assert.IsNotNull(randomPassword);
        }
    }
}
