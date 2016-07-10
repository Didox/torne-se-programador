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
using System.IO;

namespace ConversorFLV
{
	public class WebForm1 : System.Web.UI.Page
	{
		private void Page_Load(object sender, System.EventArgs e)
		{
			string folderThumb = Server.MapPath( "~/img/" );

			DirectoryInfo d = new DirectoryInfo( folderThumb );

			foreach( FileInfo f in d.GetFiles() )
			{
				resizeImage( 90, 75, folderThumb, f.Name );
				resizeImage( 70, 55, folderThumb, f.Name  );
				resizeImage( 420, 328, folderThumb, f.Name );
				resizeImage( 200, 200, folderThumb, f.Name );
			}
		}
	
		public void resizeImage( int width, int height, string path, string fileName )
		{
			ASPJPEGLib.ASPJpegClass objJpg = new ASPJPEGLib.ASPJpegClass();
			objJpg.Open( path + fileName );
			objJpg.Width = width;
			objJpg.Height = height;		
				
			objJpg.Save( path + "img/" + width + "x" + height + "_" + fileName );
		}

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			InitializeComponent();
			base.OnInit(e);
		}
		private void InitializeComponent()
		{    
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
	}
}
