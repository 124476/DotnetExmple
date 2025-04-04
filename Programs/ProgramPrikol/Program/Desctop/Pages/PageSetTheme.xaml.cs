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

namespace Desctop.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageSetTheme.xaml
    /// </summary>
    public partial class PageSetTheme : Page
    {
        public PageSetTheme()
        {
            InitializeComponent();
        }
        private void SetTheme(string theme)
        {
            ResourceDictionary newTheme = new ResourceDictionary();
            newTheme.Source = new Uri($"Themes/{theme}", UriKind.Relative);

            Application.Current.Resources.MergedDictionaries.Clear();

            Application.Current.Resources.MergedDictionaries.Add(newTheme);
        }

        private void BtnLigth_Click(object sender, RoutedEventArgs e)
        {
            SetTheme("ThemeLigth.xaml");
        }

        private void BtnDark_Click(object sender, RoutedEventArgs e)
        {
            SetTheme("ThemeDark.xaml");
        }
    }
}
