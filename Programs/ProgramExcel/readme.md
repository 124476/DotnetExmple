# Работа с Excel
## Основной код
### Импорт
```
var app = new Excel.Application();
var workbook = app.Workbooks.Open(dialog.FileName);
var worksheet = workbook.Worksheets[1];
var objects = worksheet.UsedRange;

int row = 2;
while (objects[1][row].Value != null)
{
    users.Add(new User()
    {
        Id = int.Parse(objects[1][row].Value.ToString()),
        Name = objects[2][row].Value.ToString(),
    });
    row++;
}
```

### Экспорт
```
var app = new Excel.Application();
var workbook = app.Workbooks.Add(Type.Missing);
var worksheet = app.Worksheets.Item[1];

int row = 1;

worksheet.Cells[1][row] = "Id";
worksheet.Cells[2][row] = "Name";

foreach (var user in users)
{
    row++;
    worksheet.Cells[1][row] = user.Id;
    worksheet.Cells[2][row] = user.Name;
};

app.Visible = true;
```