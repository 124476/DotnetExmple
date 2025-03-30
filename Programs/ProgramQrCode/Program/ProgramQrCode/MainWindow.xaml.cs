using MessagingToolkit.QRCode.Codec;
using MessagingToolkit.QRCode.Codec.Data;
using Microsoft.Win32;
using QRCoder;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ProgramQrCode
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public byte[] Data { get; set; }
        public MainWindow()
        {
            InitializeComponent();
        }

        private void GotImage_Click(object sender, RoutedEventArgs e)
        {
            // MessagingToolkit
            var encoder = new QRCodeEncoder();
            var bitmap = encoder.Encode(QrText.Text);
            using (var ms = new MemoryStream())
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

            // QRCoder
            var qRCodeGenerator = new QRCodeGenerator();
            var qrCodeData = qRCodeGenerator.CreateQrCode(QrText.Text, QRCodeGenerator.ECCLevel.Q);
            using (var qrCode = new PngByteQRCode(qrCodeData))
            {
                Data = qrCode.GetGraphic(20);
            }
            DataContext = this;
        }

        private void SetImage_Click(object sender, RoutedEventArgs e)
        {
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
                        var bitmap = new Bitmap(mss);
                        QrText.Text = decoder.Decode(new QRCodeBitmapImage(bitmap));
                    }
                }
            }
        }

        private void SaveImage_Click(object sender, RoutedEventArgs e)
        {
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
        }
    }
}

