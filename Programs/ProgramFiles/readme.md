# Скриншот, pdf-файлы создание, копирование файлов
## Основной код
### Скриншот
```
var dialog = new SaveFileDialog() { Filter = "*.jpeg; | *.jpeg;" };
if (dialog.ShowDialog().GetValueOrDefault())
{
    BtnUplode.Visibility = Visibility.Collapsed;

    var render = new RenderTargetBitmap((int)GridPng.ActualWidth, (int)GridPng.ActualHeight, 96, 96, PixelFormats.Pbgra32);
    render.Render(GridPng);
    var encoder = new JpegBitmapEncoder();
    encoder.Frames.Add(BitmapFrame.Create(render));

    var file = File.Create(dialog.FileName);
    encoder.Save(file);
    file.Close();
}
BtnUplode.Visibility = Visibility.Visible;
```

### Сохранение в pdf
```
var dialog = new PrintDialog();
if (dialog.ShowDialog().GetValueOrDefault())
{
    BtnUplode.Visibility = Visibility.Collapsed;

    dialog.PrintVisual(GridPng, "test");
}
BtnUplode.Visibility = Visibility.Visible;
```

### Загрузка файла и копирование его в папку с exe
```
var dialog = new OpenFileDialog() { Filter = "*.png; *.jpg; *.jpeg; | *.png; *.jpg; *.jpeg;" };
if (dialog.ShowDialog().GetValueOrDefault())
{
    Data = File.ReadAllBytes(dialog.FileName);
    DataContext = this;

    // Перенос файла в папку с exe
    var list = dialog.FileName.Split('\\');

    var path = "photo_" + list.LastOrDefault();

    var file = File.Create(path);
    file.Close();

    File.WriteAllBytes(path, Data);
}
```