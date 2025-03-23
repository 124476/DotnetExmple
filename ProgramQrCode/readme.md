# Qr-код
## Основной код
### Создание из текста qr-кода через MessagingToolkit
```
var encoder = new QRCodeEncoder();
Bitmap bitmap = encoder.Encode(QrText.Text);
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
    using (MemoryStream ms = new MemoryStream(imageBytes))
    {
        var bitmapImage = new BitmapImage();
        bitmapImage.BeginInit();
        bitmapImage.CacheOption = BitmapCacheOption.OnLoad;
        bitmapImage.StreamSource = ms;
        bitmapImage.EndInit();

        QrI.Source = bitmapImage;

        using (MemoryStream mss = new MemoryStream(imageBytes))
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
    var file = File.Create(dialog.FileName);
    file.Close();

    var encoder = new JpegBitmapEncoder();
    var bitmapSource = (BitmapSource)QrI.Source;
    encoder.Frames.Add(BitmapFrame.Create(bitmapSource));
    using (MemoryStream ms = new MemoryStream())
    {
        encoder.Save(ms);
        File.WriteAllBytes(dialog.FileName, ms.ToArray());
    }
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