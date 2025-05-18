using Microsoft.Maui.Storage;
using Mobile.Models;

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


        if (string.IsNullOrEmpty(item.Doc))
            return;

        try
        {
            byte[] bytes = Convert.FromBase64String(item.Doc);

            string file = Path.Combine(FileSystem.CacheDirectory, item.DocFormat);

            File.WriteAllBytes(file, bytes);

            //Launcher.Default.OpenAsync(new OpenFileRequest("title", new ReadOnlyFile(file))).ConfigureAwait(false);

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
        CollectionItems.ItemsSource = App.DB.Items.ToList();
    }

    private async void BtnAdd_Clicked(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new PageItem(new Item() { DateStart = DateTime.Now, TimeStart = TimeSpan.FromSeconds(10)}));
    }
}