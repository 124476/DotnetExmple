# DragAndDrop

Объект, в который дропаем
```
AllowDrop="True" Drop="List_Drop"
```

```
private void List_Drop(object sender, DragEventArgs e)
{
    var list = (sender as ListView);
    if (list == null) return;
    if (contextItem == null) return;

    if (list.Name == "ListOne")
        contextItem.ListId = 1;
    if (list.Name == "ListTwo")
        contextItem.ListId = 2;

    Refresh();
}
```

Объект, из которого берем
```
MouseDown="TextBlock_MouseDown"
```

```
private void TextBlock_MouseDown(object sender, MouseButtonEventArgs e)
{
    var item = (sender as TextBlock).DataContext as Item;
    if (item == null) return;

    contextItem = item;
    DragDrop.DoDragDrop(this, this, DragDropEffects.Move);
}
```