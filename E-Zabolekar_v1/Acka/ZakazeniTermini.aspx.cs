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
    public partial class ZakazeniTermini : System.Web.UI.Page
    {

        private string korisnik;
        private string datum;
        private string od;
        private string dot;
        private int korisnik_id;
        private int zabolekarid;
        private DateTime today;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["korisnik"] == null)
            {
                Response.Redirect("zazakazenipregledi.aspx");
            }
            if (!IsPostBack)
            {
                if (Session["korisnik"] != null)
                {
                    korisnik = (string)Session["korisnik"];
                }
                today = DateTime.Today;
                getProfileInfo();
                ispolniZakazeni(today);

            }


        }
        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            DateTime peroCvrc = Calendar2.SelectedDate;
            getProfileInfo();
            ispolniZakazeni(peroCvrc);
        }

        private void ispolniZakazeni(DateTime daticka)
        {
            SqlConnection konekcija = new SqlConnection();
            konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["mojaKonekcija"].ConnectionString;
            string sqlString = "SELECT * FROM Termin where korisnik_id='" + korisnik_id + "'" + "and datum='" + daticka + "'" + "order by datum asc";
          
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            SqlDataAdapter adapter = new SqlDataAdapter(komanda);
            DataSet ds = new DataSet();
            string html = "";
            try
            {
                konekcija.Open();
                adapter.Fill(ds, "Termin");
                //datum = ds.Tables[0].Rows[0]["datum"].ToString();
                //od = ds.Tables[0].Rows[0]["od"].ToString();
                //dot = ds.Tables[0].Rows[0]["do"].ToString();
                //zabolekarid = Convert.ToInt32(ds.Tables[0].Rows[0]["zabolekar_id"].ToString());

                if (ds.Tables.Count == 1)
                {
                    greska.Visible = true;
                    string aa =Convert.ToString(daticka);
                    string[] data = aa.Split(' ');
                    poraka.Text = "На ден: "+data[0]+" немате закажани термини!!";
                
                }
                else
                {
                    greska.Visible = false;
                    poraka.Text = "";
                }
                foreach (DataTable table in ds.Tables)
                {
                    foreach (DataRow row in table.Rows)
                    {
                        greska.Visible = false;
                        poraka.Text = "";
                        datum = row["datum"].ToString();
                        od  = row["od"].ToString();
                        dot = row["do"].ToString();
                        zabolekarid = Convert.ToInt32(row["zabolekar_id"].ToString());
                        string[] data = datum.Split(' ');
                        html = html + "<div class='list-group'><button type='button' class='list-group-item' style='width:550px;background:#e5f4f3;height:50px;'>" + "<b>Датум: </b>" + data[0] + "  " + "  " + "&nbsp;&nbsp;&nbsp;&nbsp;<b>Термин:</b> " + od + "-" + dot + "&nbsp;&nbsp;&nbsp;&nbsp;<b>Заболекар:</b> " + getZabolekarName(zabolekarid) + "</button></div>";

                   //     html = html + "  <div class='list-group'> <button type='button  class='list-group-item'>  <div class='row-content'><h4 class='list-group-item-heading'>" + "<b>Датум: </b>" + data[0] + "  " + "  " + "&nbsp;&nbsp;&nbsp;&nbsp;<b>Термин:</b> " + od + "-" + dot + "&nbsp;&nbsp;&nbsp;&nbsp;<b>Заболекар:</b> " + getZabolekarName(zabolekarid) + "</h4> </div></div><div class='list-group-separator'></button> </div>";
                    }
                }

                zakazanitermini.Controls.Add(new LiteralControl(html));
                ViewState["dataset"] = ds;
            }
            catch (Exception err)
            {

            }
            finally
            {
                konekcija.Close();
                Calendar2.SelectedDates.Clear();
            }
        }

        private void getProfileInfo()
        {
            string korisnik = (string)Session["korisnik"];
            SqlConnection konekcija = new SqlConnection();
            konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["mojaKonekcija"].ConnectionString;
            string sqlString = "SELECT * FROM Korisnik where user_name='" + korisnik + "'";
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            SqlDataAdapter adapter = new SqlDataAdapter(komanda);
            DataSet ds = new DataSet();

            try
            {
                konekcija.Open();
                adapter.Fill(ds, "Korisnik");
                korisnik_id = Convert.ToInt32(ds.Tables[0].Rows[0]["korisnik_id"].ToString());


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
        private string getZabolekarName(int idZabolekar)
        {
            string rez = "";
            SqlConnection konekcija = new SqlConnection();
            konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["mojaKonekcija"].ConnectionString;
            string sqlString = "SELECT * FROM Zabolekarr where zabolekar_id='" + idZabolekar + "'";
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            SqlDataAdapter adapter = new SqlDataAdapter(komanda);
            DataSet ds = new DataSet();

            try
            {
                konekcija.Open();
                adapter.Fill(ds, "Korisnik");
                rez = ds.Tables[0].Rows[0]["ime_prezime"].ToString();


                ViewState["dataset"] = ds;
            }
            catch (Exception err)
            {

            }
            finally
            {
                konekcija.Close();
            }
            return rez;
        }



    }
}