namespace ftp
{
	using Business;
	using Controle.Componentes;
	using System;
	using System.Drawing;
	using System.Web.UI;
	using System.Web.UI.WebControls;

	public class FTP_PUB : Page
	{
		protected TextBox acima;
		protected Controle.Componentes.DataGrid Grid;
		protected ImageButton imbAcima;
		protected TextBox txtDir;

		private void CarregaDir()
		{
			Diretorios diretorios = new Diretorios(base.Request.QueryString["dirUser"]);
			diretorios.Pagina = "ftp_pub.aspx";
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
				diretorios.Pagina = "ftp_pub.aspx";
				if (base.Request.QueryString["dir"] != null)
				{
					diretorios.NewDir = base.Request.QueryString["dir"] + @"\" + this.acima.Text;
				}
				CheckBox box = (CheckBox) item.FindControl("chkNome");
				if ((box != null) && box.Checked)
				{
					diretorios.Arq = item.Cells[5].Text;
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
			base.Load += new EventHandler(this.Page_Load);
			this.imbAcima.Click += new ImageClickEventHandler(this.imbAcima_Click);
			this.Grid.ItemDataBound += new DataGridItemEventHandler(this.Grid_ItemDataBound);
		}

		protected override void OnInit(EventArgs e)
		{
			this.InitializeComponent();
			base.OnInit(e);
		}

		private void Page_Load(object sender, EventArgs e)
		{
			if (!base.IsPostBack)
			{
				this.CarregaDir();
			}
		}
	}
}

