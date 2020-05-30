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
    /// Interaction logic for PreviousOrders.xaml
    /// </summary>
    public partial class PreviousOrders : Window
    {
        DBConnect connection;

        public PreviousOrders()
        {
            InitializeComponent();
            connection = new DBConnect();
            showOrders();
        }

        private void showOrders()
        {
            if (connection.Con.State == ConnectionState.Open) return;

            MySqlCommand cmd = new MySqlCommand($"SELECT transaction_nr, order_date FROM orderr WHERE customer_id = {CurrentUser.id}", connection.Con);

            connection.Con.Open();

            DataTable dataTable = new DataTable();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd);
            dataAdapter.Fill(dataTable);

            int howManyRecords = Convert.ToInt32(dataTable.Rows.Count.ToString());
            for (int i = 0; i < howManyRecords; ++i)
            {
                DataRow row = dataTable.Rows[i];
                ordLst.Items.Add("Transaction nr: " + row["transaction_nr"] + ", Datum: " + row["order_date"]);
            }

            connection.Con.Close();
        }

        private void ordLst_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (connection.Con.State == ConnectionState.Open) return;

            prdLst.Items.Clear();

            int endIdx = ordLst.SelectedItem.ToString().IndexOf(",", StringComparison.Ordinal);
            int transactionNr = Int32.Parse(ordLst.SelectedItem.ToString().Substring(16, endIdx - 16));


            MySqlCommand cmd = new MySqlCommand($"SELECT p.name, op.how_many FROM order_product op INNER JOIN product p ON op.product_id = p.product_id INNER JOIN orderr o ON op.order_id = o.order_id WHERE o.transaction_nr = {transactionNr}", connection.Con);

            connection.Con.Open();

            DataTable dataTable = new DataTable();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd);
            dataAdapter.Fill(dataTable);

            int howManyRecords = Convert.ToInt32(dataTable.Rows.Count.ToString());
            for (int i = 0; i < howManyRecords; ++i)
            {
                DataRow row = dataTable.Rows[i];
                prdLst.Items.Add(row["name"] + ", " + row["how_many"] + "szt.");
            }

            connection.Con.Close();
        }
    }
}
