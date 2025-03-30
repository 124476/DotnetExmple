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
    /// Логика взаимодействия для PageMouseCanvas.xaml
    /// </summary>
    public partial class PageMouseCanvas : Page
    {
        public PageMouseCanvas()
        {
            InitializeComponent();
        }

        private void MyCanvas_MouseDown(object sender, MouseButtonEventArgs e)
        {
            var clickPoint = e.GetPosition(MyCanvas);
            var x = clickPoint.X;
            var y = clickPoint.Y;

            var circle = new Ellipse()
            {
                Width = 30,
                Height = 30,
                Fill = Brushes.Red,
            };

            Canvas.SetLeft(circle, x - circle.Width / 2);
            Canvas.SetTop(circle, y - circle.Height / 2);

            MyCanvas.Children.Add(circle);
        }
    }
}
