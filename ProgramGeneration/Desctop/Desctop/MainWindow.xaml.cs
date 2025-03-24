using ProgramGenerate.Pages;
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
            MyFrame.Navigate(new PageCalendar());
        }

        private void BtnCalendar_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageCalendar());
        }

        private void BtnSchedule_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageSchedule());
        }

        private void BtnTree_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageTree());
        }

        private void BtnGanta_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageGanta());
        }
    }
}
