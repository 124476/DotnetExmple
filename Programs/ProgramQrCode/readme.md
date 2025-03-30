# Qr-код
## Основной код
### Создание из текста qr-кода через MessagingToolkit
```
var encoder = new QRCodeEncoder();
var bitmap = encoder.Encode(QrText.Text);
using (MemoryStream ms = new MemoryStream())
{
    bitmap.Save(ms, System.Drawing.Imaging.ImageFormat.Bmp);
    ms.Position = 0;

    var bitmapImage = new BitmapImage();
    bitmapImage.BeginInit();
    bitmapImage.CacheOption = BitmapCacheOption.OnLoad;
    bitmapImage.StreamSource = ms;
    bitmapImage.EndInit();

    QrI.Source = bitmapImage;
}
```

### Получение тескта из qr-кода через MessagingToolkit
```
var dialog = new OpenFileDialog() { Filter = "*.png; | *.png;" };
if (dialog.ShowDialog().GetValueOrDefault())
{
    var imageBytes = File.ReadAllBytes(dialog.FileName);
    using (var ms = new MemoryStream(imageBytes))
    {
        var bitmapImage = new BitmapImage();
        bitmapImage.BeginInit();
        bitmapImage.CacheOption = BitmapCacheOption.OnLoad;
        bitmapImage.StreamSource = ms;
        bitmapImage.EndInit();

        QrI.Source = bitmapImage;

        using (var mss = new MemoryStream(imageBytes))
        {
            var decoder = new QRCodeDecoder();
            Bitmap bitmap = new Bitmap(mss);
            QrText.Text = decoder.Decode(new QRCodeBitmapImage(bitmap));
        }
    }
}
```

### Скачивание фото
```
var dialog = new SaveFileDialog() { Filter = "*.png; | *.png;" };
if (dialog.ShowDialog().GetValueOrDefault())
{
    var bitmapSource = (BitmapSource)QrI.Source;

    var encoder = new PngBitmapEncoder();
    encoder.Frames.Add(BitmapFrame.Create(bitmapSource));

    var file = File.Create(dialog.FileName);
    encoder.Save(file);
    file.Close();
}
```

### Создание из текста qr-кода через QrCoder
```
var qRCodeGenerator = new QRCodeGenerator();
var qrCodeData = qRCodeGenerator.CreateQrCode(QrText.Text, QRCodeGenerator.ECCLevel.Q);
using (var qrCode = new PngByteQRCode(qrCodeData))
{
    Data = qrCode.GetGraphic(20);
}
DataContext = this;
```