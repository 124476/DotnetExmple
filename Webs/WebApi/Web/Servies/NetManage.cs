using Newtonsoft.Json;
using System.Text;
using Web.Components;

namespace Web.Servies
{
    public class NetManage
    {
        public static HttpClient httpClient = new HttpClient();
        public static string host = "https://localhost:44359/";

        public static async Task<T> Get<T> (string url)
        {
            var response = await httpClient.GetAsync(host + url);
            var content = await response.Content.ReadAsStringAsync();
            var data = JsonConvert.DeserializeObject<T> (content);
            return data;
        }

        public static async Task<HttpResponseMessage> Post<T>(string url, T data)
        {
            var content = new StringContent(JsonConvert.SerializeObject(data), Encoding.UTF8, "application/json");
            var response = await httpClient.PostAsync(host + url, content);
            
            await DataManage.InitData();
            
            return response;
        }

        public static async Task<HttpResponseMessage> Put<T>(string url, T data)
        {
            var content = new StringContent(JsonConvert.SerializeObject(data), Encoding.UTF8, "application/json");
            var response = await httpClient.PutAsync(host + url, content);
            
            await DataManage.InitData();

            return response;
        }

        public static async Task<HttpResponseMessage> Delete(string url)
        {
            var response = await httpClient.DeleteAsync(host + url);
            
            await DataManage.InitData();

            return response;
        }
    }
}
