# Перевод из разных форматов
## Основной код
### txt, csv
#### Импорт
```
var text = "Id;Name;User" + string.Join("\n", App.DB.Items.Select(x => $"{x.Id};{x.Name};{x.User.Name}"));
File.WriteAllText(dialog.FileName, text);
```

#### Экспорт
```
var text = "Id;Name;User" + string.Join("\n", App.DB.Items.Select(x => $"{x.Id};{x.Name};{x.User.Name}"));
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

без foreach
```
var items = doc.Descendants("Item").Select(x => new Item
{
    Id = (int)x.Element("Id"),
    Name = (string)x.Element("Name"),
});
```

#### Экспорт
```
var items = App.DB.Items;

var serializer = new XmlSerializer(typeof(List<Item>));
serializer.Serialize(file, items);
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