using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Acka
{
    public partial class AdminMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string a = "";

            if (Session["korisnik"] == null)
            {
                a = "<ul class='nav navbar-nav navbar-right'><li ><a type='button' id='loginn' href='Login.aspx'><span class='glyphicon glyphicon-log-in'></span> Најава</a></li><li ><asp:Label ID='lblLogged' runat='server' Text=''></asp:Label></li></ul>";
            }
            else
            {
                a = "<ul class='nav navbar-nav navbar-right'><li ><a id='logoutt' href='Logout.aspx' ><span class='glyphicon glyphicon-log-in'></span> Одјави се</a></li></ul>";

            }
            najava.Controls.Add(new LiteralControl(a));
        }
    }
}