using Desctop.Models;
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
using System.Windows.Shapes;

namespace Desctop.Windows
{
    /// <summary>
    /// Логика взаимодействия для WindowPalitra.xaml
    /// </summary>
    public partial class WindowPalitra : Window
    {
        List<ColorPalitra> colors;
        public WindowPalitra()
        {
            InitializeComponent();

            colors = new List<ColorPalitra>();

            for (int R = 0; R < 10; R++)
                for (int G = 0; G < 10; G++)
                    for (int B = 0; B < 10; B++)
                        colors.Add(new ColorPalitra() { Name = $"#{R}{R}{G}{G}{B}{B}" });

            ListColors.ItemsSource = colors;
        }

        private void ListColors_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            var color = ListColors.SelectedItem as ColorPalitra;
            if (color == null) return;

            App.Color = color;

            DialogResult = true;
        }
    }
}
