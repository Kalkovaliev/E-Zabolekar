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
    public partial class MoiTerminiAdmin : System.Web.UI.Page
    {

        private string korisnik;
        private string datum;
        private string od;
        private string dot;
        private int zabolekar_id,termin_id;
        private int korisnikid;
        private DateTime today;
        protected void Page_Load(object sender, EventArgs e)
        {

            //if (Session["korisnik"] == null)
            //{
            //    Response.Redirect("zazakazenipregledi.aspx");
            //}
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

        private void ispolniZakazeni(DateTime daticka)
        {
            SqlConnection konekcija = new SqlConnection();
            konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["mojaKonekcija"].ConnectionString;
            string sqlString = "SELECT * FROM Termin where zabolekar_id='" + zabolekar_id + "'" + "and datum='" + daticka + "'" + "order by datum asc";
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
                    string aa = Convert.ToString(daticka);
                    string[] data = aa.Split(' ');
                    poraka.Text = "На ден " + data[0] + " немате закажени термини!!";

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
                        termin_id = Convert.ToInt32(row["termin_id"].ToString());
                        od = row["od"].ToString();
                        dot = row["do"].ToString();
                        korisnikid = Convert.ToInt32(row["korisnik_id"].ToString());
                        string[] data = datum.Split(' ');


                        html = html + "<div class='list-group'><button  onclick='najdi(" + termin_id + "," + korisnikid + "," + zabolekar_id + ")'  type='button' class='list-group-item' style='width:550px;background:#e5f4f3;height:50px;' data-toggle='modal' data-target='#myModal'>" + "<b>Датум: </b>" + data[0] + "  " + "  " + "&nbsp;&nbsp;&nbsp;&nbsp;<b>Термин:</b> " + od + "-" + dot + "&nbsp;&nbsp;&nbsp;&nbsp;<b>Пациент:</b> " + getPacientName(korisnikid) + "</button></div>";
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
            }
        }

        private void getProfileInfo()
        {
            string korisnik = (string)Session["korisnik"];
            SqlConnection konekcija = new SqlConnection();
            konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["mojaKonekcija"].ConnectionString;
            string sqlString = "SELECT * FROM Zabolekarr where user_name='" + korisnik + "'";
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            SqlDataAdapter adapter = new SqlDataAdapter(komanda);
            DataSet ds = new DataSet();

            try
            {
                konekcija.Open();
                adapter.Fill(ds, "Korisnik");
                zabolekar_id = Convert.ToInt32(ds.Tables[0].Rows[0]["zabolekar_id"].ToString());


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
        protected void Calendar3_SelectionChanged(object sender, EventArgs e)
        {
            DateTime peroCvrc = Calendar3.SelectedDate;
            getProfileInfo();
            ispolniZakazeni(peroCvrc);
        }

        private string getPacientName(int idPacient)
        {
            string rez = "";
            SqlConnection konekcija = new SqlConnection();
            konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["mojaKonekcija"].ConnectionString;
            string sqlString = "SELECT * FROM Korisnik where korisnik_id='" + idPacient + "'";
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

        private void brisiTermin()
        {
            int aaaaaaaaaaa = Convert.ToInt32(hidden2.Value);
            SqlConnection konekcija = new SqlConnection();
            konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["mojaKonekcija"].ConnectionString;
            SqlCommand komanda = new SqlCommand();
            komanda.Connection = konekcija;
            komanda.CommandText = "DELETE from Termin WHERE termin_id='"+aaaaaaaaaaa+"'";

          

            try
            {
                konekcija.Open();
                komanda.ExecuteNonQuery();

            }
            catch (Exception err)
            {

                poraka.Text = err.Message;
            }
            finally
            {
                konekcija.Close();
            }




        } 

        protected void zavrsiPregled_click(object sender, EventArgs e)
        {
            //var zadID = Convert.ToInt16(zabolekaridd.Text);
            //int korID = Convert.ToInt16(korisnikidd.Text);
            int rez1 = Convert.ToInt32(hidden.Value);
            int rez2 = Convert.ToInt32(hidden1.Value);
                //  rez = Convert.ToInt32(zabolekaridd.Text);
          
            SqlConnection konekcija = new SqlConnection();
            konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["mojaKonekcija"].ConnectionString;
            SqlCommand komanda = new SqlCommand();
            komanda.Connection = konekcija;


            komanda.CommandText = "INSERT INTO GotoviPreglediii (naslov, opispregled, zabolekar_id,korisnik_id,datum)" +
                "VALUES(@naslov, @opispregled, @zabolekar_id,@korisnik_id,@datum) ";
           string data=DateTime.Today.ToString("dd-MM-yyyy");
            komanda.Parameters.AddWithValue("@naslov", naslov.Text);
            komanda.Parameters.AddWithValue("@opispregled",opis.Text );
            komanda.Parameters.AddWithValue("@zabolekar_id", rez1);
            komanda.Parameters.AddWithValue("@korisnik_id", rez2);
            komanda.Parameters.AddWithValue("@datum", data);
       
            try
            {
                konekcija.Open();
                komanda.ExecuteNonQuery();

            }
            catch (Exception err)
            {

                poraka.Text = err.Message;
            }
            finally
            {
                konekcija.Close();
            }




            brisiTermin();
            Response.Redirect("MoiTerminiAdmin.aspx");
        }




    }
}