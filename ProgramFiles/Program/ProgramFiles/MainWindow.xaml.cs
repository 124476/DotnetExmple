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

namespace ProgramFiles
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

        private void BtnUplode_Click(object sender, RoutedEventArgs e)
        {
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
        }

        private void BtnSavePng_Click(object sender, RoutedEventArgs e)
        {
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
        }

        private void BtnSavePdf_Click(object sender, RoutedEventArgs e)
        {
            var dialog = new PrintDialog();
            if (dialog.ShowDialog().GetValueOrDefault())
            {
                BtnUplode.Visibility = Visibility.Collapsed;

                dialog.PrintVisual(GridPng, "test");
            }
            BtnUplode.Visibility = Visibility.Visible;
        }
    }
}
