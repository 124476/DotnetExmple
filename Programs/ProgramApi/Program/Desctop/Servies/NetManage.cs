using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace Desctop.Servies
{
    public static class NetManage
    {
        public static HttpClient httpClient = new HttpClient();
        public static async Task<T> Get<T>(string controller)
        {
            var response = await httpClient.GetAsync("https://localhost:44359/" + controller);
            var content = await response.Content.ReadAsStringAsync();
            var data = JsonConvert.DeserializeObject<T>(content);
            return data;
        }
        public static async Task<HttpResponseMessage> Post<T>(string controller, T data)
        {
            var content = new StringContent(JsonConvert.SerializeObject(data), Encoding.UTF8, "application/json");
            var responce = await httpClient.PostAsync("https://localhost:44359/" + controller, content);

            App.InitData();

            return responce;
        }
        public static async Task<HttpResponseMessage> Put<T>(string controller, T data)
        {
            var content = new StringContent(JsonConvert.SerializeObject(data), Encoding.UTF8, "application/json");
            var responce = await httpClient.PutAsync("https://localhost:44359/" + controller, content);

            App.InitData();

            return responce;
        }
        public static async Task<HttpResponseMessage> Delete(string controller)
        {
            var response = await httpClient.DeleteAsync("https://localhost:44359/" + controller);

            App.InitData();

            return response;
        }
    }
}
