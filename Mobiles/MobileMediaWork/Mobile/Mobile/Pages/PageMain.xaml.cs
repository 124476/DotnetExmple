using Mobile.Models;

namespace Mobile.Pages;

public partial class PageMain : ContentPage
{
	public PageMain()
	{
		InitializeComponent();
	}

    private async void BtnEdit_Clicked(object sender, EventArgs e)
    {
        var userData = (sender as Button).BindingContext as UserData;
        if (userData == null) return;

        if (userData.TypeUserData.Id == 1)
        {
            PagePhoto.UserData = userData;
            await Navigation.PushAsync(new PagePhoto());
        }
        else if (userData.TypeUserData.Id == 2)
        {
            PageVideo.UserData = userData;
            await Navigation.PushAsync(new PageVideo());
        }
        else
        {
            PageAudio.UserData = userData;
            await Navigation.PushAsync(new PageAudio());
        }
    }

    private async void BtnAddPhoto_Clicked(object sender, EventArgs e)
    {
        PagePhoto.UserData = new UserData() { TypeUserDataId = 1, };
        await Navigation.PushAsync(new PagePhoto());
    }

    private async void BtnAddVideo_Clicked(object sender, EventArgs e)
    {
        PageVideo.UserData = new UserData() { TypeUserDataId = 2, };
        await Navigation.PushAsync(new PageVideo());
    }

    private async void BtnAddAudio_Clicked(object sender, EventArgs e)
    {
        PageAudio.UserData = new UserData() { TypeUserDataId = 3, };
        await Navigation.PushAsync(new PageAudio());
    }

    private void BtnDelete_Clicked(object sender, EventArgs e)
    {
        var userData = (sender as Button).BindingContext as UserData;
        if (userData == null) return;

        App.DB.UserDatas.Remove(userData);
        App.DB.SaveChanges();

        Refresh();
    }

    private void ContentPage_Appearing(object sender, EventArgs e)
    {
        Refresh();
    }

    private void Refresh()
    {
        ListUserDatas.ItemsSource = null;
        ListUserDatas.ItemsSource = App.DB.UserDatas.ToList();
    }
}