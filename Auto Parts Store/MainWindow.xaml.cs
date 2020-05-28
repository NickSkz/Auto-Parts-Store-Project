using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Auto_Parts_Store
{
    /// <summary>
    /// Interaction logic for Sign.xaml
    /// </summary>
    public partial class Sign : Window
    {

        private DBConnect connection;

        public Sign()
        {
            InitializeComponent();
            connection = new DBConnect();
            currUserTxt.Content = CurrentUser.name + " " + CurrentUser.last_name;
            showhigherCategories();
        }

        private void showhigherCategories()
        {
            MySqlCommand cmd = new MySqlCommand("SELECT name FROM highercategory", connection.Con);

            connection.Con.Open();

            DataTable dataTable = new DataTable();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd);
            dataAdapter.Fill(dataTable);

            int howManyRecords = Convert.ToInt32(dataTable.Rows.Count.ToString());
            for(int i = 0; i < howManyRecords; ++i)
            {
                DataRow row = dataTable.Rows[i];
                higherCatLst.Items.Add(row["name"]);
            }

            connection.Con.Close();
        }
    }
}
