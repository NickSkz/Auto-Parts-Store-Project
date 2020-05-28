using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Text;

namespace Auto_Parts_Store
{
    class DBConnect
    {
        public MySqlConnection Con { get; set; }

        public DBConnect()
        {
            initializeConnection();
        }

        private void initializeConnection()
        {
            MySqlConnectionStringBuilder credentials = new MySqlConnectionStringBuilder();
            credentials.Server = "127.0.0.1";
            credentials.UserID = "root";
            credentials.Password = "1234";
            credentials.Database = "autoteile";

            String connStr = credentials.ToString();

            Con = new MySqlConnection(connStr);
        }
    }
}
