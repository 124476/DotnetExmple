using Microsoft.Maui.Storage;
using Mobile.Models;
using Mobile.Servies;

namespace Mobile.Pages;

public partial class PageItems : ContentPage
{
	public PageItems()
	{
		InitializeComponent();
	}

    private async void BtnDownload_Clicked(object sender, EventArgs e)
    {
        var item = (sender as Button).BindingContext as Item;
        if (item == null) return;


        if (item.Doc == null)
            return;

        try
        {
            string file = Path.Combine(FileSystem.CacheDirectory, item.DocFormat);

            File.WriteAllBytes(file, item.Doc);

            await DisplayAlert("Успех", $"Файл сохранен: {item.DocFormat}", "OK");
        }
        catch (Exception ex)
        {
            await DisplayAlert("Ошибка", ex.Message, "OK");
        }
    }

    private async void BtnEdit_Clicked(object sender, EventArgs e)
    {
        var item = (sender as Button).BindingContext as Item;
        if (item == null) return;

        await Navigation.PushAsync(new PageItem(item));
    }

    private void ContentPage_Appearing(object sender, EventArgs e)
    {
        Refresh();
    }

    private void Refresh()
    {
        CollectionItems.ItemsSource = null;
        CollectionItems.ItemsSource = App.Items.ToList();
    }

    private async void BtnAdd_Clicked(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new PageItem(new Item() { DateStart = DateTime.Now, TimeStart = TimeSpan.FromSeconds(10)}));
    }
}