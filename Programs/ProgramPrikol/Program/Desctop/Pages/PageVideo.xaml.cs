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
using System.Windows.Forms;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using OpenFileDialog = Microsoft.Win32.OpenFileDialog;

namespace Desctop.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageVideo.xaml
    /// </summary>
    public partial class PageVideo : Page
    {
        public PageVideo()
        {
            InitializeComponent();
        }

        private void BtnUplode_Click(object sender, RoutedEventArgs e)
        {
            var dialog = new OpenFileDialog() { Filter = "*.mp3; *.mp4; | *.mp3; *.mp4;" };

            if (dialog.ShowDialog().GetValueOrDefault())
                VideoPlayer.Source = new Uri(dialog.FileName);
        }

        private void BtnStart_Click(object sender, RoutedEventArgs e)
        {
            VideoPlayer.Play();
        }

        private void BtnPouse_Click(object sender, RoutedEventArgs e)
        {
            VideoPlayer.Pause();
        }

        private void BtnStop_Click(object sender, RoutedEventArgs e)
        {
            VideoPlayer.Stop();
        }
    }
}
