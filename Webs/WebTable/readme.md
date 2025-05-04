# Table

## Необходимые библиотеки

- Microsoft.EntityFrameworkCore.Design
- Microsoft.EntityFrameworkCore.Proxies
- Microsoft.EntityFrameworkCore.SqlServer
- Microsoft.EntityFrameworkCore.Tools

### Если не работает через NuGet

в командной строке

```
dotnet add package Microsoft.EntityFrameworkCore.Design
```
```
dotnet add package Microsoft.EntityFrameworkCore.SqlServer
```
```
dotnet add package Microsoft.EntityFrameworkCore.Tools
```
```
dotnet add package Microsoft.EntityFrameworkCore.Proxies
```

## Команды

```
dotnet ef dbcontext scaffold "Server=Название сервера;Database=Название бд;TrustServerCertificate=True;Trusted_Connection=True;" Microsoft.EntityFrameworkCore.SqlServer --output-dir Models --context DBContext
```

## В Models/DBContext

меняем OnConfiguring
```
protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
{
    optionsBuilder.UseLazyLoadingProxies();
    optionsBuilder.UseSqlServer("Server=DESKTOP-5AL3OJL\\SQLEXPRESS;Database=WPFExmpleDataBase;TrustServerCertificate=True;Trusted_Connection=True;"); // Текст остается прежним
}
```

## Библиотеки для Blazorise

```
dotnet add package Blazorise
```
```
dotnet add package Blazorise.Bootstrap
```
```
dotnet add package Blazorise.DataGrid
```