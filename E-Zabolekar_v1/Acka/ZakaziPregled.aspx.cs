using System;
using System.Collections;
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
    public partial class ZakaziPregled : System.Web.UI.Page
    {
        private string korisnik;
        private int korisnikID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["korisnik"] == null)
            {
                Response.Redirect("zapregled.aspx");

            }
            else
            {
                korisnik = (string)Session["korisnik"];
                if (!IsPostBack)
                {
                    ispolniZabolekari();
                }

            }


        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            string ace = Convert.ToString(Calendar1.SelectedDate);
            string[] ace1 = ace.Split(' ');

            datum.Text = ace1[0];
        }

        private void getIDfromusername()
        {

            SqlConnection konekcija = new SqlConnection();
            konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["mojaKonekcija"].ConnectionString;
            string sqlString = "SELECT korisnik_ID FROM Korisnik where user_name='" + korisnik + "'";
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            SqlDataAdapter adapter = new SqlDataAdapter(komanda);
            DataSet ds = new DataSet();

            try
            {
                konekcija.Open();
                adapter.Fill(ds, "Korisnik");
                korisnikID = Convert.ToInt32(ds.Tables[0].Rows[0]["korisnik_ID"].ToString());
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

        private void ispolniZabolekari()
        {
            SqlConnection konekcija = new SqlConnection();
            konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["mojaKonekcija"].ConnectionString;
            string sqlString = "SELECT * FROM Zabolekarr";
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            SqlDataAdapter adapter = new SqlDataAdapter(komanda);
            DataSet ds = new DataSet();

            try
            {
                konekcija.Open();
                adapter.Fill(ds, "Zabolekari");
                zabolekari.DataSource = ds;
                zabolekari.DataBind();
                zabolekari.DataTextField = "ime_prezime";
                zabolekari.DataValueField = "zabolekar_ID";
                zabolekari.DataBind();

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

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            if (termini.SelectedIndex != -1 && datum.Text.Length != 0)
            {


                if (proverkaTermin())
                {
                    greska.Visible = true;
                    uspeh.Visible = false;
                    lblporaka.Text = "Терминот е зафатен, одберете друг термин!";
                }
                else
                {

                    getIDfromusername();
                    string termin = termini.SelectedItem.Text;
                    string[] niza = termin.Split(' ');

                    SqlConnection konekcija = new SqlConnection();
                    konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["mojaKonekcija"].ConnectionString;
                    SqlCommand komanda = new SqlCommand();
                    komanda.Connection = konekcija;
                    komanda.CommandText = "INSERT INTO Termin (korisnik_ID,zabolekar_ID,od, do, datum)" +
                        "VALUES(@korisnik_ID,@zabolekar_ID,@od, @do, @datum) ";
                    komanda.Parameters.AddWithValue("@korisnik_ID", korisnikID);
                    komanda.Parameters.AddWithValue("@zabolekar_ID", zabolekari.SelectedValue);
                    komanda.Parameters.AddWithValue("@od", niza[0]);
                    komanda.Parameters.AddWithValue("@do", niza[2]);
                    komanda.Parameters.AddWithValue("@datum", datum.Text);




                    try
                    {
                        konekcija.Open();
                        komanda.ExecuteNonQuery();


                    }
                    catch (Exception err)
                    {

                        lblporaka.Text = err.Message;
                    }
                    finally
                    {
                        konekcija.Close();
                    }

                    termini.ClearSelection();
                    datum.Text = "";
                    Calendar1.SelectedDates.Clear();
                    uspeh.Visible = true;
                    greska.Visible = false;
                    lblporakauspeh.Text = "Успешно закажан термин!";
                }
            }
            else
            {
                greska.Visible = true;
                uspeh.Visible = false;
                lblporaka.Text = "Не се внесени сите информации за прегледот!";

            }

        }

        private bool proverkaTermin()
        {
            bool a = true;
            SqlConnection konekcija = new SqlConnection();
            konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["mojaKonekcija"].ConnectionString;
            string sqlString = "SELECT od,datum FROM Termin";
            //    string sqlString1 = "SELECT datum FROM Termin";
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            //  SqlCommand komanda1 = new SqlCommand(sqlString1, konekcija);
            //SqlDataAdapter adapter = new SqlDataAdapter(komanda);
            //DataSet ds = new DataSet();

            try
            {
                konekcija.Open();
                //     adapter.Fill(ds, "Korisnik");

                //SqlDataReader pop = komanda1.ExecuteReader();
                ArrayList listaDatum = new ArrayList();
                //while (pop.Read())
                //{

                //    string data = pop["datum"].ToString();
                //    string[] niza = data.Split(' ');
                //    listaDatum.Add(niza[0]);


                //}


                SqlDataReader citaj = komanda.ExecuteReader();
                ArrayList lista = new ArrayList();
                while (citaj.Read())
                {
                    lista.Add(citaj["od"].ToString());

                    string data = citaj["datum"].ToString();
                    string[] niza = data.Split(' ');
                    string aa = niza[0];
                    listaDatum.Add(aa);


                }
                citaj.Close();
                if (lista.Count == 0)
                {
                  a = false;
                }
                
                bool t = true;
                bool r = true;
                int i, j;
                string aaa;
                for (i = 0; i < listaDatum.Count; i++)
                {
                     aaa = listaDatum[i].ToString();

                    if (aaa == datum.Text)
                    {

                        for (j = 0; j < lista.Count; j++)
                        {
                            string od = termini.SelectedItem.Text;
                            string[] odd = od.Split(' ');
                            string jod = lista[j].ToString();
                             aaa = listaDatum[j].ToString();
                            if (aaa == datum.Text)
                            {

                                if (lista[j].ToString() == odd[0])
                                {
                                    a = true;
                                   
                                    break;
                                     }
                                else
                                {
                                    a = false;
                                    //  j = lista.Count;
                                }
                            }
                        }
                      
                    }
              if (aaa!=datum.Text)
                    {
                        for (j = 0; j < lista.Count; j++)
                        {
                            string od = termini.SelectedItem.Text;
                            string[] odd = od.Split(' ');
                            string jod = lista[j].ToString();
                            aaa = listaDatum[j].ToString();
                            if (aaa == datum.Text)
                            {

                                if (lista[j].ToString() == odd[0])
                                {
                                    a = true;

                                    break;
                                }
                                else
                                {
                                    a = false;
                                    //  j = lista.Count;
                                }
                            }
                            else { a = false; }
                        }


                    }


                }

            }


            catch (Exception err)
            {

            }
            finally
            {
                konekcija.Close();
            }

            return a;

        }
    }
}