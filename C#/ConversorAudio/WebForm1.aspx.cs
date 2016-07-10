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
using WMEncoderLib;
using WMPREVIEWLib;

namespace ConversorAudio
{
	public class WebForm1 : System.Web.UI.Page
	{
		private void Page_Load(object sender, System.EventArgs e)
		{
			WMEncoder encoder = new WMEncoder();

			WMEncProfile2 profile = new WMEncProfile2();
			profile.LoadFromFile( Server.MapPath( "~/scmeda.prx" ) );
									
			IWMEncSourceGroupCollection srcGrpColl = encoder.SourceGroupCollection;
			IWMEncSourceGroup srcGrp = srcGrpColl.Add("SingleEncode");
			srcGrp.set_Profile( profile );
		
			IWMEncAudioSource audio = (WMEncoderLib.IWMEncAudioSource )srcGrp.AddSource( WMENC_SOURCE_TYPE.WMENC_AUDIO );
			audio.SetInput( Server.MapPath( "~/cabeloEncolheu.wma" ) ,"","");
			audio.PreProcessPass = 0;

			IWMEncFile2 file =(IWMEncFile2) encoder.File;
			file.LocalFileName = Server.MapPath( "~/cabeloEncolheu.mp3" );
			
			encoder.PrepareToEncode(true);
			encoder.Start();
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
