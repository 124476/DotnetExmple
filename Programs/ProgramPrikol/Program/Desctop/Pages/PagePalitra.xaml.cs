using Desctop.Windows;
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
    /// Логика взаимодействия для PagePalitra.xaml
    /// </summary>
    public partial class PagePalitra : Page
    {
        public PagePalitra()
        {
            InitializeComponent();

            TextColor.Background = (Brush)(new BrushConverter().ConvertFromString("#000000"));
        }

        private void TextBoxColor_TextChanged(object sender, TextChangedEventArgs e)
        {
            try
            {
                TextColor.Background = (Brush)(new BrushConverter().ConvertFromString(TextBoxColor.Text));
            }
            catch { }
        }

        private void BtnGetColor_Click(object sender, RoutedEventArgs e)
        {
            var dialog = new WindowPalitra();
            if (dialog.ShowDialog().GetValueOrDefault())
                TextBoxColor.Text = App.Color.Name;
        }
    }
}
