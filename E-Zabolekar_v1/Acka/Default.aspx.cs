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
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ispolni();
                ispolniNovosti();

            }
            if (Session["korisnik"] != null)
            {
                string korisnik = (string)Session["korisnik"];
                //((Label)this.Master.FindControl("lblLogged")).Text = korisnik;
                //     ((Button)this.Master.FindControl("loginn")).Visible = false;
            }
        }

        private void ispolniNovosti()
        {
            SqlConnection konekcija = new SqlConnection();
            konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["mojaKonekcija"].ConnectionString;
            string sqlString = "SELECT top 5 * FROM Novosti order by datum desc ";
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            SqlDataAdapter adapter = new SqlDataAdapter(komanda);
            DataSet ds = new DataSet();
            string html = "";
            string naslov = "";
            try
            {
                konekcija.Open();
                adapter.Fill(ds, "Termin");
         
                foreach (DataTable table in ds.Tables)
                {
                    foreach (DataRow row in table.Rows)
                    {
                        naslov = row["naslov"].ToString();

                        html = html + " <button type='button' class='list-group-item' style='height:30px'><a href='news.aspx' style='color:black'><i class='fa fa-chevron-right'></i> " + naslov + "</a></button> ";
          
                    
                    }
                }

                placeZanovosti.Controls.Add(new LiteralControl(html));
                
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

        private void ispolni()
        {
            SqlConnection konekcija = new SqlConnection();
            konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["mojaKonekcija"].ConnectionString;
            string sqlString = "SELECT * FROM Korisnik";
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            SqlDataAdapter adapter = new SqlDataAdapter(komanda);
            DataSet ds = new DataSet();

            try
            {
                konekcija.Open();
                adapter.Fill(ds, "Korisnici");
                GridView1.DataSource = ds;
                GridView1.DataBind();
                //    lblPoraka.Text = ds.Tables[0].Rows[0]["broj"].ToString();
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

        //protected void logout(object sender, EventArgs e)
        //{
        //    Session.Abandon();
        //    Response.Redirect("Default.aspx");
        //}
        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    SqlConnection konekcija = new SqlConnection();
        //    konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["mojaKonekcija"].ConnectionString;
        //    SqlCommand komanda = new SqlCommand();
        //    komanda.Connection = konekcija;
        //    komanda.CommandText = "INSERT INTO Korisnik (ime_prezime, user_name, password,is_admin,telefon,lokacija)" +
        //        "VALUES(@ime_prezime, @user_name, @password,@is_admin,@telefon,@lokacija) ";
        //    komanda.Parameters.AddWithValue("@ime_prezime", TextBox1.Text);
        //    komanda.Parameters.AddWithValue("@user_name", TextBox2.Text);
        //    komanda.Parameters.AddWithValue("@password", TextBox3.Text);
        //    komanda.Parameters.AddWithValue("@is_admin", TextBox4.Text);
        //    komanda.Parameters.AddWithValue("@telefon", TextBox5.Text);
        //    komanda.Parameters.AddWithValue("@lokacija", TextBox6.Text);


        //    try
        //    {
        //        konekcija.Open();
        //        komanda.ExecuteNonQuery();
        //    }
        //    catch (Exception err)
        //    {

        //        lblPoraka.Text = err.Message;
        //    }
        //    finally
        //    {
        //        konekcija.Close();
        //    }
        //    ispolni();
        //}
    }
}