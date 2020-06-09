using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Data;

namespace Auto_Parts_Store
{
    /// <summary>
    /// Interaction logic for LogSign.xaml
    /// </summary>
    public partial class LogSign : Window
    {
        private DBConnect connection;

        public LogSign()
        {
            InitializeComponent();
            connection = new DBConnect();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {

            if (loginTxt.Equals("")) return;
            if (passTxt.Equals("")) return;


            MySqlCommand cmd = new MySqlCommand($"SELECT * FROM customer WHERE e_mail = '{loginTxt.Text}' AND password = '{DBConnect.Encrypt(passTxt.Password)}'" ,connection.Con);

            connection.Con.Open();

            DataTable dataTable = new DataTable();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd);
            dataAdapter.Fill(dataTable);

            int howManyRecords = Convert.ToInt32(dataTable.Rows.Count.ToString());
            if (howManyRecords == 1)
            {

                DataRow row = dataTable.Rows[0];

                CurrentUser.id = (int)row["customer_id"];
                CurrentUser.name = (string)row["name"];
                CurrentUser.last_name = (string)row["last_name"];
                CurrentUser.e_mail = (string)row["e_mail"];
                CurrentUser.password = (string)row["password"];
            }
            else
            {
                Console.WriteLine("Somethings wrang!");
                connection.Con.Close();
                return;
            }

            connection.Con.Close();

            Sign mainWindow = new Sign();
            mainWindow.Show();
            this.Close();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            MainWindow signUpWindow = new MainWindow();
            signUpWindow.Show();
            this.Close();
        }
    }
}
