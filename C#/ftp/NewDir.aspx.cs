namespace FTP
{
	using System;
	using System.Configuration;
	using System.IO;
	using System.Web.UI;
	using System.Web.UI.WebControls;

	public class NewDir : Page
	{
		protected Button btnCriar;
		protected RequiredFieldValidator RequiredFieldValidator1;
		protected TextBox txtNomeDir;

		private void btnEnviar_Click(object sender, EventArgs e)
		{
			string str = this.txtNomeDir.Text.Replace("\"", "").Replace("'", "").Replace("/", "").Replace(@"\", "").Replace("?", "").Replace("*", "").Replace(":", "").Replace("<", "").Replace(">", "").Replace("|", "");
			if (str.Trim().ToLower() == base.Request["main"].Trim().ToLower())
			{
				str = str + "-";
			}
			string str2 = base.Request["dir"].ToString().Trim();
			try
			{
				string str3 = AppDomain.CurrentDomain.BaseDirectory + ConfigurationSettings.AppSettings["dirMain"] + str2 + "/" + str;
				string oldValue = base.Request["main"].Trim().ToLower() + "/";
				string str5 = (str2.ToLower().Replace(oldValue, "") + "/" + str).Trim();
				Directory.CreateDirectory(base.Server.UrlDecode(str3.Trim()));
				try
				{
					oldValue = oldValue.Replace( "/","" );
					Directory.CreateDirectory(base.Server.UrlDecode(str3.Replace(oldValue, "937//" + ConfigurationSettings.AppSettings[oldValue] + "//" ).Trim()));
				}
				catch( Exception err )
				{
					throw err;
				}
				this.Page.RegisterStartupScript("alert", "<script>window.parent.location='ftp.aspx?dirUser=" + base.Request["main"].Trim() + "&dir=" + str5 + "';window.close()</script>");
			}
			catch (Exception exception)
			{
				this.Page.RegisterStartupScript("alert", "<script>alert('N\x00e3o foi possivel Criar o Diret\x00f3rio.\\n " + exception.Message.ToString().Replace("\"", "").Replace(@"\", @"\\") + "')</script>");
			}
		}

		private void InitializeComponent()
		{
			this.btnCriar.Click += new EventHandler(this.btnEnviar_Click);
		}

		protected override void OnInit(EventArgs e)
		{
			this.InitializeComponent();
			base.OnInit(e);
		}
	}
}

