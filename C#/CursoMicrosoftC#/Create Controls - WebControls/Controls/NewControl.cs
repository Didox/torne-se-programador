using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Controls
{
    [System.Drawing.ToolboxBitmap(typeof(Panel))]
    public class NewControl : CompositeControl
    {
        public NewControl() { }

        protected override void CreateChildControls()
        {
            base.CreateChildControls();
            Button b = new Button();
            b.Text = "teste";
            Controls.Add(b);

            b.Click += new EventHandler(b_Click);
        }

        protected void b_Click(object sender, EventArgs e)
        {
            Label l = new Label();
            l.Text = "not in";
            l.ID = "lblTeste";
            Controls.Add(l);
        }

        public override void RenderControl(HtmlTextWriter writer)
        {
            base.RenderControl(writer);
            writer.Write("<br>teste danilo<br>");
        }

    }
}