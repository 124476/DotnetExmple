using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Forms;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Desctop.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageGotPath.xaml
    /// </summary>
    public partial class PageGotPath : Page
    {
        public PageGotPath()
        {
            InitializeComponent();
        }

        private void BtnGotPath_Click(object sender, RoutedEventArgs e)
        {
            var dialog = new FolderBrowserDialog();
            if (dialog.ShowDialog() == DialogResult.OK)
                TextPath.Text = dialog.SelectedPath;
        }
    }
}
