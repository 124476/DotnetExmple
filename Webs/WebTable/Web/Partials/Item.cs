namespace Web.Models
{
    public partial class Item
    {
        public string Photo
        {
            get
            {
                if (Image == null) return "";

                string base64 = Convert.ToBase64String(Image);
                return $"data:image/jpeg;base64,{base64}";
            }
        }
        public string Document
        {
            get
            {
                if (Doc == null) return "";

                string base64 = Convert.ToBase64String(Doc);
                return $"data:{DocFormat};base64,{base64}";
            }
        }
    }
}
