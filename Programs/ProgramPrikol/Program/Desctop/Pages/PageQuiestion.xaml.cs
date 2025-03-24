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
    /// Логика взаимодействия для PageQuiestion.xaml
    /// </summary>
    public partial class PageQuiestion : Page
    {
        public PageQuiestion()
        {
            InitializeComponent();
        }

        private void BtnQuestion_Click(object sender, RoutedEventArgs e)
        {
            var dialog = MessageBox.Show("Вы любите спать?", "Вопрос", MessageBoxButton.YesNo);

            if (dialog == MessageBoxResult.Yes)
                BtnQuestion.Background = Brushes.Green;
            else
                BtnQuestion.Background = Brushes.Red;
        }
    }
}
