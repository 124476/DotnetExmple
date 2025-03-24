# DataGrid

## Many to meny

```
<TextBlock>Предметы</TextBlock>
<ListView Name="ListItems">
    <ListView.ItemTemplate>
        <DataTemplate>
            <StackPanel Orientation="Horizontal">
                <TextBlock Text="{Binding Item1.Name}"></TextBlock>
                <Button x:Name="BtnDeleteItem" Background="Red" Click="BtnDeleteItem_Click" Margin="10,0" Width="80" FontSize="15">Удалить</Button>
            </StackPanel>
        </DataTemplate>
    </ListView.ItemTemplate>
</ListView>
<ComboBox Name="ComboItems" DisplayMemberPath="Name"></ComboBox>
<Button Name="BtnAdd" Click="BtnAdd_Click">Добавить</Button>
```

```
private void BtnDeleteItem_Click(object sender, RoutedEventArgs e)
{
    var item = (sender as Button).DataContext as UserItems;
    if (item == null) return;

    contextUser.UserItems.Remove(item);

    RefreshItems();
}

private void RefreshItems()
{
    ListItems.ItemsSource = null;
    ListItems.ItemsSource = contextUser.UserItems;
}

private void BtnAdd_Click(object sender, RoutedEventArgs e)
{
    var item = ComboItems.SelectedItem as Item;
    if (item == null) return;

    var itemUser = new UserItems() { User = contextUser, Item1 = item };

    contextUser.UserItems.Add(itemUser);

    RefreshItems();
}
```

## Фильтрация

```
private void Refresh()
{
    var dateStart = DateStart.SelectedDate;
    var dateEnd = DateEnd.SelectedDate;
    var search = TextSearch.Text.ToLower();

    var items = App.DB.Item.Where(x => x.IsPublished == true).ToList();

    if (dateStart != null)
        items = items.Where(x => x.DateStart >= dateStart).ToList();

    if (dateEnd != null)
        items = items.Where(x => x.DateStart <= dateEnd).ToList();

    items = items.Where(x => x.Name.ToLower().Contains(search) || x.Description.ToLower().Contains(search)).ToList();

    ListItems.ItemsSource = items;
}
```

## Загрузка файла

```
private void BtnFileUplode_Click(object sender, RoutedEventArgs e)
{
    var dialog = new OpenFileDialog();
    if (dialog.ShowDialog().GetValueOrDefault())
    {
        contextItem.Doc = File.ReadAllBytes(dialog.FileName);
        contextItem.DocFormat = System.IO.Path.GetExtension(dialog.FileName).Substring(1);

        Refresh();
    }
}
```

## Скачивание файла

```
private void BtnDownload_Click(object sender, RoutedEventArgs e)
{
    var item = (sender as Button).DataContext as Item;
    if (item == null) return;

    var dialog = new SaveFileDialog() { Filter=$"*.{item.DocFormat} | *.{item.DocFormat}" };
    if (dialog.ShowDialog().GetValueOrDefault())
    {
        var file = File.Create(dialog.FileName);
        file.Close();

        File.WriteAllBytes(dialog.FileName, item.Doc);
    }
}
```

## TimePicker

```
<TextBlock>Время</TextBlock>
<StackPanel Orientation="Horizontal">
    <ComboBox Name="ComboHours" Width="70" SelectionChanged="ComboHours_SelectionChanged"></ComboBox>
    <TextBlock Text="  :  "></TextBlock>
    <ComboBox Name="ComboMinutes" Width="70" SelectionChanged="ComboMinutes_SelectionChanged"></ComboBox>
</StackPanel>
```

```
ComboHours.ItemsSource = Enumerable.Range(0, 24).Select(x => x.ToString("00")).ToList();
ComboMinutes.ItemsSource = Enumerable.Range(0, 60).Select(x => x.ToString("00")).ToList();
```

```
private void Refresh()
{
    DataContext = null;
    DataContext = contextItem;

    ComboHours.SelectedIndex = contextItem.Hour;
    ComboMinutes.SelectedIndex = contextItem.Minute;
}

private void ComboHours_SelectionChanged(object sender, SelectionChangedEventArgs e)
{
    RefreshTimeItem();
}

private void RefreshTimeItem()
{
    contextItem.TimeStart = new TimeSpan(ComboHours.SelectedIndex, ComboMinutes.SelectedIndex, 0);
}

private void ComboMinutes_SelectionChanged(object sender, SelectionChangedEventArgs e)
{
    RefreshTimeItem();
}
```