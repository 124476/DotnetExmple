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
    /// Логика взаимодействия для UserSchedule.xaml
    /// </summary>
    public partial class UserSchedule : UserControl
    {
        List<string> weeks = new List<string> { "Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс" };
        DateTime dateNow;

        public UserSchedule()
        {
            InitializeComponent();

            dateNow = DateTime.Now;
            Refresh();
        }

        private void Refresh()
        {
            GridPanel.Children.Clear();

            var dateStart = new DateTime(dateNow.Year, dateNow.Month, dateNow.Day);

            for (int index_hour = 0; index_hour < 24; index_hour++)
            {
                var textH = $"{index_hour}:00";
                if (index_hour < 10)
                    textH = $"0{index_hour}:00";

                var textHour = new TextBlock()
                {
                    Text = textH,
                };
                GridPanel.Children.Add(textHour);
                Grid.SetRow(textHour, index_hour + 1);
            }


            for (int index_day = 0; index_day < 5; index_day++)
            {
                var dat = (int)dateStart.DayOfWeek - 1;
                if (dat == -1)
                    dat = 6;

                var textDay = new TextBlock()
                {
                    Text = $"{weeks[dat]} {dateStart.Day}",
                    HorizontalAlignment = HorizontalAlignment.Center,
                };
                GridPanel.Children.Add(textDay);
                Grid.SetColumn(textDay, index_day + 1);

                var items = App.DB.Item.Where(
                    x => x.DateStart.Value.Year == dateStart.Year
                    && x.DateStart.Value.Month == dateStart.Month
                    && x.DateStart.Value.Day == dateStart.Day
                ).ToList();

                for (int index_hour = 0; index_hour < 24; index_hour++)
                {
                    var itemsHour = items.Where(x => x.TimeStart.Value.Hours == index_hour).ToList();

                    if (!itemsHour.Any())
                        continue;

                    var button = new Button()
                    {
                        Content = $"{itemsHour.Count()}",
                        DataContext = itemsHour,
                    };
                    button.Click += Button_Click;

                    GridPanel.Children.Add(button);
                    Grid.SetColumn(button, index_day + 1);
                    Grid.SetRow(button, index_hour + 1);
                }
                dateStart = dateStart.AddDays(1);
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            var items = (sender as Button).DataContext as List<Item>;

            var text = "Предметы:";
            foreach (var item in items)
                text += "\n" + item.Name;

            MessageBox.Show(text);
        }

        private void BtnDown_Click(object sender, RoutedEventArgs e)
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
