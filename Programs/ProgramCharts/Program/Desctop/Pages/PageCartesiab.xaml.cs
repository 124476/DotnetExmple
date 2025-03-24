using LiveCharts;
using LiveCharts.Wpf;
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
    /// Логика взаимодействия для PageCartesiab.xaml
    /// </summary>
    public partial class PageCartesiab : Page
    {
        public PageCartesiab()
        {
            InitializeComponent();

            var doubles = new ChartValues<double>();
            foreach(var user in App.DB.User.ToList())
                doubles.Add(user.UserItems.Count());

            CarChart.Series = new SeriesCollection()
            {
                new LineSeries
                {
                    Values = doubles,
                    Fill = null,
                }
            };
        }
    }
}
