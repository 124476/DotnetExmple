namespace Mobile.Pages;

public partial class PageAdmin : ContentPage
{
	public PageAdmin()
	{
		InitializeComponent();
	}

    private async void BtnRoles_Clicked(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new PageRoles());
    }

    private async void BtnUsers_Clicked(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new PageUsers());
    }

    private async void BtnItems_Clicked(object sender, EventArgs e)
    {
        await Navigation.PushAsync(new PageItems());
    }
}