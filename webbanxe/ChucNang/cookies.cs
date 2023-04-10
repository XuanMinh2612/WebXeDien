using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace webbanxe.ChucNang
{
    public class cookies
    {
        public void SaveCookieAdmin(string userName)
        {
            HttpCookie cookie = new HttpCookie("admin");
            cookie.Value = userName;
            cookie.Expires = DateTime.Now.AddDays(30);
            HttpContext.Current.Response.Cookies.Add(cookie);
        }
        public void DeleteCookie()
        {
            if (HttpContext.Current.Request.Cookies["admin"] != null)
            {
                HttpCookie myCookie = new HttpCookie("admin");
                myCookie.Expires = DateTime.Now.AddDays(-1d);
                HttpContext.Current.Response.Cookies.Add(myCookie);
            }
        }
        public string GetCookie()
        {
            string userJson = HttpContext.Current.Request.Cookies["admin"]?.Value;
            string user = !string.IsNullOrEmpty(userJson) ? userJson : null;
            return user;
        }
      
    }
}