# Модульное тестирование

## Тестирование функции

```
[TestMethod]    
public void TestNotNullPassword()
{
    var heshPassword = ClassExmple.ClassExmple.HashPassword("aa", "htytgrqwgfrqewgerg");

    Assert.IsNotNull(heshPassword, "Значение пароля пустое"); // Первый параметр, который проверяется; Второй параметр - сообщение при проваленном тесте
}
```

## Тестирование базы данных

### Создание экземпляра (преддействия)

```
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
```

### Работа с бд

```
[TestMethod]
public void TestCreateUser()
{
    NetManage.DB.User.Add(_user);
    NetManage.DB.SaveChanges();

    var userCreated = NetManage.DB.User.FirstOrDefault(x => x.Id == _user.Id);
    Assert.IsNotNull(userCreated, "Пользователь не был добавлен в базу данных.");
    Assert.AreEqual(_user.Name, userCreated.Name, "Имя пользователя не совпадает.");
}
```

### Очистка бд

```
[TestCleanup]
public void Cleap()
{
    NetManage.DB.User.Remove(_user);
    NetManage.DB.SaveChanges();
}
```

## Типы Assert

- AreEqual / AreNotEqual - проверка на совпадение (можно задавать через кортежи)
- IsNull / IsNotNull - проверка на null/not null 
- IsTrue / IsFalse - проверка на истину/ложь

Assert.Fail("Что-то пошло не так!"); - Принудительная ошибка с сообщением

## Типы функций

- TestMethod - обычный тест
- TestInitialize - действия до тестирования
- TestCleanup - действия после тестирования
- DataRow() - передача параметров для теста

