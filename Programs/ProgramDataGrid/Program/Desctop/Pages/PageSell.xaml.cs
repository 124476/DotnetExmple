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
    /// Логика взаимодействия для PageSell.xaml
    /// </summary>
    public partial class PageSell : Page
    {
        public PageSell()
        {
            InitializeComponent();

            Refresh();
        }

        private void Refresh()
        {
            var dateStart = DateStart.SelectedDate;
            var dateEnd = DateEnd.SelectedDate;
            var search = TextSearch.Text.ToLower();

            var items = App.DB.Item.Where(x => x.IsPublished == true).ToList();

            if (dateStart != null)
                items = items.Where(x => x.DateStart >= dateStart).ToList();

            if (dateEnd != null)
                items = items.Where(x => x.DateStart <= dateEnd).ToList();

            items = items.Where(x => x.Name.ToLower().Contains(search) || x.Description.ToLower().Contains(search)).ToList();

            ListItems.ItemsSource = items;
        }

        private void DateStart_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            Refresh();
        }

        private void DateEnd_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            Refresh();
        }

        private void TextSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            Refresh();
        }
    }
}
