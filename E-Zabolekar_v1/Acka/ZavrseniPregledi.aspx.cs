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
    public partial class ZavrseniPregledi : System.Web.UI.Page, IPostBackEventHandler
    {
        private string korisnik;
        private string datum;
        private string od;
        private string opis,tt;
        private int e;
        private string naslovv;
        private int zabolekar_id, termin_id,gotov_id;
        private int korisnikid;
        private DateTime today;
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                //  Page.ClientScript.GetPostBackEventReference(Button1, "onclick");
                if (Session["korisnik"] != null)
                {
                    korisnik = (string)Session["korisnik"];
                }
                today = DateTime.Today;
                getProfileInfo();
                ispolniZavrseni(today);
            }
       
    
        }
        protected void Calendar4_SelectionChanged(object sender, EventArgs e)
        {
            DateTime peroCvrc = Calendar4.SelectedDate;
            getProfileInfo();
            ispolniZavrseni(peroCvrc);
        }

        private void ispolniZavrseni(DateTime daticka)
        {
            string niza = daticka.ToString();
            string[] nizi = niza.Split(' ');
            string[] nizi2 = nizi[0].Split('/');
            string konecen = nizi2[1] + "-" + nizi2[0] + "-" + nizi2[2];

            SqlConnection konekcija = new SqlConnection();
            konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["mojaKonekcija"].ConnectionString;
            string sqlString = "SELECT * FROM GotoviPreglediii where zabolekar_id='" + zabolekar_id + "'" + " and datum='" + konecen + "'" + "order by datum asc";

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
                    poraka.Text = "На ден "+data[0]+" немате завршени термини!!";

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
                        opis = row["naslov"].ToString();
                        gotov_id = Convert.ToInt32(row["gotov_id"].ToString());
                        //od = row["od"].ToString();
                        //dot = row["do"].ToString();
                        korisnikid = Convert.ToInt32(row["korisnik_id"].ToString());
                       // string[] data = datum.Split(' ');
                        //  onclick='najdi(" + gotov_id + "," + korisnikid + "," + zabolekar_id + ")'  data-toggle='modal' data-target='#myModal'

                        html = html + "<div class='list-group'><button  type='button' class='list-group-item' style='width:550px;background:#e5f4f3;height:50px;' onclick='najdi(" + gotov_id + "," + korisnikid + "," + zabolekar_id + ")'    >" + "<b>Датум: </b>" + datum + "  " + "  " + "&nbsp;&nbsp;&nbsp;&nbsp;<b>Наслов:</b> " + opis + "&nbsp;&nbsp;&nbsp;&nbsp;<b>Пациент:</b> " + getPacientName(korisnikid) + "</button></div>";
                    }
                }

                zavrsenipregledi.Controls.Add(new LiteralControl(html));
                
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




        public void RaisePostBackEvent(string eventArgument) {

            int idto = Convert.ToInt32(eventArgument);
            SqlConnection konekcija = new SqlConnection();
            konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["mojaKonekcija"].ConnectionString;
            string sqlString = "SELECT * FROM GotoviPreglediii where gotov_id='" + idto + "'";
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            SqlDataAdapter adapter = new SqlDataAdapter(komanda);
            DataSet ds = new DataSet();

            try
            {
                konekcija.Open();
                adapter.Fill(ds, "gotovii");
                string opiss = ds.Tables[0].Rows[0]["opispregled"].ToString();
                string naslovv = ds.Tables[0].Rows[0]["naslov"].ToString();

                naslovvv.Text = naslovv;
                opisPregled.Text = opiss;
                //Label5.Text = naslovv;
                //Label6.Text = opiss;
             //   this.Page_Load(null, null);
             //   ViewState["dataset"] = ds;
                string tt="<div class='panel panel-primary' style='width:500px'><div class='panel-heading'><h3 class=panel-title>Наслов: "+naslovv+"</h3></div><div class='panel-body'>Опис на прегледот:<br/>"+opiss+"</div></div>";
                zapregled.Controls.Add(new LiteralControl(tt));
                    
            }
            catch (Exception err)
            {

            }
            finally
            {
                konekcija.Close();
            }
        }


        //public  void getOpis(int idto)
        //{
           
        //    SqlConnection konekcija = new SqlConnection();
        //    konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["mojaKonekcija"].ConnectionString;
        //    string sqlString = "SELECT * FROM GotoviPreglediii where gotov_id='" + idto + "'";
        //    SqlCommand komanda = new SqlCommand(sqlString, konekcija);
        //    SqlDataAdapter adapter = new SqlDataAdapter(komanda);
        //    DataSet ds = new DataSet();

        //    try
        //    {
        //        konekcija.Open();
        //        adapter.Fill(ds, "gotovii");
        //        string opiss = ds.Tables[0].Rows[0]["opispregled"].ToString();
        //      string naslovv=  ds.Tables[0].Rows[0]["naslov"].ToString();

        //      naslovvv.Text = naslovv;
        //      opisPregled.Text = opiss;

        //        ViewState["dataset"] = ds;
        //    }
        //    catch (Exception err)
        //    {

        //    }
        //    finally
        //    {
        //        konekcija.Close();
        //    }
        
        //}


        private void getProfileInfo()
        {
            korisnik = (string)Session["korisnik"];
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

    }
}