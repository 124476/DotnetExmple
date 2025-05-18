using Microsoft.Maui.Storage;
using Mobile.Models;
using Mobile.Servies;

namespace Mobile.Pages;

public partial class PageItem : ContentPage
{
	Item ContextItem { get; set; }
	public PageItem(Item item)
	{
		InitializeComponent();

		ContextItem = item;

        Refresh();
    }

    private void Refresh()
    {
        BindingContext = null;
        BindingContext = ContextItem;
    }

    private async void BtnUplodePhoto_Clicked(object sender, EventArgs e)
    {
        var result = await MediaPicker.PickPhotoAsync();
        if (result != null)
        {
            using (var stream = await result.OpenReadAsync())
            {
                var bytes = new byte[stream.Length];
                await stream.ReadAsync(bytes, 0, (int)stream.Length);
                ContextItem.Image = bytes;
            }

            Refresh();
        }
    }

    private async void BtnUplodeFile_Clicked(object sender, EventArgs e)
    {
        var result = await FilePicker.Default.PickAsync();
        if (result != null)
        {
            using (var stream = await result.OpenReadAsync())
            {
                byte[] bytes = new byte[stream.Length];
                await stream.ReadAsync(bytes, 0, (int)stream.Length);
                ContextItem.Doc = bytes;
                ContextItem.DocFormat = result.FileName;
            }
        }
    }

    private async void BtnSave_Clicked(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(ContextItem.Name))
        {
            await DisplayAlert("Предупреждение", "Заполните все обязательные поля", "ОК");
            return;
        }

        if (ContextItem.Id == 0)
            await NetManage.Post("/api/Items", ContextItem);
        else await NetManage.Put($"/api/Items/{ContextItem.Id}", ContextItem);

        await Navigation.PopAsync();
    }
}