using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using ClassExmple;
using Desctop;

namespace UnitTestExmple
{
    [TestClass]
    public class UnitTestExmple
    {
        [TestMethod]    
        public void TestNotNullPassword()
        {
            var heshPassword = ClassExmple.ClassExmple.HashPassword("aa", "htytgrqwgfrqewgerg");

            Assert.IsNotNull(heshPassword, "Значение пароля пустое"); // Первый параметр, который проверяется; Второй параметр - сообщение при проваленном тесте
        }

        [TestMethod]
        public void TestPasswordEqual()
        {
            var heshPassword = ClassExmple.ClassExmple.HashPassword("aa", "htytgrqwgfrqewgerg");
            var heshPasswordTwo = ClassExmple.ClassExmple.HashPassword("aa", "htytgrqwgfrqewgerg");

            Assert.AreEqual(heshPassword, heshPasswordTwo);
        }

        [TestMethod]
        public void TestDifferentSolts()
        {
            var heshPassword = ClassExmple.ClassExmple.HashPassword("aa", "htytgrqwgfrqewgerg");
            var heshPasswordTwo = ClassExmple.ClassExmple.HashPassword("aa", "rtwhrj35j53j53j");

            Assert.AreNotEqual(heshPassword, heshPasswordTwo);
        }

        [TestMethod]
        public void TestDifferentPassword()
        {
            var heshPassword = ClassExmple.ClassExmple.HashPassword("aa", "htytgrqwgfrqewgerg");
            var heshPasswordTwo = ClassExmple.ClassExmple.HashPassword("bb", "htytgrqwgfrqewgerg");

            Assert.AreNotEqual(heshPassword, heshPasswordTwo);
        }

        [TestMethod]
        [DataRow(2, 3, 5)]
        [DataRow(1, 4, 5)]
        public void TestAddShouldReturnCorrectSum(int a, int b, int expected)
        {
            var result = a + b;
            Assert.AreEqual(expected, result);
        }

        [TestMethod]
        public void TestFail()
        {
            Assert.Fail("Что-то пошло не так!");  // Принудительная ошибка с сообщением
        }
    }
}
