using Microsoft.Win32;
using System;
using System.Collections.Generic;
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

namespace Desctop.Pages
{
    /// <summary>
    /// Логика взаимодействия для PagePhotoRedact.xaml
    /// </summary>
    public partial class PagePhotoRedact : Page
    {
        byte[] OriginPhoto = null;
        public static byte[] Photo { get; set; } = null;
        public static int Angle { get; set; } = 0;
        bool IsGray = true;
        public PagePhotoRedact()
        {
            InitializeComponent();
        }

        private void BtnUplode_Click(object sender, RoutedEventArgs e)
        {
            var dialog = new OpenFileDialog() { Filter = "*.png; | *.png;" };
            if (dialog.ShowDialog().GetValueOrDefault())
            {
                Photo = File.ReadAllBytes(dialog.FileName);
                OriginPhoto = (byte[])Photo.Clone();

                Refresh();
            }
        }

        private void Refresh()
        {
            if (Photo == null) return;

            DataContext = null;
            DataContext = this;
        }

        private void BtnColor_Click(object sender, RoutedEventArgs e)
        {
            if (Photo == null) return;

            if (IsGray)
            {
                var image = new BitmapImage();

                using (var ms = new MemoryStream(Photo))
                {
                    ms.Position = 0;

                    image.BeginInit();
                    image.CacheOption = BitmapCacheOption.OnLoad;
                    image.StreamSource = ms;
                    image.EndInit();
                }

                var grayImage = new FormatConvertedBitmap(image, PixelFormats.Gray8, null, 0);

                var encoder = new PngBitmapEncoder();
                encoder.Frames.Add(BitmapFrame.Create(grayImage));

                using (var ms = new MemoryStream())
                {
                    encoder.Save(ms);
                    Photo = ms.ToArray();
                }
            }
            else
                Photo = (byte[])OriginPhoto.Clone();

            IsGray = !IsGray;

            Refresh();
        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            Angle = (Angle + 10) % 360;

            Refresh();
        }

        private void BtnUp_Click(object sender, RoutedEventArgs e)
        {
            Angle = (Angle - 10) % 360;

            Refresh();
        }
    }
}
