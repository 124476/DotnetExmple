using Desctop.Pages;
using System;
using System.Collections.Generic;
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

namespace Desctop
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            MyFrame.Navigate(new PageCartesiab());
        }

        private void BtnCartesian_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageCartesiab());
        }

        private void BtnTab_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageTab());
        }

        private void BtnPie_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PagePie());
        }
    }
}
