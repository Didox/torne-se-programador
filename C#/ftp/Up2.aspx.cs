namespace FTP
{
	using System;
	using System.Configuration;
	using System.IO;
	using System.Web.UI;
	using System.Web.UI.HtmlControls;
	using System.Web.UI.WebControls;

	public class Up2 : Page
	{
		protected Button btnEnviar;
		protected RequiredFieldValidator RequiredFieldValidator1;
		protected HtmlInputFile UPArq;

		private void btnEnviar_Click(object sender, EventArgs e)
		{
			string str = base.Request["dir"].ToString().Trim();
			try
			{
				string filename = AppDomain.CurrentDomain.BaseDirectory + ConfigurationSettings.AppSettings["dirMainImagesAdm"] + str + "/" + Path.GetFileName(this.UPArq.PostedFile.FileName);
				string oldValue = base.Request["main"].Trim().ToLower() + "/";
				string str4 = str.ToLower().Replace(oldValue, "");
				filename = base.Server.UrlDecode(filename.Trim());
				this.UPArq.PostedFile.SaveAs(filename);
				try
				{
					oldValue = oldValue.Replace( "/","" );
					string path = (AppDomain.CurrentDomain.BaseDirectory + ConfigurationSettings.AppSettings["dirMainImagesAdm"] + str + "/").Replace(oldValue, "937//"  + ConfigurationSettings.AppSettings[oldValue] + "//");
					if (!Directory.Exists(path))
					{
						Directory.CreateDirectory(path);
					}
					File.Copy(filename, filename.Replace(oldValue, "937//"  + ConfigurationSettings.AppSettings[oldValue] + "//"),true);
				}
				catch( Exception err )
				{
					throw err;
				}
				this.Page.RegisterStartupScript("alert", "<script>alert('Upload Concluido.');window.parent.location='upload.aspx?dirUser=" + base.Request["main"].Trim() + "&dir=" + str4 + "';window.close()</script>");
			}
			catch (Exception exception)
			{
				this.Page.RegisterStartupScript("alert", "<script>alert('N\x00e3o foi poss\x00edvel executar o Upload.\\n" + exception.Message.ToString().Replace("\"", "") + "')</script>");
			}
		}

		private void InitializeComponent()
		{
			this.btnEnviar.Click += new EventHandler(this.btnEnviar_Click);
			base.Load += new EventHandler(this.Page_Load);
		}

		protected override void OnInit(EventArgs e)
		{
			this.InitializeComponent();
			base.OnInit(e);
		}

		private void Page_Load(object sender, EventArgs e)
		{
		}
	}
}

