using System;
using System.Collections.Generic;
using System.Diagnostics;
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
    /// Логика взаимодействия для PageHyperLink.xaml
    /// </summary>
    public partial class PageHyperLink : Page
    {
        public PageHyperLink()
        {
            InitializeComponent();
        }

        private void Hyperlink_Click(object sender, RoutedEventArgs e)
        {
            Process.Start("https://github.com/124476/WPFExmple/");
        }
    }
}
