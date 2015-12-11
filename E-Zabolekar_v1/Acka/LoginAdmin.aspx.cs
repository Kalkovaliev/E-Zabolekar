using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Acka
{
    public partial class LoginAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
             SqlConnection konekcija = new SqlConnection();
            konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["mojaKonekcija"].ConnectionString;
            string sqlString = "SELECT  COUNT(user_name)as broj FROM Zabolekarr WHERE user_name=@username AND password=@password";
            string sqlString1 = "SELECT is_admin FROM Zabolekarr WHERE user_name=@username AND password=@password";



            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            komanda.Parameters.AddWithValue("@username", txtUserName.Text);
            komanda.Parameters.AddWithValue("@password", txtPassword.Text);
            SqlDataAdapter adapter = new SqlDataAdapter(komanda);
            DataSet ds = new DataSet();
            SqlCommand komanda1 = new SqlCommand(sqlString1, konekcija);
            komanda1.Parameters.AddWithValue("@username", txtUserName.Text);
            komanda1.Parameters.AddWithValue("@password", txtPassword.Text);
            SqlDataAdapter adapter1 = new SqlDataAdapter(komanda1);
            DataSet ds1 = new DataSet();

            try
            {
                konekcija.Open();
                adapter.Fill(ds, "Zabolekarr");
                adapter1.Fill(ds1, "Zabolekarr");
                //GridView1.DataSource = ds;
                //GridView1.DataBind();
                //    lblPoraka.Text = ds.Tables[0].Rows[0]["broj"].ToString();
                int admin = Convert.ToInt32(ds1.Tables[0].Rows[0]["is_admin"].ToString());
                int br = Convert.ToInt32(ds.Tables[0].Rows[0]["broj"].ToString());


                if (br > 0)
                {


                    string korisnik;
                    if (Session["korisnik"] == null)
                    {
                        korisnik = "";
                    }
                    else
                    {
                        korisnik = (string)Session["korisnik"];

                    }
                    korisnik = txtUserName.Text;

                    Session["korisnik"] = korisnik;


                    if (admin == 1)
                    {
                        Response.Redirect("Defaultadmin.aspx");
                    }
                 

                }
                else
                {
                    Response.Redirect("About.aspx");
                }

                ViewState["dataset"] = ds;
            }
            catch (Exception err)
            {

            }
            finally
            {
                konekcija.Close();
            }
        
        }


    }
}