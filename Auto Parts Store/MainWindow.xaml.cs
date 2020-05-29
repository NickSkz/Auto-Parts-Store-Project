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
        private string selectedCategory;
        private Dictionary<string, int> cart;
        private double totalCost;

        public Sign()
        {
            InitializeComponent();
            connection = new DBConnect();
            currUserTxt.Content = CurrentUser.name + " " + CurrentUser.last_name;
            showhigherCategories();
            cart = new Dictionary<string, int>();
        }

        private void showhigherCategories()
        {
            if (connection.Con.State == ConnectionState.Open) return;

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

        
        private void showCategories(string higherCategory)
        {
            if (connection.Con.State == ConnectionState.Open) return;

            string query = $"SELECT c.name FROM category c INNER JOIN highercategory hc ON c.highercategory_id = hc.highercategory_id WHERE hc.name = '{higherCategory}'";
            MySqlCommand cmd = new MySqlCommand(query, connection.Con);

            connection.Con.Open();

            DataTable dataTable = new DataTable();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd);
            dataAdapter.Fill(dataTable);

            int howManyRecords = Convert.ToInt32(dataTable.Rows.Count.ToString());
            for(int i = 0; i < howManyRecords; ++i)
            {
                DataRow row = dataTable.Rows[i];
                catLst.Items.Add(row["name"]);
            }

            connection.Con.Close();
        }

        private void showCars()
        {
            if (connection.Con.State == ConnectionState.Open) return;

            string query = $"SELECT brand, model, engine FROM car";
            MySqlCommand cmd = new MySqlCommand(query, connection.Con);

            connection.Con.Open();

            DataTable dataTable = new DataTable();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd);
            dataAdapter.Fill(dataTable);

            int howManyRecords = Convert.ToInt32(dataTable.Rows.Count.ToString());
            for (int i = 0; i < howManyRecords; ++i)
            {
                DataRow row = dataTable.Rows[i];
                carLst.Items.Add(row["brand"] + ", " + row["model"] + ", " + row["engine"]);
            }

            connection.Con.Close();
        }

        private void showProducts(string category, int car_id)
        {
            if (connection.Con.State == ConnectionState.Open) return;

            string query = @$"SELECT p.name, c.name AS cname, p.price, p.availible_count, p.discount, m.country FROM product_car pc

                            INNER JOIN car cr
                            ON pc.car_id = cr.car_id

                            INNER JOIN product p
                            ON pc.product_id = p.product_id

                            INNER JOIN category_producent cp
                            ON p.categoryprod_id = cp.categoryprod_id

                            INNER JOIN category c
                            ON cp.category_id = c.category_id

                            INNER JOIN manufacturer m
                            ON cp.manufacturer_id = m.manufacturer_id

                            WHERE c.name = '{category}' AND cr.car_id = {car_id}";

            MySqlCommand cmd = new MySqlCommand(query, connection.Con);

            connection.Con.Open();

            DataTable dataTable = new DataTable();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd);
            dataAdapter.Fill(dataTable);

            int howManyRecords = Convert.ToInt32(dataTable.Rows.Count.ToString());
            for (int i = 0; i < howManyRecords; ++i)
            {
                DataRow row = dataTable.Rows[i];

                if(!row.IsNull("discount"))
                    productLst.Items.Add(row["name"] + ", " + row["price"] + "zł;  " + row["cname"] + ",  " + row["country"] + ",  " + row["availible_count"] + "szt.,  discount: " + row["discount"]);
                else
                    productLst.Items.Add(row["name"] + ", " + row["price"] + "zł;  " + row["cname"] + ",  " + row["country"] + ",  " + row["availible_count"] + "szt.,  discount: " + "0%");
            }   

            connection.Con.Close();
        }

        private void higherCatLst_DoubleClick(object sender, MouseButtonEventArgs e)
        {
            catLst.Items.Clear();
            carLst.Items.Clear();
            showCategories(higherCatLst.SelectedItem.ToString());
        }

        private void catLst_DoubleClick(object sender, MouseButtonEventArgs e)
        {
            carLst.Items.Clear();
            selectedCategory = catLst.SelectedItem.ToString();
            showCars();
        }

        private void carLst_DoubleClick(object sender, MouseButtonEventArgs e)
        {
            productLst.Items.Clear();
            showProducts(selectedCategory, carLst.SelectedIndex + 1);
        }

        private void productLst_DoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (connection.Con.State == ConnectionState.Open) return;

            WieViel wieViel= new WieViel();
            wieViel.ShowDialog();

            if (WieViel.howMany == 0) return;

            int firstCommaIdx = productLst.SelectedItem.ToString().IndexOf(",", StringComparison.Ordinal);
            int secondCommaIdx = productLst.SelectedItem.ToString().IndexOf("", StringComparison.Ordinal);
            string productName = productLst.SelectedItem.ToString().Substring(0, firstCommaIdx);


            string query = $"SELECT price FROM product WHERE name = '{productName}'";
            MySqlCommand cmd = new MySqlCommand(query, connection.Con);

            connection.Con.Open();

            DataTable dataTable = new DataTable();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd);
            dataAdapter.Fill(dataTable);

            int howManyRecords = Convert.ToInt32(dataTable.Rows.Count.ToString());
            if (howManyRecords != 1) return;

            DataRow row = dataTable.Rows[0];
            decimal priceDecimal = (decimal)row["price"];
            totalCost += WieViel.howMany * (double)priceDecimal;

            connection.Con.Close();

            cart.Add(productName, WieViel.howMany);
            cartLst.Items.Add(productName + ", " + WieViel.howMany + "szt.");
            totalCostLbl.Content = totalCost.ToString() + "PLN";
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (connection.Con.State == ConnectionState.Open) return;

            string queryLastTran = "SELECT transaction_nr FROM orderr ORDER BY transaction_nr DESC LIMIT 1";
            MySqlCommand cmd = new MySqlCommand(queryLastTran, connection.Con);

            connection.Con.Open();

            DataTable dataTable = new DataTable();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd);
            dataAdapter.Fill(dataTable);

            int howManyRecords = Convert.ToInt32(dataTable.Rows.Count.ToString());
            if (howManyRecords != 1) return;

            DataRow row = dataTable.Rows[0];
            int transNR = (int)row["transaction_nr"] + 1;


            string query = $"INSERT INTO orderr(customer_id, transaction_nr, if_paid, if_sent, order_date) VALUES ({CurrentUser.id}, {transNR}, {0}, {0}, '{DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")}')";
            cmd.CommandText = query;
            cmd.ExecuteReader();
            int orderId = (int)cmd.LastInsertedId;

            connection.Con.Close();
            dataTable.Dispose();
            dataAdapter.Dispose();


            foreach (KeyValuePair<string, int> item in cart)
            {
                connection.Con.Open();

                string queryGetId = $"SELECT product_id FROM product WHERE name = '{item.Key}'";
                cmd.CommandText = queryGetId;

                DataTable data2Table = new DataTable();
                MySqlDataAdapter data2Adapter = new MySqlDataAdapter(cmd);
                data2Adapter.SelectCommand = cmd;
                data2Adapter.Fill(data2Table);

                int howManyRecords2 = Convert.ToInt32(data2Table.Rows.Count.ToString());
                if (howManyRecords2 != 1) return;

                DataRow row2 = data2Table.Rows[0];
                int prodId = (int)row2["product_id"];


                string finalQuery = $"INSERT INTO order_product(order_id, product_id, how_many) VALUES ({orderId}, {prodId}, {item.Value})";
                cmd.CommandText = finalQuery;
                cmd.ExecuteReader();

                dataTable.Dispose();
                dataAdapter.Dispose();
                connection.Con.Close();
            }

            MessageBox.Show("Order made succesfuly :)", "Operation Succesful", MessageBoxButton.OK, MessageBoxImage.Information);
            cart.Clear();
            cartLst.Items.Clear();
            catLst.Items.Clear();
            carLst.Items.Clear();
            productLst.Items.Clear();
        }

        private void productLst_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            WieViel wieViel = new WieViel();
            wieViel.ShowDialog();

            if (WieViel.howMany == 0) return;

            int firstCommaIdx = productLst.SelectedItem.ToString().IndexOf(",", StringComparison.Ordinal);
            int secondCommaIdx = productLst.SelectedItem.ToString().IndexOf("", StringComparison.Ordinal);
            string productName = productLst.SelectedItem.ToString().Substring(0, firstCommaIdx);


            string query = $"SELECT price FROM product WHERE name = '{productName}'";
            MySqlCommand cmd = new MySqlCommand(query, connection.Con);

            connection.Con.Open();

            DataTable dataTable = new DataTable();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd);
            dataAdapter.Fill(dataTable);

            int howManyRecords = Convert.ToInt32(dataTable.Rows.Count.ToString());
            if (howManyRecords != 1) return;

            DataRow row = dataTable.Rows[0];
            decimal priceDecimal = (decimal)row["price"];
            totalCost += WieViel.howMany * (double)priceDecimal;

            connection.Con.Close();

            cart.Add(productName, WieViel.howMany);
            cartLst.Items.Add(productName + ", " + WieViel.howMany + "szt.");
            totalCostLbl.Content = totalCost.ToString() + "PLN";
        }

    }
}
