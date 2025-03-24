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
    /// Логика взаимодействия для PageRandom.xaml
    /// </summary>
    public partial class PageRandom : Page
    {
        public PageRandom()
        {
            InitializeComponent();
        }

        private void BtnRandom_Click(object sender, RoutedEventArgs e)
        {
            var random = new Random();
            var text = ((char)random.Next('A', 'Z' + 1)).ToString() + ((char)random.Next('A', 'Z' + 1)).ToString()
                + ((char)random.Next('A', 'Z' + 1)).ToString() + ((char)random.Next('A', 'Z' + 1)).ToString()
                + ((char)random.Next('A', 'Z' + 1)).ToString() + ((char)random.Next('A', 'Z' + 1)).ToString()
                + ((char)random.Next('A', 'Z' + 1)).ToString() + ((char)random.Next('A', 'Z' + 1)).ToString()
                + ((char)random.Next('A', 'Z' + 1)).ToString() + ((char)random.Next('A', 'Z' + 1)).ToString();

            TextRandom.Text = text.ToString();
        }
    }
}
