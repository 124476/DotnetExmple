using System;
using System.Collections.Generic;
using System.Diagnostics;
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
    /// Логика взаимодействия для PageDirectoryFile.xaml
    /// </summary>
    public partial class PageDirectoryFile : Page
    {
        public PageDirectoryFile()
        {
            InitializeComponent();
        }

        private void BtnGetTemp_Click(object sender, RoutedEventArgs e)
        {
            var path = System.IO.Path.GetTempPath();
            TextTemp.Text = path;
        }

        private void BtnCreate_Click(object sender, RoutedEventArgs e)
        {
            var path = AppDomain.CurrentDomain.BaseDirectory;

            path = path + "/logs/";

            if (!Directory.Exists(path))
                Directory.CreateDirectory(path);

            path = path + "logs.txt";

            if (!File.Exists(path))
            {
                var file = File.Create(path);
                file.Close();
            }

            File.AppendAllText(path, $"Время: {DateTime.UtcNow.ToString("o")}\n");

            Process.Start(path);
        }
    }
}
