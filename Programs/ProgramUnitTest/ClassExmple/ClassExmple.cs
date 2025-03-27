using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace ClassExmple
{
    public class ClassExmple
    {
        public static string HashPassword(string password, string salt)
        {
            var pb = new Rfc2898DeriveBytes(password, Encoding.UTF8.GetBytes(salt), 10000);
            byte[] hash = pb.GetBytes(32);
            return Convert.ToBase64String(hash);
        } 
    }
}
