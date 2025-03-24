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
    /// Логика взаимодействия для PagePie.xaml
    /// </summary>
    public partial class PagePie : Page
    {
        public PagePie()
        {
            InitializeComponent();

            var series = new SeriesCollection();

            foreach(var user in App.DB.User.ToList())
            {
                series.Add(new PieSeries()
                {
                    Title = user.Name,
                    Values = new ChartValues<double>() { user.UserItems.Count() },
                    Fill = null,
                });
            }

            PieChart.Series = series;
        }
    }
}
