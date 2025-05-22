using Mobile.Models;

namespace Mobile.Pages;

public partial class PageVideo : ContentPage
{
    public static UserData UserData { get; set; }
    public PageVideo()
	{
		InitializeComponent();

        if (cameraView.NumMicrophonesDetected > 0)
            cameraView.Microphone = cameraView.Microphones.First();

        Refresh();
	}

    private async void BtnStart_Clicked(object sender, EventArgs e)
    {
        //UserData.Data = Path.Combine(FileSystem.AppDataDirectory, $"video_{DateTime.Now}.mp4");

        var dir = FileSystem.AppDataDirectory + $"video_{DateTime.Now}.mp4";

        await cameraView.StartRecordingAsync(dir, new Size(1920, 1080));

        UserData.Data = dir;
    }

    private async void BtnEnd_Clicked(object sender, EventArgs e)
    {
        await cameraView.StopRecordingAsync();

        Refresh();
    }

    private void Refresh()
    {
        BindingContext = null;
        BindingContext = UserData;
    }

    private async void BtnSetCamera_Clicked(object sender, EventArgs e)
    {
        await cameraView.StopCameraAsync();

        var cameraId = cameraView.Cameras.IndexOf(cameraView.Camera);

        cameraView.Camera = cameraView.Cameras[(cameraId + 1) % 2];

        await cameraView.StartCameraAsync();
    }

    private async void BtnSave_Clicked(object sender, EventArgs e)
    {
        if (UserData.Id == 0)
            App.DB.UserDatas.Add(UserData);
        App.DB.SaveChanges();

        await Navigation.PopAsync();
    }
}