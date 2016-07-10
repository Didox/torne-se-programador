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
using System.Configuration;
using System.IO;
using Business;

namespace ControlMeeting.Controls
{
	public class formServices : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label lblTitle;
		protected System.Web.UI.WebControls.Button btnGravar;
		protected System.Web.UI.HtmlControls.HtmlTable tbFormMount;
		private Business.BsForm form;
		private Business.BsFolder folder;
		private Business.BsItemForm item;
		protected System.Web.UI.WebControls.Button btnAnexar;
		protected System.Web.UI.HtmlControls.HtmlTable tbAnexo;
		protected System.Web.UI.HtmlControls.HtmlTableRow trAnexos;
		protected System.Web.UI.HtmlControls.HtmlInputFile fileAnexo;
		protected System.Web.UI.HtmlControls.HtmlTableCell tdAnexos;
		protected System.Web.UI.HtmlControls.HtmlTable tbForm;
		protected System.Web.UI.WebControls.TextBox txtId;
		private Business.BsUser usr;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			if( ! Business.BsUser.UserOn() )
			{
				Response.Write( "<script>alert( 'Sua sessão expirou!' );top.login();</script>" );
				Response.End();	
			}
			else usr = Business.BsUser.GetUserOn();

			if( Request["idForm"] != null ) Session[ "idForm" ] = Request["idForm"];
			form = new Business.BsForm( Convert.ToInt32( "0" + Session["idForm"] ) ).GetObject();

			if( Request["idFolder"] != null ) Session[ "idFolder" ] = Request["idFolder"];
			folder = new Business.BsFolder( Convert.ToInt32( "0" + Session["idFolder"] ) );

			item = new Business.BsItemForm( Convert.ToInt32("0"+Request["idItemForm"]),form );

			if( ! Page.IsPostBack )
				if( Request["force"] == null ) loadForm();
				else forceDownload( item );
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
			this.btnAnexar.Click += new System.EventHandler(this.btnAnexar_Click);
			this.btnGravar.Click += new System.EventHandler(this.btnGravar_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void forceDownload( BsItemForm item )
		{
			tbForm.Visible = false;
			Stream iStream = null;
			byte[] buffer = new byte[0x2710];
			string path = item.GetPathFile(Request["file"]);
			string nome = Request["file"];
			try
			{
				iStream = new FileStream(path, FileMode.Open, FileAccess.Read, FileShare.Read);
				long dataToRead = iStream.Length;
				base.Response.ContentType = "application/octet-stream";
				base.Response.AddHeader("Content-Disposition", "attachment; filename=" + nome);
				while (dataToRead > 0)
				{
					if (base.Response.IsClientConnected)
					{
						int length = iStream.Read(buffer, 0, 0x2710);
						base.Response.OutputStream.Write(buffer, 0, length);
						base.Response.Flush();
						buffer = new byte[0x2710];
						dataToRead -= length;
					}
					else
					{
						dataToRead = -1;
					}
				}
			}
			catch (Exception ex)
			{
				base.Response.Write("Error : " + ex.Message);
			}
			finally
			{
				if (iStream != null)
				{
					iStream.Close();
					this.RegisterStartupScript("dowload", "<script>window.close();</script>");
					base.Response.End();
				}
			}
		}

		private void loadForm()
		{
			form.Itens.Clear();
			form.Itens.Add(item.Id, item);
			createForm( form );
			txtId.Text = item.Id.ToString();

			string htm = item.ListDirectoryAnexos(true);
			if( htm != "" ) trAnexos.Visible = true;
			tdAnexos.InnerHtml = htm;
		}

		private void createForm( BsForm f )
		{
			RegisterStartupScript( "date", "<script>" + f.MountForm( tbFormMount, false ) + "</script>" );
			item.GetObject();
			if( form.Anexo && ( item.User.Id == usr.Id  || usr.Admin || item.Id == 0 ) )
				tbAnexo.Visible = true;
		}

		private void btnGravar_Click(object sender, System.EventArgs e)
		{
			saveForm();
			RegisterClientScriptBlock( "ok", "<script>top.openItemForm( 'tbChild" + form.Id + "', 'block' );top.closeLayerAlpha();</script>" );
		}

		private BsItemForm saveForm()
		{
			Business.BsFields fds = new Business.BsField(form).GetObjects();			
			item.Form = form;
			item.Folder = folder;
			item.Id = Convert.ToInt32(txtId.Text);

			string values="";
            
			for( int i=0; i< fds.Count; i++ )
			{
				if( fds[i].TypeObject.Id != 3 )
					item.GFields.Add( fds[i].Id, new Business.BsGenericItem( Request["txtCampo" + fds[i].Id ] ) );
				else
				{					
					BsItensField itsf = new BsItemField(fds[i]).GetObjects();
					for( int x=0; x<itsf.Count; x++ )
					{
						string returns = Request["txtCampo" + fds[i].Id + "-" + x ];
						if( returns != "" && returns != null ) values += returns + ",&nbsp;";
					}
					
					if( values != "" ) values = values.Substring(0, values.Length - 7 );
					item.GFields.Add( fds[i].Id, new Business.BsGenericItem( values ) );
				}
			}

			item.User = usr;
			item.SaveObject();	
			if( Convert.ToInt32("0"+txtId.Text) == 0 )
				item.Group.AddGroupsByItemForm( usr.Groups, item );
		
			return item;
		}

		private void btnAnexar_Click(object sender, System.EventArgs e)
		{
			BsItemForm item = saveForm();
			item.UploadFile( fileAnexo.PostedFile );
			loadForm();
		}		
	}
}
