namespace Mobile.Pages;

public partial class PageRoles : ContentPage
{
	public PageRoles()
	{
		InitializeComponent();
		CollectionRoles.ItemsSource = App.Roles.ToList();
	}
}