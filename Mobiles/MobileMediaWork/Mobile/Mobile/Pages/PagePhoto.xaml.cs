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

        if (UserData.Id != 0)
        {
            NameUserData.Text = UserData.Name;
            photoImage.Source = ImageSource.FromFile(UserData.Data);
        }
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
                        _photo = ImageSource.FromFile(imageFile);
                        photoImage.Source = _photo;
                    });
                },
            }.Show(this, dir);
        }
    }

    private async void SaveButton_Clicked(object sender, EventArgs e)
    {
        var userData = new UserData()
        {
            TypeUserDataId = 1,
            Name = NameUserData.Text,
            Data = dir,
        };

        if (userData.Id == 0)
            App.DB.UserDatas.Add(userData);
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