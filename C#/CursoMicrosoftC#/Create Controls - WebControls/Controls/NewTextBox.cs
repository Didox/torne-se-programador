using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Controls
{
    [System.Drawing.ToolboxBitmap(typeof(TextBox))]
    public class NewTextBox : TextBox
    {
        public override string Text
        {
            get
            {
                if (base.Text == "")
                    return "leandro troxa";
                else
                    return base.Text;
            }
            set{ base.Text = value; }
        }
    }
}
