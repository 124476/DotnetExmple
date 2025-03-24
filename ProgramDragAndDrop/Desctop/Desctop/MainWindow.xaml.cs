using Desctop.Models;
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
        List<Item> Items = new List<Item>();
        Item contextItem;
        public MainWindow()
        {
            InitializeComponent();

            Items.Add(new Item() { Id = 1, Name = "Item 1", ListId = 1 });
            Items.Add(new Item() { Id = 2, Name = "Item 2", ListId = 1 });
            Items.Add(new Item() { Id = 3, Name = "Item 3", ListId = 1 });
            Items.Add(new Item() { Id = 4, Name = "Item 4", ListId = 2 });
            Items.Add(new Item() { Id = 5, Name = "Item 5", ListId = 2 });
            Items.Add(new Item() { Id = 6, Name = "Item 6", ListId = 2 });

            Refresh();
        }

        private void Refresh()
        {
            ListOne.ItemsSource = null;
            ListTwo.ItemsSource = null;

            ListOne.ItemsSource = Items.Where(x => x.ListId == 1).ToList();
            ListTwo.ItemsSource = Items.Where(x => x.ListId == 2).ToList();
        }

        private void List_Drop(object sender, DragEventArgs e)
        {
            var list = (sender as ListView);
            if (list == null) return;
            if (contextItem == null) return;

            if (list.Name == "ListOne")
                contextItem.ListId = 1;
            if (list.Name == "ListTwo")
                contextItem.ListId = 2;

            Refresh();
        }

        private void TextBlock_MouseDown(object sender, MouseButtonEventArgs e)
        {
            var item = (sender as TextBlock).DataContext as Item;
            if (item == null) return;

            contextItem = item;
            DragDrop.DoDragDrop(this, this, DragDropEffects.Move);
        }
    }
}
