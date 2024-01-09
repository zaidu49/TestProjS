using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestProjS {
	public partial class _Default : Page {
		protected void Page_Load(object sender, EventArgs e) {

		}
		//protected void btn_onclick(object sender, EventArgs e) {
		//	Response.Redirect("~/Contact");
		//}

		[WebMethod]
		public static string ScanResult(string parameter) {
			// Your server-side logic here
			return "Result from server: " + parameter;
		}

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            string inputValue = textInput.Value;
            Session["inputValue"] = inputValue;

            Response.Redirect("ScanResult.aspx"); 
        }
    }
}