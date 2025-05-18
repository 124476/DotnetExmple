using Mobile.Models;

namespace Mobile.Pages;

public partial class PageUser : ContentPage
{
    public User ContextUser { get; set; }
    List<UserItem> Items = new List<UserItem>();
	public PageUser(User user)
	{
		InitializeComponent();

        ComboUsers.ItemsSource = App.DB.Users.ToList();
        ComboRoles.ItemsSource = App.DB.Roles.ToList();
        ComboItems.ItemsSource = App.DB.Items.ToList();

        ContextUser = user;

        Items = App.DB.UserItems.Where(x => x.UserId == ContextUser.Id).ToList();

        BindingContext = ContextUser;

        Refresh();
    }

    private void Refresh()
    {
        CollectionItems.ItemsSource = null;
        CollectionItems.ItemsSource = Items;
    }

    private void BtnDelete_Clicked(object sender, EventArgs e)
    {
        var item = (sender as Button).BindingContext as UserItem;
        if (item == null) return;

        Items.Remove(item);

        Refresh();
    }

    private void BtnAdd_Clicked(object sender, EventArgs e)
    {
        var item = ComboItems.SelectedItem as Item;
        if (item == null) return;

        var userItem = new UserItem() { Item = item, User = ContextUser };

        if (!Items.Select(x => x.Item).Contains(item))
            Items.Add(userItem);

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
            App.DB.Users.Add(ContextUser);
        App.DB.SaveChanges();

        var items = App.DB.UserItems.Where(x => x.UserId == ContextUser.Id).ToList();
        App.DB.UserItems.RemoveRange(items);
        App.DB.SaveChanges();

        foreach (var item in Items)
            App.DB.UserItems.Add(item);

        App.DB.SaveChanges();

        await Navigation.PopAsync();
    }
}