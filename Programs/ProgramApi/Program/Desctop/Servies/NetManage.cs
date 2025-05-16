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
    }
}
