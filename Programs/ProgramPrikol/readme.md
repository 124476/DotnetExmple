# Прикольные штуки

## Получение версии программы

в .csproj
```
<Deterministic>false</Deterministic>
```

в \Properties\AssemblyInfo.cs
```
[assembly: AssemblyVersion("1.0.*")]
```

в коде
```
Version version = Assembly.GetExecutingAssembly().GetName().Version;
OsVersionText.Text = $"{version.Major}.{version.Minor}.{version.Build}.{version.Revision}";
```

## Копипаст

```
Clipboard.SetText(TextCopy.Text);
```

## Уведомления

```
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
```

## Email

```
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
```

## Цвет из текста

```
TextColor.Background = (Brush)(new BrushConverter().ConvertFromString(TextBoxColor.Text));
```

## Хэширование

```
public static string HashPassword(string password, string salt)
{
    var pbkdf2 = new Rfc2898DeriveBytes(password, Encoding.UTF8.GetBytes(salt), 10000);
    byte[] hash = pbkdf2.GetBytes(32);
    return Convert.ToBase64String(hash);
}

private void BtnHech_Click(object sender, RoutedEventArgs e)
{
    TextHech.Text = HashPassword(TextText.Text, "g24g4h635w45tewtgery452y"); // Соль, состоящие более чем из 8 символов
}
```

## Редактирование фото

### Поворот фото

```
<Image Source="{Binding Photo}" Height="200">
    <Image.RenderTransform>
        <RotateTransform Angle="{Binding Angle}" CenterX="100" CenterY="100"></RotateTransform>
    </Image.RenderTransform>
</Image>
```

### Покраска в серый цвет
```
var image = new BitmapImage();

using (var ms = new MemoryStream(Photo))
{
    ms.Position = 0;

    image.BeginInit();
    image.CacheOption = BitmapCacheOption.OnLoad;
    image.StreamSource = ms;
    image.EndInit();
}

var grayImage = new FormatConvertedBitmap(image, PixelFormats.Gray8, null, 0);

var encoder = new PngBitmapEncoder();
encoder.Frames.Add(BitmapFrame.Create(grayImage));

using (var ms = new MemoryStream())
{
    encoder.Save(ms);
    Photo = ms.ToArray();
}
```

## FolderBrowserDialog

```
var dialog = new FolderBrowserDialog();
if (dialog.ShowDialog() == DialogResult.OK)
    TextPath.Text = dialog.SelectedPath;
```

## Получение X и Y мышки + отрисовка по ним объекта

```
<Canvas Name="MyCanvas" MouseDown="MyCanvas_MouseDown" Background="White"></Canvas> <!--Background - обязателен!-->
```

```
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
```

## Издача звука

```
SystemSounds.Beep.Play();
```

## Радио button

```
<Style TargetType="RadioButton" x:Key="RadioButtonCustom">
    <Setter Property="Template">
        <Setter.Value>
            <ControlTemplate TargetType="RadioButton">
                <Border Name="CustomBorder" Background="LightGray" Padding="10">
                    <TextBlock Text="{TemplateBinding Content}"></TextBlock>
                </Border>
                <ControlTemplate.Triggers>
                    <Trigger Property="IsChecked" Value="true">
                        <Setter TargetName="CustomBorder" Property="Background" Value="LightBlue"></Setter>
                    </Trigger>
                </ControlTemplate.Triggers>
            </ControlTemplate>
        </Setter.Value>
    </Setter>
</Style>
```

```
<StackPanel VerticalAlignment="Center" Margin="1-">
    <RadioButton Style="{StaticResource RadioButtonCustom}">Кнопка 1</RadioButton>
    <RadioButton Style="{StaticResource RadioButtonCustom}">Кнопка 2</RadioButton>
    <RadioButton Style="{StaticResource RadioButtonCustom}">Кнопка 3</RadioButton>
    <RadioButton Style="{StaticResource RadioButtonCustom}">Кнопка 4</RadioButton>
</StackPanel>
```

Template - для того, чтобы полностью переписать дизайн кнопки

## Смена темы

Создаем два словаря ресурсов
> ⚠️ **Внимание:** В свойствах словарей ресурсов установите build: resource

Themes/ThemeDark.xaml
Themes/ThemeLigth.xaml

И прописываем в них стили при выборе

в MainWindow
```
ResourceDictionary newTheme = new ResourceDictionary();
newTheme.Source = new Uri($"Themes/ThemeLigth.xaml", UriKind.Relative);

Application.Current.Resources.MergedDictionaries.Clear();

Application.Current.Resources.MergedDictionaries.Add(newTheme);
```

смена стиля
```
private void SetTheme(string theme)
{
    ResourceDictionary newTheme = new ResourceDictionary();
    newTheme.Source = new Uri($"Themes/{theme}", UriKind.Relative);

    Application.Current.Resources.MergedDictionaries.Clear();

    Application.Current.Resources.MergedDictionaries.Add(newTheme);
}

private void BtnLigth_Click(object sender, RoutedEventArgs e)
{
    SetTheme("ThemeLigth.xaml");
}

private void BtnDark_Click(object sender, RoutedEventArgs e)
{
    SetTheme("ThemeDark.xaml");
}
```