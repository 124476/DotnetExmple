using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Net;
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
using Microsoft.Win32;
using OpenFileDialog = Microsoft.Win32.OpenFileDialog;
using MessageBox = System.Windows.MessageBox;

namespace Desctop.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageEmail.xaml
    /// </summary>
    public partial class PageEmail : Page
    {
        byte[] data;
        string filename;

        public PageEmail()
        {
            InitializeComponent();
        }

        private void SendBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                MailMessage message = new MailMessage(App.EmailName, EmailTo.Text, "WPFExmple", "Письмо работает!");

                var client = new SmtpClient("smtp.gmail.com", 587)
                {
                    Credentials = new NetworkCredential(App.EmailName, App.EmailPassword),
                    EnableSsl = true
                };

                try
                {
                    using (MemoryStream ms = new MemoryStream(data)) // Добавление файла к письму
                    {
                        var data = new Attachment(ms, filename);
                        message.Attachments.Add(data);
                        client.Send(message);
                    }
                }
                catch
                {
                    client.Send(message);
                }

                MessageBox.Show("Отправлено!");
            }
            catch
            {
                MessageBox.Show("Ошибка отправки!");
            }
        }

        private void SetFile_Click(object sender, RoutedEventArgs e)
        {
            var dialog = new OpenFileDialog();
            if (dialog.ShowDialog().GetValueOrDefault())
            {
                data = File.ReadAllBytes(dialog.FileName);
                var list = dialog.FileName.Split('\\');
                filename = list[list.Length - 1];
                FileDoc.Text = filename;
            }
        }
    }
}
