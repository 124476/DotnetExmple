using Desctop;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Linq;
using UnitTestExmple.Models;

namespace UnitTestExmple
{
    [TestClass]
    public class UnitTestUser
    {
        private User _user;
        [TestInitialize]
        public void Init()
        {
            _user = new User()
            {
                Name = "Test",
                Login = "Test",
                Password = "Test",
                RoleId = 2,
            };
        }

        [TestMethod]
        public void TestCreateUser()
        {
            NetManage.DB.User.Add(_user);
            NetManage.DB.SaveChanges();

            var userCreated = NetManage.DB.User.FirstOrDefault(x => x.Id == _user.Id);
            Assert.IsNotNull(userCreated, "Пользователь не был добавлен в базу данных.");
            Assert.AreEqual(_user.Name, userCreated.Name, "Имя пользователя не совпадает.");
        }

        [TestCleanup]
        public void Cleap()
        {
            NetManage.DB.User.Remove(_user);
            NetManage.DB.SaveChanges();
        }
    }
}
