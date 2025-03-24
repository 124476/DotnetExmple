using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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

namespace Program
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void BtnEmailTest_Click(object sender, RoutedEventArgs e)
        {
            string email = EmailTextBox.Text;
            //string pattern = @"^[\w\.-]+@[\w\.-]+\.\w+$"; // Более хорошая проверка
            string pattern = @"^.+\@.+\..+$";

            if (Regex.IsMatch(email, pattern))
                BtnEmailTest.Background = Brushes.Green;
            else
                BtnEmailTest.Background = Brushes.Red;
        }

        private void NumbersOnlyTextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            string pattern = @"^\d+$";
            e.Handled = !Regex.IsMatch(e.Text, pattern);
        }

        private void ReplaceSpacesButton_Click(object sender, RoutedEventArgs e)
        {
            string input = InputTextBox.Text;
            string result = Regex.Replace(input, @"\s+", "-");
            OutputTextBlock.Text = result;
        }
    }
}
