using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineShoppingBookStore
{
    public class BookStore
    {
        private string username;
        private string password;
        private string phone;
        private string gender;
        private string email;
        private string address;

        public string UserName
        {
            get { return username; }
            set { username = value; }
        }
        public string PassWord
        {
            get { return password; }
            set { password = value; }
        }

        public string Phone
        {
            get { return phone; }
            set { phone = value; }
        }
        public string Gender
        {
            get { return gender; }
            set { gender = value; }
        }
        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        public string Address
        {
            get { return address; }
            set { address = value; }
        }
        public class BookStoreInfo
        {
           public  string username;
           public string password;
           public string phone;
           public string gender;
           public string email;
           public string address;
        }
    }
}