using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Text;
using System.Windows;

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
            credentials.UserID = "USER";
            credentials.Password = "user1";
            credentials.Database = "autoteile";

            String connStr = credentials.ToString();

            try
            {
                Con = new MySqlConnection(connStr);
            }
            catch (MySqlException e)
            {
                MessageBox.Show("Connection to Database failed!", ":(", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
