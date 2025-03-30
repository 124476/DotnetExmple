using Microsoft.Win32;
using Newtonsoft.Json;
using ProgramFormat.Pages;
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
using System.Xml;
using System.Xml.Linq;
using System.Xml.Serialization;
using ProgramFormat.Models;
using Formatting = Newtonsoft.Json.Formatting;

namespace ProgramFormat
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            App.DB.Initialize();
            MyFrame.Navigate(new PageUsers());
        }

        private void BtnUsers_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageUsers());
        }

        private void BtnItems_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageItems());
        }

        private void BtnExport_Click(object sender, RoutedEventArgs e)
        {
            var dialog = new SaveFileDialog() { Filter = "Export | *.xml; *.csv; *.txt; *.json;" };
            if (dialog.ShowDialog().GetValueOrDefault())
            {
                var type = dialog.FileName.Split('\\').Last().Split('.').Last();
                switch (type)
                {
                    case "xml":
                        {
                            var items = App.DB.Items;

                            var serializer = new XmlSerializer(typeof(List<Item>));

                            var file = File.Create(dialog.FileName);
                            serializer.Serialize(file, items);
                            file.Close();

                            break;
                        }
                    case "csv":
                    case "txt":
                        {
                            var file = File.Create(dialog.FileName);
                            file.Close();

                            var text = "Id;Name;User" + string.Join("\n", App.DB.Items.Select(x => $"{x.Id};{x.Name};{x.User.Name}"));
                            File.WriteAllText(dialog.FileName, text);

                            break;
                        }
                    case "json":
                        {
                            var file = File.Create(dialog.FileName);
                            file.Close();

                            var items = App.DB.Items;
                            var json = JsonConvert.SerializeObject(items, Formatting.Indented);

                            File.WriteAllText(dialog.FileName, json);

                            break;
                        }
                }
            }
        }

        private void BtnImport_Click(object sender, RoutedEventArgs e)
        {
            var dialog = new OpenFileDialog() { Filter = "Import | *.xml; *.csv; *.txt; *.json;" };
            if (dialog.ShowDialog().GetValueOrDefault())
            {
                var type = dialog.FileName.Split('\\').Last().Split('.').Last();

                App.DB.Items.Clear();
                App.DB.Users.Clear();
                switch (type)
                {
                    case "xml":
                        {
                            var doc = XDocument.Load(dialog.FileName);

                            foreach (var itemElement in doc.Descendants("Item"))
                            {
                                var newItem = new Item
                                {
                                    Id = (int)itemElement.Element("Id"),
                                    Name = (string)itemElement.Element("Name")
                                };

                                var userElement = itemElement.Element("User");

                                var user = App.DB.Users.FirstOrDefault(x => x.Id == (int)userElement.Element("Id"));

                                if (user == null)
                                {
                                    user = new User();
                                    user.Name = (string)userElement.Element("Name");
                                    if (App.DB.Users.Count == 0)
                                        user.Id = 1;
                                    else user.Id = App.DB.Users.LastOrDefault().Id + 1;
                                    App.DB.Users.Add(user);
                                }
                                newItem.User = user;

                                App.DB.Items.Add(newItem);
                            }

                            // Пример без foreach
                            //var items = doc.Descendants("item").Select(x => new Item
                            //{
                            //    Id = (int)x.Element("Id"),
                            //    Name = (string)x.Element("Name"),
                            //});

                            break;
                        }
                    case "csv":
                    case "txt":
                        {
                            var text = File.ReadAllText(dialog.FileName);
                            foreach (var item in text.Split('\n').Skip(1))
                            {
                                var listItem = item.Split(';');
                                var newItem = new Item();
                                newItem.Name = listItem[1];
                                newItem.User = App.DB.Users.FirstOrDefault(x => x.Name == listItem[2]);
                                if (newItem.User == null)
                                {
                                    var user = new User();
                                    user.Name = listItem[2];
                                    if (App.DB.Users.Count == 0)
                                        user.Id = 1;
                                    else user.Id = App.DB.Users.LastOrDefault().Id + 1;

                                    App.DB.Users.Add(user);
                                    newItem.User = user;
                                }

                                if (App.DB.Items.Count == 0)
                                    newItem.Id = 1;
                                else newItem.Id = App.DB.Items.LastOrDefault().Id + 1;

                                App.DB.Items.Add(newItem);
                            }

                            break;
                        }
                    case "json":
                        {
                            var jsonText = File.ReadAllText(dialog.FileName);
                            var items = JsonConvert.DeserializeObject<List<Item>>(jsonText); // Перевод из json в List<Item>

                            foreach (var item in items)
                            {
                                var user = App.DB.Users.FirstOrDefault(x => x.Id == item.User.Id);

                                if (user == null)
                                {
                                    if (App.DB.Users.Count == 0)
                                        item.User.Id = 1;
                                    else item.User.Id = App.DB.Users.LastOrDefault().Id + 1;

                                    App.DB.Users.Add(item.User);
                                }
                                else item.User = user;

                                if (App.DB.Items.Count == 0)
                                    item.Id = 1;
                                else item.Id = App.DB.Items.LastOrDefault().Id + 1;

                                App.DB.Items.Add(item);
                            }

                            break;
                        }
                }
            }
        }
    }
}
