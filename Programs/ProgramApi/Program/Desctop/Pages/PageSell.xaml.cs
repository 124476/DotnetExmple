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
    /// Логика взаимодействия для PageSell.xaml
    /// </summary>
    public partial class PageSell : Page
    {
        int pageNow = 1;
        int pageAll = 1;
        int score = 10;
        public PageSell()
        {
            InitializeComponent();

            Refresh();
        }

        private async void Refresh()
        {
            var dateStart = DateStart.SelectedDate;
            var dateEnd = DateEnd.SelectedDate;
            var search = TextSearch.Text.ToLower();

            var items = (await NetManage.Get<List<Item>>("api/items")).ToList();

            items = items.Where(x => x.IsPublished == true).ToList();

            if (dateStart != null)
                items = items.Where(x => x.DateStart >= dateStart).ToList();

            if (dateEnd != null)
                items = items.Where(x => x.DateStart <= dateEnd).ToList();

            items = items.Where(x => x.Name.ToLower().Contains(search) || x.Description.ToLower().Contains(search)).ToList();

            pageAll = items.Count / score;
            pageAll += items.Count % score == 0 ? 0 : 1;
            pageAll = pageAll == 0 ? 1 : pageAll;

            items = items.Skip((pageNow - 1) * score).Take(score).ToList();

            TextPages.Text = $"{pageNow} / {pageAll}";

            ListItems.ItemsSource = items;
        }

        private void DateStart_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            pageNow = 1;

            Refresh();
        }

        private void DateEnd_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            pageNow = 1;

            Refresh();
        }

        private void TextSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            pageNow = 1;

            Refresh();
        }

        private void BtnDown_Click(object sender, RoutedEventArgs e)
        {
            pageNow = pageNow == 1 ? 1 : pageNow - 1;

            Refresh();
        }

        private void BtnUp_Click(object sender, RoutedEventArgs e)
        {
            pageNow = pageNow == pageAll ? pageAll : pageNow + 1;

            Refresh();
        }
    }
}
