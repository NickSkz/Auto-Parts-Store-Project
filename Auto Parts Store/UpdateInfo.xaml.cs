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
    /// Interaction logic for UpdateInfo.xaml
    /// </summary>
    public partial class UpdateInfo : Window
    {
        DBConnect connection;

        public UpdateInfo()
        {
            InitializeComponent();
            connection = new DBConnect();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (nameTxt.Text.Equals("")) return;
            if (LastNTxt.Text.Equals("")) return;
            if (emailTxt.Text.Equals("")) return;
            if (passBx.Password.Equals("")) return;
            if (pass2Bx.Password.Equals("")) return;
            if (phoneTxt.Text.Equals("")) return;
            if (countryTxt.Text.Equals("")) return;
            if (cityTxt.Text.Equals("")) return;
            if (streetTxt.Text.Equals("")) return;
            if (buildingNrTxt.Text.Equals("")) return;
            if (apartamentTxt.Text.Equals("")) return;
            if (postalTxt.Text.Equals("")) return;

            if (!samePassword(passBx.Password, pass2Bx.Password))
                return;


            MySqlCommand cmd = new MySqlCommand(@$"SELECT ad.adress_id FROM deliveryadress ad 
                                                  INNER JOIN customer c
                                                  ON c.adress_id = ad.adress_id
                                                  WHERE c.customer_id = {CurrentUser.id}", connection.Con);

            connection.Con.Open();

            DataTable dataTable = new DataTable();
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter(cmd);
            dataAdapter.Fill(dataTable);

            int howManyRecords = Convert.ToInt32(dataTable.Rows.Count.ToString());
            if (howManyRecords != 1) return;

            DataRow row = dataTable.Rows[0];
            int adressID = (int)row["adress_id"];


            connection.Con.Close();
            dataTable.Dispose();
            dataAdapter.Dispose();

            MySqlCommand cmd2 = new MySqlCommand(@$"UPDATE deliveryadress
                                                  SET country = '{countryTxt.Text}', city  ='{cityTxt.Text}', street = '{streetTxt.Text}', building_number = '{buildingNrTxt.Text}', apartament = {apartamentTxt.Text}, postal_code = '{postalTxt.Text}' 
                                                  WHERE adress_id = {adressID}", connection.Con);

            connection.Con.Open();

            cmd2.ExecuteReader();

            connection.Con.Close();



            MySqlCommand cmd3 = new MySqlCommand(@$"UPDATE customer
                                                  SET name = '{nameTxt.Text}', last_name  = '{LastNTxt.Text}', e_mail = '{emailTxt.Text}', password = '{passBx.Password}', phone = '{phoneTxt.Text}' 
                                                  WHERE customer_id = {CurrentUser.id}", connection.Con);

            connection.Con.Open();

            try
            {
                cmd3.ExecuteReader();
            }
            catch(MySqlException ex)
            {
                if (ex.Code == 1169)
                {
                    MessageBox.Show("Credentials already in use!", "Try again!", MessageBoxButton.OK, MessageBoxImage.Error);
                }
                connection.Con.Close();
                return;
            }

            connection.Con.Close();


            CurrentUser.name = nameTxt.Text;
            CurrentUser.last_name = LastNTxt.Text;
            CurrentUser.e_mail = emailTxt.Text;
            CurrentUser.password = passBx.Password;


            this.Close();
        }

        private Boolean samePassword(string pass0, string pass1)
        {
            return pass0.Equals(pass1) ? true : false;
        }
    }
}
