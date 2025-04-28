using Desctop.Pages;
using Desctop.Properties;
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

            ResourceDictionary newTheme = new ResourceDictionary();
            newTheme.Source = new Uri($"Themes/ThemeLigth.xaml", UriKind.Relative);

            Application.Current.Resources.MergedDictionaries.Clear();

            Application.Current.Resources.MergedDictionaries.Add(newTheme);

            MyFrame.Navigate(new PageSlider());
        }

        private void BtnSlider_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageSlider());
        }

        private void BtnSettingsDefault_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageSettingsDefault());
        }

        private void BtnTreeView_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageTreeView());
        }

        private void BtnPhoto_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PagePhotoRedact());
        }

        private void BtnPalitra_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PagePalitra());
        }

        private void BtnHyperLink_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageHyperLink());
        }

        private void BtnRandom_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageRandom());
        }

        private void BtnVersion_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageVersion());
        }

        private void BtnQuestion_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageQuiestion());
        }

        private void BtnEmail_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageEmail());
        }

        private void BtnVideo_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageVideo());
        }

        private void BtnCopyPast_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageCopyPast());
        }

        private void BtnToolTip_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageToolTip());
        }

        private void BtnHech_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageHech());
        }

        private void BtnToast_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageToast());
        }

        private void BtnGotPath_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageGotPath());
        }

        private void BtnMouseCanvas_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageMouseCanvas());
        }

        private void BtnSound_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageSound());
        }

        private void BtnRadioButton_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageRadioButtons());
        }

        private void BtnStyles_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageSetTheme());
        }

        private void BtnDataGrid_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageDataGrid());
        }

        private void BtnDirectoryFile_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageDirectoryFile());
        }

        private void BtnHint_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageHint());
        }

        private void BtnLocalization_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageLocalization());
        }

        private void BtnExpander_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageExpander());
        }
    }
}
