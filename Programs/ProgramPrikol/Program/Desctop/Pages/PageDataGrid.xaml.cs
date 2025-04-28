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
    /// Логика взаимодействия для PageDataGrid.xaml
    /// </summary>
    public partial class PageDataGrid : Page
    {
        public class Item
        {
            public string Name { get; set; }
            public int CountOne { get; set; }
            public int CountTwo { get; set; }
        }

        public PageDataGrid()
        {
            InitializeComponent();

            var items = new List<Item>()
            {
                new Item()
                {
                    Name = "Предмет 1",
                    CountOne = 10,
                    CountTwo = 15,
                },
                new Item()
                {
                    Name = "Предмет 2",
                    CountOne = 67,
                    CountTwo = 54,
                },
                new Item()
                {
                    Name = "Предмет 3",
                    CountOne = 45,
                    CountTwo = 23,
                },
                new Item()
                {
                    Name = "Предмет 4",
                    CountOne = 54,
                    CountTwo = 23,
                },
                new Item()
                {
                    Name = "Предмет 5",
                    CountOne = 43,
                    CountTwo = 12,
                },
            };

            DataItems.ItemsSource = items;
        }

        private void DataItems_LoadingRow(object sender, DataGridRowEventArgs e)
        {
            e.Row.Header = (e.Row.GetIndex() + 1).ToString();
        }
    }
}
