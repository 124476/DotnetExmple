# Работа с Excel
## Основной код
### Импорт
```
Excel.Application excelApp = new Excel.Application();
Excel.Workbook workbook = excelApp.Workbooks.Open(dialog.FileName);
Excel.Worksheet worksheet = workbook.Worksheets[1];
Excel.Range objects = worksheet.UsedRange;

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
var application = new Excel.Application();

application.SheetsInNewWorkbook = users.Count();
Excel.Workbook workbook = application.Workbooks.Add(Type.Missing);
Excel.Worksheet worksheet = application.Worksheets.Item[1];

int startIndexRow = 1;

worksheet.Cells[1][startIndexRow] = "Id";
worksheet.Cells[2][startIndexRow] = "Name";

foreach (var user in users)
{
    startIndexRow++;
    worksheet.Cells[1][startIndexRow] = user.Id;
    worksheet.Cells[2][startIndexRow] = user.Name;
};

application.Visible = true;
```