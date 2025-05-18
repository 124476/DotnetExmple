namespace Mobile.Pages;

public partial class PageLogin : ContentPage
{
	public PageLogin()
	{
		InitializeComponent();
	}

    private async void BtnLogin_Clicked(object sender, EventArgs e)
    {
		App.User = App.Users.FirstOrDefault(x => x.Login == Login.Text && x.Password == Password.Text);
		if (App.User == null)
		{
			await DisplayAlert("Предупреждение","Неверные данные", "ОК");
			return;
		}

		await Navigation.PushAsync(new PageAdmin());
    }
}