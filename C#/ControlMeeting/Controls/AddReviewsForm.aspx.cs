using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Business;

namespace ControlMeeting.Controls
{
	public class AddReviewsForm : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label lblTitle;
		protected System.Web.UI.WebControls.TextBox txtReview;
		protected System.Web.UI.WebControls.RequiredFieldValidator rvfValida;
		protected System.Web.UI.WebControls.Button btnSave;
		private Business.BsUser usr;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			if( ! Business.BsUser.UserOn() )
			{
				Response.Write( "<script>alert( 'Sua sessão expirou!' );top.login();</script>" );
				Response.End();	
			}
			else usr = Business.BsUser.GetUserOn();

			if( ! IsPostBack )
				if( Request["idReview"] != null )
					txtReview.Text = new BsReviewForm(Convert.ToInt32(Request["idReview"]), new BsItemForm(Convert.ToInt32(Request["idItemForm"]), new BsForm(Convert.ToInt32(Request["idForm"])))).GetObject().Review;
		}

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void btnSave_Click(object sender, System.EventArgs e)
		{
			BsReviewForm rf = new BsReviewForm(Convert.ToInt32("0"+Request["idReview"]), new BsItemForm(Convert.ToInt32(Request["idItemForm"]), new BsForm(Convert.ToInt32(Request["idForm"]))));
			rf.Review = txtReview.Text;
			rf.User = usr;
			rf.SaveObject();
			RegisterClientScriptBlock( "ok", "<script>top.openReviewsForm( " + rf.ItemForm.Id + ", " + rf.ItemForm.Form.Id + ",'', 'none');top.closeLayerAlpha();</script>" );
		}
	}
}
