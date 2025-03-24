using Desctop;
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

namespace ProgramGenerate.Controls
{
    /// <summary>
    /// Логика взаимодействия для UserGanta.xaml
    /// </summary>
    public partial class UserGanta : UserControl
    {
        public DateTime dateNow;
        List<string> weeks = new List<string> { "Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс" };
        public UserGanta()
        {
            InitializeComponent();

            dateNow = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);

            Refresh();
        }

        private void Refresh()
        {
            GridPanel.Children.Clear();
            GridPanel.RowDefinitions.Clear();

            GridPanel.RowDefinitions.Add(new RowDefinition());

            var dateStart = dateNow;
            var dateEnd = dateNow.AddDays(7);

            DateNow.Text = $"{dateStart.ToString("dd MMMM yyyy")} - {dateEnd.ToString("dd MMMM yyyy")}";

            var items = App.DB.Item.ToList();

            int index_event = 1;
            foreach (var itemDown in items)
            {
                GridPanel.RowDefinitions.Add(new RowDefinition());

                var textUser = new TextBlock()
                {
                    Text = itemDown.Name,
                    HorizontalAlignment = HorizontalAlignment.Center,
                    VerticalAlignment = VerticalAlignment.Center,
                };

                GridPanel.Children.Add(textUser);
                Grid.SetRow(textUser, index_event);
                index_event++;
            }

            var dat = (int)dateNow.DayOfWeek - 1;
            if (dat == -1)
                dat = 6;

            for (int i = 1; i <= weeks.Count; i++)
            {
                var textWeek = new TextBlock()
                {
                    Text = weeks[(i - 1 + dat) % 7],
                    HorizontalAlignment = HorizontalAlignment.Center,
                    VerticalAlignment = VerticalAlignment.Center,
                };
                GridPanel.Children.Add(textWeek);
                Grid.SetColumn(textWeek, i);
            }

            Brush brush;
            var random = new Random();

            int x = 1;
            foreach (var itemDown in items)
            {
                dateStart = dateNow;

                brush = new SolidColorBrush(Color.FromRgb((byte)random.Next(256), (byte)random.Next(256), (byte)random.Next(256)));

                int y = 1;
                while (dateStart < dateEnd)
                {
                    if (itemDown.DateStart <= dateStart && dateStart <= itemDown.DateStart.Value.AddDays(7))
                    {
                        var textBlock = new Grid()
                        {
                            Background = brush,
                            DataContext = itemDown,
                        };
                        textBlock.MouseUp += Button_Click;

                        GridPanel.Children.Add(textBlock);
                        Grid.SetColumn(textBlock, y);
                        Grid.SetRow(textBlock, x);
                    }

                    dateStart = dateStart.AddDays(1);
                    y++;
                }
                x++;
            }
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            var item = (sender as Grid).DataContext as Item;

            var text = "Предмет:\n" + item.Name;

            MessageBox.Show(text);
        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            dateNow = dateNow.AddDays(-1);
            Refresh();
        }

        private void BtnUp_Click(object sender, RoutedEventArgs e)
        {
            dateNow = dateNow.AddDays(1);
            Refresh();
        }
    }
}
