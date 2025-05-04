namespace Web.Models
{
    public partial class User
    {
        public string Items
        {
            get
            {
                var items = NetManage.DB.UserItems.Where(x => x.UserId == Id).ToList().Select(x => x.Item.Name).ToList();
                return string.Join("\n", items);
            }
        }
    }
}
