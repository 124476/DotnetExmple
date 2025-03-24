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
    /// Логика взаимодействия для UserCalendar.xaml
    /// </summary>
    public partial class UserCalendar : UserControl
    {
        DateTime dateNow;
        List<string> weeks = new List<string> { "Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс" };
        public UserCalendar()
        {
            InitializeComponent();
            dateNow =  DateTime.Now;

            Refresh();
        }

        private void Refresh()
        {
            GridPanel.Children.Clear();

            TextDate.Text = dateNow.ToString("MMMM yyyy");

            for (int i = 0; i < 7; i++)
            {
                var textDate = new TextBlock()
                {
                    Text = weeks[i],
                    VerticalAlignment = VerticalAlignment.Center,
                    HorizontalAlignment = HorizontalAlignment.Center,
                };
                GridPanel.Children.Add(textDate);
                Grid.SetColumn(textDate, i);
            }

            var dateStart = new DateTime(dateNow.Year, dateNow.Month, 1);
            var dateEnd = dateStart.AddMonths(1);

            var dat = (int)dateStart.DayOfWeek - 1;
            if (dat == -1)
                dat = 6;

            while (dateStart < dateEnd)
            {
                var items = App.DB.Item.Where(
                    x => x.DateStart.Value.Day == dateStart.Day 
                    && x.DateStart.Value.Month == dateStart.Month 
                    && x.DateStart.Value.Year == dateStart.Year
                ).ToList();

                var buttonDate = new Button()
                {
                    Content = dateStart.Day.ToString(),
                    VerticalAlignment = VerticalAlignment.Stretch,
                    HorizontalAlignment = HorizontalAlignment.Stretch,
                    DataContext = items,
                };
                buttonDate.Click += ButtonDate_Click;

                if (items.Any())
                    buttonDate.Background = Brushes.Green;

                GridPanel.Children.Add(buttonDate);

                var dateN = dateStart.Day + dat - 1;
                Grid.SetColumn(buttonDate, dateN % 7);
                Grid.SetRow(buttonDate, dateN / 7 + 1);

                dateStart = dateStart.AddDays(1);
            }
        }

        private void ButtonDate_Click(object sender, RoutedEventArgs e)
        {
            var items = (sender as Button).DataContext as List<Item>;

            if (!items.Any())
            {
                MessageBox.Show("Нет предметов на этот день!");
                return;
            }

            var text = "Предметы дня:";
            foreach (var itemNow in items)
                text += "\n" + itemNow.Name;

            MessageBox.Show(text);
        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            dateNow = dateNow.AddMonths(-1);
            Refresh();
        }

        private void BtnUp_Click(object sender, RoutedEventArgs e)
        {
            dateNow = dateNow.AddMonths(1);
            Refresh();
        }
    }
}
