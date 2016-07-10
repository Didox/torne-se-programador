namespace ftp
{
	using System;
	using System.Configuration;
	using System.IO;
	using System.Web.UI;
	using System.Web.UI.HtmlControls;
	using System.Web.UI.WebControls;

	public class VerImagem2 : Page
	{
		protected Image imgView;
		protected HtmlTable tblDelDir;

		private void InitializeComponent()
		{
			base.Load += new EventHandler(this.Page_Load);
		}

		protected override void OnInit(EventArgs e)
		{
			this.InitializeComponent();
			base.OnInit(e);
		}

		private void Page_Load(object sender, EventArgs e)
		{
			string path = "";
			if (base.Request.QueryString["path"] != null)
			{
				path = base.Request.QueryString["path"].ToString().ToUpper();
			}
			Path.GetExtension(path).ToLower();
			path = AppDomain.CurrentDomain.BaseDirectory + ConfigurationSettings.AppSettings["dirMainImages"] + path;
			Stream stream = null;
			byte[] buffer = new byte[0x2710];
			string fileName = Path.GetFileName(path);
			try
			{
				stream = new FileStream(path, FileMode.Open, FileAccess.Read, FileShare.Read);
				long length = stream.Length;
				base.Response.ContentType = "application/octet-stream";
				base.Response.AddHeader("Content-Disposition", "attachment; filename=" + fileName);
				while (length > 0L)
				{
					if (base.Response.IsClientConnected)
					{
						int count = stream.Read(buffer, 0, 0x2710);
						base.Response.OutputStream.Write(buffer, 0, count);
						base.Response.Flush();
						buffer = new byte[0x2710];
						length -= count;
					}
					else
					{
						length = -1L;
					}
				}
			}
			catch (Exception exception)
			{
				base.Response.Write("Error : " + exception.Message);
			}
			finally
			{
				if (stream != null)
				{
					stream.Close();
					this.RegisterStartupScript("dowload", "<script>window.close();</script>");
					base.Response.End();
				}
			}
		}
	}
}

