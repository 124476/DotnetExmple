using Desctop.Models;
using Desctop.Servies;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
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
    /// Логика взаимодействия для PageItems.xaml
    /// </summary>
    public partial class PageItems : Page
    {
        Item ContextItem;
        public PageItems()
        {
            InitializeComponent();

            ComboHours.ItemsSource = Enumerable.Range(0, 24).Select(x => x.ToString("00")).ToList();
            ComboMinutes.ItemsSource = Enumerable.Range(0, 60).Select(x => x.ToString("00")).ToList();

            ContextItem = new Item();

            Refresh();
        }

        private async void Refresh()
        {
            DataContext = null;

            ListItems.ItemsSource = null;
            ListItems.ItemsSource = App.Items.ToList();

            ComboHours.SelectedIndex = ContextItem.Hour;
            ComboMinutes.SelectedIndex = ContextItem.Minute;

            DataContext = ContextItem;
        }

        private void BtnDownload_Click(object sender, RoutedEventArgs e)
        {
            var item = (sender as Button).DataContext as Item;
            if (item == null) return;

            var dialog = new SaveFileDialog() { Filter=$"*.{item.DocFormat} | *.{item.DocFormat}" };
            if (dialog.ShowDialog().GetValueOrDefault())
            {
                var file = File.Create(dialog.FileName);
                file.Close();

                File.WriteAllBytes(dialog.FileName, item.Doc);
            }
        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            var item = (sender as Button).DataContext as Item;
            if (item == null) return;

            ContextItem = item;

            Refresh();
        }

        private async void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            var item = (sender as Button).DataContext as Item;
            if (item == null) return;

            await NetManage.Delete($"/api/Items/{item.Id}");

            ContextItem = new Item();

            Refresh();
        }

        private void ComboHours_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            RefreshTimeItem();
        }

        private void RefreshTimeItem()
        {
            ContextItem.TimeStart = new TimeSpan(ComboHours.SelectedIndex, ComboMinutes.SelectedIndex, 0);
        }

        private void ComboMinutes_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            RefreshTimeItem();
        }

        private async void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(ContextItem.Name) || ContextItem.DateStart == null)
            {
                MessageBox.Show("Заполните обязательные поля!");
                return;
            }

            if (ContextItem.Id == 0)
                await NetManage.Post("/api/Items", ContextItem);
            else await NetManage.Put($"/api/Items/{ContextItem.Id}", ContextItem);

            ContextItem = new Item();

            Refresh();
        }

        private void BtnUplode_Click(object sender, RoutedEventArgs e)
        {
            var dialog = new OpenFileDialog() { Filter = "*.png; *.jpeg; *.jpeg; | .png; *.jpeg; *.jpeg;" };
            if (dialog.ShowDialog().GetValueOrDefault())
            {
                ContextItem.Image = File.ReadAllBytes(dialog.FileName);

                Refresh();
            }
        }

        private void BtnFileUplode_Click(object sender, RoutedEventArgs e)
        {
            var dialog = new OpenFileDialog();
            if (dialog.ShowDialog().GetValueOrDefault())
            {
                ContextItem.Doc = File.ReadAllBytes(dialog.FileName);
                ContextItem.DocFormat = System.IO.Path.GetExtension(dialog.FileName).Substring(1);

                Refresh();
            }
        }
    }
}
