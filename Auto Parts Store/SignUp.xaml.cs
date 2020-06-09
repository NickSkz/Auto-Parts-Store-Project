using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Auto_Parts_Store
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {

        private DBConnect connection;

        public MainWindow()
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

            int customerId = -1;

            try
            {
                customerId = insertCustomer(insertAdressRecords());
            }
            catch(MySqlException ex)
            {
                if (ex.Code == 1169)
                {
                    MessageBox.Show("Credentials already in use!", "Try again!", MessageBoxButton.OK, MessageBoxImage.Error);
                }
                return;
            }

            CurrentUser.id = customerId;
            CurrentUser.name = nameTxt.Text;
            CurrentUser.last_name = LastNTxt.Text;
            CurrentUser.e_mail = emailTxt.Text;
            CurrentUser.password = passBx.Password;

            Sign mainWindow = new Sign();
            mainWindow.Show();
            this.Close();
        }

        private Boolean samePassword(string pass0, string pass1)
        {
            return pass0.Equals(pass1) ? true : false;
        }

        private int insertAdressRecords()
        {
            MySqlCommand cmd = new MySqlCommand($"INSERT INTO deliveryadress(country, city, street, building_number, apartament, postal_code) " +
                $"VALUES ('{countryTxt.Text}', '{cityTxt.Text}', '{streetTxt.Text}', '{buildingNrTxt.Text}', '{apartamentTxt.Text}', '{postalTxt.Text}')", connection.Con);

            connection.Con.Open();

            cmd.ExecuteReader();
            int lastAdressId = (int)cmd.LastInsertedId;

            connection.Con.Close();

            return lastAdressId;
        }

        private int insertCustomer(int adressId)
        {
            MySqlCommand cmd = new MySqlCommand($"INSERT INTO customer(adress_id, name, last_name, e_mail, password, phone, system_rank) " +
                $"VALUES ('{adressId}', '{nameTxt.Text}', '{LastNTxt.Text}', '{emailTxt.Text}', '{DBConnect.Encrypt(passBx.Password)}', '{phoneTxt.Text}', 'USER')", connection.Con);

            connection.Con.Open();

            int lastCustomerId = 1;

            try
            {
                cmd.ExecuteReader();
                lastCustomerId = (int)cmd.LastInsertedId;
            }
            catch (Exception e)
            {
                cmd.CommandText = $"DELETE FROM deliveryadress WHERE deliveryadress_id = {adressId}";
                cmd.ExecuteReader();
                connection.Con.Close();

                throw e;
            }

            connection.Con.Close();

            return lastCustomerId;
        }


        

    }
}