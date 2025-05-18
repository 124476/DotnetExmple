
using Mobile.Models;
using System.Linq;

namespace Mobile.Pages;

public partial class PageSell : ContentPage
{
    const int pageItems = 5;

    int pageNow = 0;
    int pageAll = 0;
    List<Item> items = new List<Item>();
	public PageSell()
	{
		InitializeComponent();
        Refresh();
	}

    private void Refresh()
    {
        if (TextSearch == null) return;
        var search = TextSearch.Text.ToLower();
        var dateStart = DateStart.Date;
        var dateEnd = DateEnd.Date;

        items = App.Items.Where(x => x.IsPublished == true).ToList();

        items = items.Where(x => x.Name.ToLower().Contains(search) || x.Description.ToLower().Contains(search)).ToList();

        items = items.Where(x => dateStart <= x.DateStart && x.DateStart <= dateEnd).ToList();

        pageNow = 0;
        pageAll = items.Count / pageItems + (items.Count % pageItems == 0 ? 0 : 1);

        RefreshPagination();
    }

    private void RefreshPagination()
    {
        var listItems = items.Skip(pageNow * pageItems).Take(pageItems).ToList();

        CollectionItems.ItemsSource = null;
        CollectionItems.ItemsSource = listItems;

        TextDate.Text = $"{pageNow + 1}/{pageAll}";
    }

    private void DateStart_DateSelected(object sender, DateChangedEventArgs e)
    {
        Refresh();
    }

    private void DateEnd_DateSelected(object sender, DateChangedEventArgs e)
    {
        Refresh();
    }

    private void TextSearch_TextChanged(object sender, TextChangedEventArgs e)
    {
        Refresh();
    }

    private void BtnDown_Clicked(object sender, EventArgs e)
    {
        pageNow--;
        if (pageNow < 0) pageNow++;

        RefreshPagination();
    }

    private void BtnUp_Clicked(object sender, EventArgs e)
    {
        pageNow++;
        if (pageNow >= pageAll) pageNow--;

        RefreshPagination();
    }
}