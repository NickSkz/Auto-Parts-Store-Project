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

namespace Auto_Parts_Store
{
    /// <summary>
    /// Interaction logic for WieViel.xaml
    /// </summary>
    public partial class WieViel : Window
    {
        public static int howMany;

        public WieViel()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            howMany = Int32.Parse(wieVielTxt.Text);
            this.Close();
        }
    }
}
