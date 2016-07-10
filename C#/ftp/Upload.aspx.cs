namespace ftp
{
	using Business;
	using Controle.Componentes;
	using System;
	using System.Drawing;
	using System.Web.UI;
	using System.IO;
	using System.Web.UI.HtmlControls;
	using System.Web.UI.WebControls;

	public class Upload : Page
	{
		protected TextBox acima;
		protected Controle.Componentes.DataGrid Grid;
		protected ImageButton imbAcima;
		protected ImageButton imbExcluir;
		protected HtmlAnchor linkNova;
		protected HtmlAnchor linkUp;
		protected TextBox txtDir;

		private void CarregaDir()
		{
			MainDir dir = new MainDir(base.Request.QueryString["dirUser"]);
			dir.Pagina = "upload.aspx";
			string str = "";
			if (base.Request.QueryString["dir"] != null)
			{
				str = base.Request.QueryString["dir"] + "/" + this.acima.Text;
			}
			dir.NewDir = str;
			dir.ListaDiretorios();
			dir.ListaArquivos();
			//this.Grid.set_EnableColumnDrag(false);
			this.Grid.DataSource = dir.Dir;
			this.Grid.DataBind();
			//this.Grid.set_HlColor(Color.Beige);
			//this.Grid.set_SlColor(Color.Beige);
			this.txtDir.Text = dir.dirAtu;
			this.linkNova.Attributes.Add("onclick", "return novaPasta(' " + base.Request.QueryString["dirUser"] + " ',' " + dir.dirAtu + " ');");
			this.linkUp.Attributes.Add("onclick", "return EnviarArquivo(' " + base.Request.QueryString["dirUser"] + " ',' " + dir.dirAtu + " ');");
		}

		private void Grid_ItemDataBound(object sender, DataGridItemEventArgs e)
		{
			if (e.Item.ItemType == ListItemType.Header)
			{
				CheckBox box = (CheckBox) e.Item.FindControl("chkTodos");
				if (box != null)
				{
					box.Attributes.Add("onClick", "SelecionarTodos();");
				}
			}
		}

		private void imbAcima_Click(object sender, ImageClickEventArgs e)
		{
			this.acima.Text = this.acima.Text + "../";
			this.CarregaDir();
		}

		private void imbExcluir_Click(object sender, ImageClickEventArgs e)
		{
			foreach (DataGridItem item in this.Grid.Items)
			{
				MainDir dir = new MainDir(base.Request.QueryString["dirUser"]);
				dir.Pagina = "upload.aspx";
				if (base.Request.QueryString["dir"] != null)
				{
					dir.NewDir = base.Request.QueryString["dir"] + "/" + this.acima.Text;
				}
				CheckBox box = (CheckBox) item.FindControl("chkNome");
				if ((box != null) && box.Checked)
				{
					string str = base.Request.QueryString["dirUser"];
					if (base.Request.QueryString["dir"] != null)
					{
						str += "/" + base.Request.QueryString["dir"] + "/" + this.acima.Text;
					}
					string dirDelete = str;
					
					dir.Arq =  dirDelete + "//" + item.Cells[5].Text;

					if (!dir.ExcluirArquivo())
					{
						this.RegisterStartupScript("erro", "<script>alert('" + dir.Ret[1] + "')</script>");
					}
				}
			}
			this.CarregaDir();
		}

		private void InitializeComponent()
		{
			this.imbAcima.Click += new ImageClickEventHandler(this.imbAcima_Click);
			this.imbExcluir.Click += new ImageClickEventHandler(this.imbExcluir_Click);
			this.Grid.ItemDataBound += new DataGridItemEventHandler(this.Grid_ItemDataBound);
			base.Load += new EventHandler(this.Page_Load);
		}

		protected override void OnInit(EventArgs e)
		{
			this.InitializeComponent();
			base.OnInit(e);
		}

		private void Page_Load(object sender, EventArgs e)
		{
			this.imbExcluir.Attributes.Add("onclick", "return ExcluirTodos();");
			if (!base.IsPostBack)
			{
				this.CarregaDir();
			}
		}
	}
}

