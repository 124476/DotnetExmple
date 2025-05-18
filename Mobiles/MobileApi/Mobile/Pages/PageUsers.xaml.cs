using Mobile.Models;
using Mobile.Servies;

namespace Mobile.Pages;

public partial class PageUsers : ContentPage
{
	public PageUsers()
	{
		InitializeComponent();
	}

    private void ContentPage_Appearing(object sender, EventArgs e)
    {
        Refresh();
    }

    private void Refresh()
    {
        CollectionUsers.ItemsSource = null;
        CollectionUsers.ItemsSource = App.Users.ToList();
    }

    private async void BtnEdit_Clicked(object sender, EventArgs e)
    {
        var user = (sender as Button).BindingContext as User;
        if (user == null) return;

        await Navigation.PushAsync(new PageUser(user));
    }

    private async void BtnRemove_Clicked(object sender, EventArgs e)
    {
        var user = (sender as Button).BindingContext as User;
        if (user == null) return;

        var result = await DisplayAlert("Сообщение", "Вы точно хотите удалить?", "Да", "Нет");
        if (!result) return;

        await NetManage.Delete($"/api/Users/{user.Id}");
    }

    private async void BtnAdd_Clicked(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new PageUser(new User()));
    }
}