# Работа с Word
## Основной код
### Импорт
```
var dialog = new OpenFileDialog() { Filter = "*.docx; | *.docx;" };
if (dialog.ShowDialog().GetValueOrDefault())
{
    var app = new Word.Application();
    var document = app.Documents.Open(dialog.FileName);

    var id_user = 0;
    var id_item = 0;
    var is_item = false;

    var users = new List<User>();
    var items = new List<Item>();

    for (int i = 1; i < document.Words.Count; i++)
    {
        var text = document.Words[i].Text;

        if (string.IsNullOrEmpty(text) || text.Contains("\a") || text.Contains("\r") || text.Contains("\f") || text == "Id" || text == "Name")
            continue;

        try
        {
            var int_item = Int32.Parse(text);
            is_item = true;
        }
        catch
        {
            if (is_item)
            {
                is_item = false;

                var item = new Item();
                item.Id = id_item++;
                item.Name = text;
                item.User = users.LastOrDefault();
                items.Add(item);

                continue;
            }

            var user = new User();
            user.Id = id_user++;
            user.Name = text;
            users.Add(user);
        }
    }

    App.DB.Users = users;
    App.DB.Items = items;
    App.DB.SaveDB();

    document.Close();
}
```

### Экспорт
```
var users = App.DB.Users;

var app = new Word.Application();
var document = app.Documents.Add();

foreach (var user in users)
{
    var items = App.DB.Items.Where(x => x.User.Id == user.Id).ToList();

    var userParagraph = document.Paragraphs.Add();
    var userRange = userParagraph.Range;
    try
    { 
        userRange.set_Style("Заголовок");
    }
    catch { }
    userRange.Text = user.Name;
    userRange.InsertParagraphAfter();

    var tableParagraph = document.Paragraphs.Add();
    var tableRange = tableParagraph.Range;
    var table = document.Tables.Add(tableRange, items.Count() + 1, 2);
    table.Borders.InsideLineStyle = table.Borders.OutsideLineStyle = Word.WdLineStyle.wdLineStyleSingle;
    table.Range.Cells.VerticalAlignment = Word.WdCellVerticalAlignment.wdCellAlignVerticalCenter;

    Word.Range cellRange;

    cellRange = table.Cell(1, 1).Range;
    cellRange.Text = "Id";
    cellRange = table.Cell(1, 2).Range;
    cellRange.Text = "Name";

    table.Rows[1].Range.Bold = 1;
    table.Rows[1].Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter;

    for (int i = 0; i < items.Count(); i++)
    {
        var item = items[i];

        cellRange = table.Cell(i + 2, 1).Range;
        cellRange.Text = item.Id.ToString();

        cellRange = table.Cell(i + 2, 2).Range;
        cellRange.Text = item.Name.ToString();
    }

    if (user != users.LastOrDefault())
        document.Words.Last.InsertBreak(Word.WdBreakType.wdPageBreak);
}

app.Visible = true;
```