using System;
using System.Collections.Generic;
using System.ComponentModel.Design.Serialization;
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

namespace Desctop.Controls
{
    /// <summary>
    /// Логика взаимодействия для StackControl.xaml
    /// </summary>
    public partial class StackControl : UserControl
    {
        StackPanel contextStack;
        public StackControl()
        {
            InitializeComponent();

            var random = new Random();

            for (int indexStack = 0; indexStack < 10; indexStack++)
            {
                var stackPanel = new StackPanel()
                {
                    Width = 200,
                    Height = 100,
                    AllowDrop = true, // Обязательно
                    Margin = new Thickness(5),
                    Background = new SolidColorBrush(Color.FromRgb((byte)random.Next(0, 255), (byte)random.Next(0, 255), (byte)random.Next(0, 255))),
                };
                stackPanel.MouseDown += StackPanel_MouseDown;
                stackPanel.Drop += StackPanel_Drop;

                var textPanel = new TextBlock() { Text = $"Стак панел №{indexStack}", };

                stackPanel.Children.Add(textPanel);

                ListStackPanels.Items.Add(stackPanel);
            }
        }

        private void StackPanel_Drop(object sender, DragEventArgs e)
        {
            var stack = sender as StackPanel;
            if (stack == null) return;

            var indexStack = ListStackPanels.Items.IndexOf(stack);

            ListStackPanels.Items.Remove(contextStack);
            ListStackPanels.Items.Insert(indexStack, contextStack);
        }

        private void StackPanel_MouseDown(object sender, MouseButtonEventArgs e)
        {
            contextStack = sender as StackPanel;
            if (contextStack == null) return;

            DragDrop.DoDragDrop(this, this, DragDropEffects.Move);
        }
    }
}
