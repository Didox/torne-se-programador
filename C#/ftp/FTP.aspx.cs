namespace ftp
{
	using Business;
	using Controle.Componentes;
	using System;
	using System.Drawing;
	using System.Web.UI;
	using System.Web.UI.HtmlControls;
	using System.Web.UI.WebControls;

	public class WebForm1 : Page
	{
		protected TextBox acima;
		protected CheckBox chkNome;
		protected CheckBox chkTodos;
		protected Controle.Componentes.DataGrid Grid;
		protected ImageButton imbAcima;
		protected ImageButton imbExcluir;
		protected HtmlAnchor linkNova;
		protected HtmlAnchor linkUp;
		protected TextBox txtDir;

		private void CarregaDir()
		{
			Diretorios diretorios = new Diretorios(base.Request.QueryString["dirUser"]);
			diretorios.Pagina = "ftp.aspx";
			string str = "";
			if (base.Request.QueryString["dir"] != null)
			{
				str = base.Request.QueryString["dir"] + "/" + this.acima.Text;
			}
			diretorios.NewDir = str;
			diretorios.ListaDiretorios();
			diretorios.ListaArquivos();
			this.Grid.EnableColumnDrag = false;
			this.Grid.DataSource = diretorios.Dir;
			this.Grid.DataBind();
			this.Grid.HlColor = Color.Beige;
			this.Grid.SlColor = Color.Beige;
			this.txtDir.Text = diretorios.dirAtu;
			this.linkNova.Attributes.Add("onclick", "return novaPasta(' " + base.Request.QueryString["dirUser"] + " ',' " + diretorios.dirAtu + " ');");
			this.linkUp.Attributes.Add("onclick", "return EnviarArquivo(' " + base.Request.QueryString["dirUser"] + " ',' " + diretorios.dirAtu + " ');");
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
			this.acima.Text = this.acima.Text + @"..\";
			this.CarregaDir();
		}

		private void imbExcluir_Click(object sender, ImageClickEventArgs e)
		{
			foreach (DataGridItem item in this.Grid.Items)
			{
				Diretorios diretorios = new Diretorios(base.Request.QueryString["dirUser"]);
				diretorios.Pagina = "ftp.aspx";
				if (base.Request.QueryString["dir"] != null)
				{
					diretorios.NewDir = base.Request.QueryString["dir"] + @"\" + this.acima.Text;
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
					
					diretorios.Arq =  dirDelete + "//" + item.Cells[5].Text;
					if (!diretorios.ExcluirArquivo())
					{
						this.RegisterStartupScript("erro", "<script>alert('" + diretorios.Ret[1] + "')</script>");
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

