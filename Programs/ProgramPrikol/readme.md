# Прикольные штуки

## Настройка версии программы

в .csproj
```
<Deterministic>false</Deterministic>
```

в \Properties\AssemblyInfo.cs
```
[assembly: AssemblyVersion("1.0.*")]
```

в коде
```
Version version = Assembly.GetExecutingAssembly().GetName().Version;
OsVersionText.Text = $"{version.Major}.{version.Minor}.{version.Build}.{version.Revision}";
```

## Копипаст

```
Clipboard.SetText(TextCopy.Text);
```