using Desctop.Models;
using Desctop.Servies;
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
    /// Логика взаимодействия для PageRoles.xaml
    /// </summary>
    public partial class PageRoles : Page
    {
        public PageRoles()
        {
            InitializeComponent();

            Refresh();
        }

        private async void Refresh()
        {
            ListRoles.ItemsSource = (await NetManage.Get<List<Role>>("api/roles")).ToList();
        }
    }
}
