using Microsoft.Win32;
using ProgramExcel.Models;
using ProgramExcel.Pages;
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
using Excel = Microsoft.Office.Interop.Excel;

namespace ProgramExcel
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
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
            var users = App.DB.Users;
            var items = App.DB.Items;

            var application = new Excel.Application();

            application.SheetsInNewWorkbook = users.Count();
            Excel.Workbook workbook = application.Workbooks.Add(Type.Missing);
            Excel.Worksheet worksheet = application.Worksheets.Item[1];

            int startIndexRow = 1;

            worksheet.Cells[1][startIndexRow] = "Id";
            worksheet.Cells[2][startIndexRow] = "Name";

            foreach (var user in users)
            {
                startIndexRow++;
                worksheet.Cells[1][startIndexRow] = user.Id;
                worksheet.Cells[2][startIndexRow] = user.Name;
            };

            worksheet = application.Worksheets.Item[2];


            startIndexRow = 1;

            worksheet.Cells[1][startIndexRow] = "Id";
            worksheet.Cells[2][startIndexRow] = "Name";
            worksheet.Cells[3][startIndexRow] = "User";

            foreach (var item in items)
            {
                startIndexRow++;
                worksheet.Cells[1][startIndexRow] = item.Id;
                worksheet.Cells[2][startIndexRow] = item.Name;
                worksheet.Cells[3][startIndexRow] = item.User.Id;
            };

            application.Visible = true;
        }

        private void BtnImport_Click(object sender, RoutedEventArgs e)
        {
            var dialog = new OpenFileDialog() { Filter = "*.xlsx; | *.xlsx;" };
            if (dialog.ShowDialog().GetValueOrDefault())
            {
                var users = new List<User>();
                var items = new List<Item>();

                Excel.Application excelApp = new Excel.Application();
                Excel.Workbook workbook = excelApp.Workbooks.Open(dialog.FileName);
                Excel.Worksheet worksheet = workbook.Worksheets[1];
                Excel.Range objects = worksheet.UsedRange;

                int row = 2;
                while (objects[1][row].Value != null)
                {
                    users.Add(new User()
                    {
                        Id = int.Parse(objects[1][row].Value.ToString()),
                        Name = objects[2][row].Value.ToString(),
                    });
                    row++;
                }

                worksheet = workbook.Worksheets[2];
                objects = worksheet.UsedRange;

                row = 2;
                while (objects[1][row].Value != null)
                {
                    items.Add(new Item()
                    {
                        Id = int.Parse(objects[1][row].Value.ToString()),
                        Name = objects[2][row].Value.ToString(),
                        User = users.FirstOrDefault(x => x.Id == int.Parse(objects[3][row].Value.ToString()))
                    });
                    row++;
                }

                App.DB.Users = users;
                App.DB.Items = items;
            }
        }
    }
}
