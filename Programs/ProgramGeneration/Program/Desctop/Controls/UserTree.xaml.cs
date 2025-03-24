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
    /// Логика взаимодействия для UserTree.xaml
    /// </summary>
    public partial class UserTree : UserControl
    {
        User contextUser;
        List<StackPanel> stackPanels;
        Stack<TextBlock> textBlocks;
        List<Item> items;
        public UserTree()
        {
            InitializeComponent();

            contextUser = App.DB.User.FirstOrDefault();

            Refresh();
        }

        private void Refresh()
        {
            stackPanels = new List<StackPanel>();
            textBlocks = new Stack<TextBlock>();
            items = new List<Item>();
            StackUsers.Children.Clear();

            var User = App.DB.User.FirstOrDefault();
            GenerateTree(User, 0, contextUser);

            GenerateItems(contextUser);
            ListItems.ItemsSource = items;
        }

        private void GenerateItems(User user)
        {
            var itemsDown = user.UserItems.Select(x => x.Item1).ToList();
            items.AddRange(itemsDown);

            var Users = App.DB.User.Where(x => (x.User2 != null && x.User2.Id == user.Id)).ToList();
            foreach (var userDown in Users)
                GenerateItems(userDown);
        }

        private void GenerateTree(User user, int level, User targetUser)
        {
            var users = App.DB.User.Where(x => (x.User2 != null && x.User2.Id == user.Id)).ToList();

            if (stackPanels.Count() <= level)
            {
                stackPanels.Add(new StackPanel()
                {
                    Orientation = Orientation.Horizontal,
                    HorizontalAlignment = HorizontalAlignment.Center,
                });
                StackUsers.Children.Add(stackPanels[level]);
            }

            var textBlock = new TextBlock()
            {
                Text = user.Name,
                HorizontalAlignment = HorizontalAlignment.Center,
                VerticalAlignment = VerticalAlignment.Center,
                Margin = new Thickness(10),
                Background = Brushes.LightGreen,
                Padding = new Thickness(5),
                DataContext = user,
            };
            stackPanels[level].Children.Add(textBlock);

            textBlock.MouseDown += TextBlock_MouseDown;

            if (user.Id == targetUser.Id)
                textBlock.Background = Brushes.Green;

            if (user.Id != 1)
                GetLine(textBlock, textBlocks.Peek());

            textBlocks.Push(textBlock);
            foreach(var userDown in users)
                GenerateTree(userDown, level + 1, targetUser);
            textBlocks.Pop();
        }

        private void TextBlock_MouseDown(object sender, MouseButtonEventArgs e)
        {
            var user = (sender as TextBlock).DataContext as User;
            if (user == null)
                return;

            contextUser = user;
            Refresh();
        }

        private void GetLine(TextBlock textBlock1, TextBlock textBlock2)
        {
            var line = new Line()
            {
                Stroke = Brushes.Black,
                StrokeThickness = 2,
            };
            var triangle = new Polygon()
            {
                Fill = Brushes.Black,
                Stroke = Brushes.Black,
                StrokeThickness = 2,
            };

            CompositionTarget.Rendering += (s, e) =>
            {
                var point1 = textBlock1.TranslatePoint(new Point(textBlock1.ActualWidth / 2, textBlock1.ActualHeight / 2 - 10), MainCanvas);
                var point2 = textBlock2.TranslatePoint(new Point(textBlock2.ActualWidth / 2, textBlock2.ActualHeight / 2 + 10), MainCanvas);

                line.X1 = point1.X;
                line.Y1 = point1.Y - 10;
                line.X2 = point2.X;
                line.Y2 = point2.Y;

                triangle.Points = new PointCollection()
                {
                    new Point(point1.X + 10, point1.Y - 10),
                    new Point(point1.X - 10, point1.Y - 10),
                    new Point(point1.X, point1.Y),
                };
            };

            if (!MainCanvas.Children.Contains(line))
                MainCanvas.Children.Add(line);
            if (!MainCanvas.Children.Contains(triangle))
                MainCanvas.Children.Add(triangle);
        }
    }
}
