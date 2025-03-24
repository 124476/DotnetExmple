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
    /// Логика взаимодействия для PageSlider.xaml
    /// </summary>
    public partial class PageSlider : Page
    {
        public PageSlider()
        {
            InitializeComponent();
        }

        private void SliderContext_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            TextSlider.Text = SliderContext.Value.ToString();
        }
    }
}
