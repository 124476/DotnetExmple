# Примеры программ и технологий WPF
Это основной репозиторий, который содержит несколько различных проектов. Каждый проект имеет своё readme, где описана основная логика.

## Проекты

1. **[Генеративные элементы](Programs/ProgramGeneration/readme.md)**  
   Генеративные элементы

2. **[Работа с Excel](Programs/ProgramExcel/readme.md)**  
   Импорт и экспорт Excel

3. **[Работа с разными форматами файлов](Programs/ProgramFormat/readme.md)**  
   Импорт и экспорт файлов xml, json, txt, csv

4. **[Графики](Programs/ProgramCharts/readme.md)**  
   Создание линейного, столбчетого и круглой диаграммы

5. **[Дата грид](Programs/ProgramDataGrid/readme.md)**  
   Дата грид, работа с разными данными, фильтрация

6. **[QR-код](Programs/ProgramQrCode/readme.md)**  
   Создание, чтение и сохранение qr-кода

7. **[Работа с Word](Programs/ProgramWord/readme.md)**  
   Импорт и экспорт Word

8. **[Files](Programs/ProgramFiles/readme.md)**  
   Скриншот, pdf-файлы создание, копирование файлов

9. **[Regex](Programs/ProgramRegex/readme.md)**  
   Регулярные выражения

10. **[DragAndDrop](Programs/ProgramDragAndDrop/readme.md)**  
   Перетаскивание объектов

11. **[Прикольные штуки](Programs/ProgramPrikol/readme.md)**  
   Slider, TreeView, Settings.Default и другие

12. **[Модульное тестирование](Programs/ProgramUnitTest/readme.md)**  
   Модульное тестирование функиций

## Важные технологии

### Минимальный размер
#### MainWindow.xaml
```
Title="Проект" Height="450" Width="800" MinHeight="450" MinWidth="800"
```

### Обработчик ошибок
#### App.cs
```
public App()
{
    DispatcherUnhandledException += App_DispatcherUnhandledException;
}

private void App_DispatcherUnhandledException(object sender, System.Windows.Threading.DispatcherUnhandledExceptionEventArgs e)
{
    e.Handled = true;
    MessageBox.Show("Error");
}
```

### Стили
#### Свойства для всех элементов
##### App.xaml
```
<Application.Resources>
    <Style TargetType="TextBlock">
        <Setter Property="FontSize" Value="17"></Setter>
    </Style>
    <Style TargetType="DatePicker">
        <Setter Property="FontSize" Value="17"></Setter>
    </Style>
    <Style TargetType="TextBox">
        <Setter Property="FontSize" Value="17"></Setter>
    </Style>
    <Style TargetType="ComboBox">
        <Setter Property="FontSize" Value="17"></Setter>
    </Style>
    <Style TargetType="ListView">
        <Setter Property="FontSize" Value="17"></Setter>
    </Style>
    <Style TargetType="CheckBox">
        <Setter Property="FontSize" Value="17"></Setter>
    </Style>
    <Style TargetType="DataGrid">
        <Setter Property="FontSize" Value="17"></Setter>
        <Setter Property="AutoGenerateColumns" Value="false"></Setter>
        <Setter Property="IsReadOnly" Value="true"></Setter>
    </Style>
    <Style TargetType="Button">
        <Setter Property="FontSize" Value="17"></Setter>
        <Setter Property="Background" Value="White"></Setter>
    </Style>
</Application.Resources>
```

#### Свойства по ключу
##### App.xaml
```
<Style TargetType="Button" x:Key="BtnStyle">
    <Setter Property="FontSize" Value="17"></Setter>
    <Setter Property="Background" Value="White"></Setter>
    <Setter Property="Template">
        <Setter.Value>
            <ControlTemplate TargetType="{x:Type Button}">
                <Border Background="{TemplateBinding Background}" BorderBrush="LightGray" BorderThickness="1">
                    <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                </Border>
            </ControlTemplate>
        </Setter.Value>
    </Setter>
    <Style.Resources>
        <Style TargetType="Border">
            <Setter Property="CornerRadius" Value="15"></Setter>
        </Style>
    </Style.Resources>
    <Style.Triggers>
        <Trigger Property="IsMouseOver" Value="True">
            <Setter Property="Background" Value="LightBlue"></Setter>
        </Trigger>
    </Style.Triggers>
</Style>
```

##### xaml на другой странице
```
<Button x:Name="BtnUsers" Content="Users" Style="{StaticResource BtnStyle}"></Button>
```

