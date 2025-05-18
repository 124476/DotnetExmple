using Mobile.Models;
using Mobile.Servies;

namespace Mobile.Pages;

public partial class PageUser : ContentPage
{
    public User ContextUser { get; set; }
    List<UserItem> Items = new List<UserItem>();
	public PageUser(User user)
	{
		InitializeComponent();

        ContextUser = user;

        Refresh();
    }

    private void Refresh()
    {
        BindingContext = null;

        ComboUsers.ItemsSource = App.Users.ToList();
        ComboRoles.ItemsSource = App.Roles.ToList();
        ComboItems.ItemsSource = App.Items.ToList();

        Items = App.UserItems.Where(x => x.UserId == ContextUser.Id).ToList();

        CollectionItems.ItemsSource = null;
        CollectionItems.ItemsSource = Items;

        BindingContext = ContextUser;
    }

    private async void BtnDelete_Clicked(object sender, EventArgs e)
    {
        var item = (sender as Button).BindingContext as UserItem;
        if (item == null) return;

        await NetManage.Delete($"/api/UserItems/{item.Id}");

        Refresh();
    }

    private async void BtnAdd_Clicked(object sender, EventArgs e)
    {
        var item = ComboItems.SelectedItem as Item;
        if (item == null) return;

        var userItem = new UserItem() { Item = item, User = ContextUser };

        await NetManage.Post("/api/UserItems/", userItem);

        Refresh();
    }

    private async void BtnSave_Clicked(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(ContextUser.Name) || string.IsNullOrEmpty(ContextUser.Login) || string.IsNullOrEmpty(ContextUser.Password))
        {
            await DisplayAlert("Предупреждение", "Заполните все поля", "ОК");
            return;
        }

        if (ContextUser.Id == 0)
            await NetManage.Post("/api/Users/", ContextUser);
        else await NetManage.Put($"/api/Users/{ContextUser.Id}", ContextUser);

        await Navigation.PopAsync();
    }
}