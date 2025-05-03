using Mobile.Models;

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
        CollectionUsers.ItemsSource = App.DB.Users.ToList();
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

        App.DB.Users.Remove(user);
        App.DB.SaveChanges();


    }
}