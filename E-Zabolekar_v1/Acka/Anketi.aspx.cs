using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Acka
{
    public partial class Anketi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["korisnik"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
        protected void dodadiNovost(object sender, EventArgs e)
        {
            String data=Convert.ToString(DateTime.Today.ToString("dd-MM-yyyy"));
            SqlConnection konekcija = new SqlConnection();
            konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["mojaKonekcija"].ConnectionString;
            SqlCommand komanda = new SqlCommand();
            komanda.Connection = konekcija;
            komanda.CommandText = "INSERT INTO Novosti (naslov,opis,datum)" +
                "VALUES(@naslov,@opis, @datum) ";
            komanda.Parameters.AddWithValue("@naslov", txtNaslov.Text);
            komanda.Parameters.AddWithValue("@opis", txtOpis.Text);
           
            komanda.Parameters.AddWithValue("@datum", data);




            try
            {
                konekcija.Open();
                komanda.ExecuteNonQuery();


            }
            catch (Exception err)
            {

 
            }
            finally
            {
                konekcija.Close();
                txtNaslov.Text="";
                txtOpis.Text="";
            }
        }
    }
}