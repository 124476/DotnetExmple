using Mobile.Models;
using Plugin.Maui.Audio;

namespace Mobile.Pages;

public partial class PageAudio : ContentPage
{
	public static UserData UserData { get; set; }
    IAudioRecorder recorder = AudioManager.Current.CreateRecorder();
    IAudioPlayer player = AudioManager.Current.CreatePlayer();

    public PageAudio()
	{
		InitializeComponent();

        Refresh();
	}

    private void Refresh()
    {
        BindingContext = null;
        BindingContext = UserData;
    }

    private async void BtnStart_Clicked(object sender, EventArgs e)
    {
        UserData.Data = Path.Combine(FileSystem.AppDataDirectory, $"audio_{DateTime.Now}.wav");
        await recorder.StartAsync(UserData.Data);
    }

    private async void BtnEnd_Clicked(object sender, EventArgs e)
    {
        await recorder.StopAsync();
    }

    private void BtnListen_Clicked(object sender, EventArgs e)
    {
        try
        {
            var ms = File.OpenRead(UserData.Data);
            player.SetSource(ms);
            player.Play();
        }
        catch
        {

        }
    }

    private async void BtnSave_Clicked(object sender, EventArgs e)
    {
        if (UserData.Id == 0)
            App.DB.UserDatas.Add(UserData);
        App.DB.SaveChanges();

        await Navigation.PopAsync();
    }
}