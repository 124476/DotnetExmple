# Перевод из разных форматов
## Основной код
### txt, csv
#### Импорт
```
var text = File.ReadAllText(dialog.FileName);
foreach (var item in text.Split('\n').Skip(1))
{
	// Обработка item
}
```

#### Экспорт
```
var text = "Id;Name;User";

foreach (var item in App.DB.Items)
    text += $"\n{item.Id};{item.Name};{item.User.Name}";
File.WriteAllText(dialog.FileName, text);
```

### xml
#### Импорт
```
var doc = XDocument.Load(dialog.FileName);

foreach (var itemElement in doc.Descendants("Item"))
{
	// Обработка item
}
```

#### Экспорт
```
var items = App.DB.Items;

var serializer = new XmlSerializer(typeof(List<Item>));
using (var writer = new StreamWriter(dialog.FileName))
{
    serializer.Serialize(writer, items);
}
```

### json
#### Импорт
```
var jsonText = File.ReadAllText(dialog.FileName);
var items = JsonConvert.DeserializeObject<List<Item>>(jsonText); // Перевод из json в List<Item>

foreach (var item in items)
{
	// Обработка item
}
```

#### Экспорт
```
var items = App.DB.Items;
var json = JsonConvert.SerializeObject(items, Formatting.Indented);

File.WriteAllText(dialog.FileName, json);
```