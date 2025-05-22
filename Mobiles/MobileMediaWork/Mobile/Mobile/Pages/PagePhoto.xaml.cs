using Mobile.Models;

namespace Mobile.Pages;

public partial class PagePhoto : ContentPage
{
    public static UserData UserData { get; set; }
    private ImageSource _photo;
    private string dir = "";
    public PagePhoto()
    {
        InitializeComponent();

        Refresh();
    }

    private void Refresh()
    {
        BindingContext = null;
        BindingContext = UserData;
    }

    private async void TakePhotoButton_Clicked(object sender, EventArgs e)
    {
        var result = await cameraView.TakePhotoAsync();

        if (result != null)
        {
            dir = Path.Combine(FileSystem.AppDataDirectory, $"image_{DateTime.Now.Ticks}.png");

            using (var ms = new MemoryStream())
            {
                result.CopyTo(ms);

                if (!File.Exists(dir))
                {
                    var fileImage = File.Create(dir);
                    fileImage.Close();
                }
                File.WriteAllBytes(dir, ms.ToArray());
            }

            new ImageCropper.Maui.ImageCropper()
            {
                Success = (string imageFile) =>
                {
                    Device.BeginInvokeOnMainThread(() =>
                    {
                        UserData.Data = imageFile;
                        Refresh();
                    });
                },
            }.Show(this, dir);
        }
    }

    private async void SaveButton_Clicked(object sender, EventArgs e)
    {
        if (UserData.Id == 0)
            App.DB.UserDatas.Add(UserData);
        App.DB.SaveChanges();

        await Navigation.PopAsync();
    }

    private async void SwitchCameraButton_Clicked(object sender, EventArgs e)
    {
        if (cameraView.Cameras.Count < 2) return;

        await cameraView.StopCameraAsync();

        var currentIndex = cameraView.Cameras.IndexOf(cameraView.Camera);
        var nextIndex = (currentIndex + 1) % cameraView.Cameras.Count;

        cameraView.Camera = cameraView.Cameras[nextIndex];

        await cameraView.StartCameraAsync(new Size(1280, 720));
    }
}