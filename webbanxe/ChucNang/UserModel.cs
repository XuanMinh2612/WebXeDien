using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace webbanxe.ChucNang
{
    public class UserModel
    {
        public string UserName { get; set; }
        public string Password { get; set; }
        public string FullName { get; set; }
        public string Address { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
        public string Role { get; set; }
        // Constructor
        public UserModel(string username, string password, string fullname, string address, string phonenumber, string email, string role)
        {
            UserName = username;
            Password = password;
            FullName = fullname;
            Address = address;
            PhoneNumber = phonenumber;
            Email = email;
            Role = role;
        }
        public UserModel() {  }
    }
}