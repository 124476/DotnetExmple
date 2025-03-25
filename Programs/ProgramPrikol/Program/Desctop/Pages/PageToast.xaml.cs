using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Forms;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Threading;
using MessageBox = System.Windows.MessageBox;

namespace Desctop.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageToast.xaml
    /// </summary>
    public partial class PageToast : Page
    {
        DispatcherTimer timer;
        public PageToast()
        {
            InitializeComponent();
        }
        private void BtnSend_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                timer = new DispatcherTimer();
                timer.Interval = TimeSpan.FromSeconds(Int16.Parse(TextSec.Text));
                timer.Tick += Timer_Tick;
                timer.Start();
            }
            catch 
            {
                MessageBox.Show("Ошибка времени!");
            }
        }

        private void Timer_Tick(object sender, EventArgs e)
        {
            NotifyIcon notifyIcon = new NotifyIcon
            {
                Icon = System.Drawing.Icon.ExtractAssociatedIcon(Assembly.GetExecutingAssembly().Location),
                Visible = true,
                BalloonTipTitle = Title.Text,
                BalloonTipText = Description.Text,
            };

            notifyIcon.ShowBalloonTip(3000);

            timer.Stop();
        }
    }
}
