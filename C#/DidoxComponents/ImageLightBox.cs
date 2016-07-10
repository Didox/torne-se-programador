using System;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Web;
using System.Web.UI;
using System.ComponentModel;

namespace DidoxComponents
{
    [ToolboxBitmap(typeof(DidoxComponents.ImageLightBox), "Icon.ico"), ParseChildren(true),
    PersistChildren(false), ToolboxData("<{0}:ImageLightBox rel='lightbox[cabins]' runat=server></{0}:ImageLightBox>")]
    public class ImageLightBox : HyperLink
    {
        /*protected override void RenderContents(HtmlTextWriter writer)
        {
            writer.Write(Text);
        }*/

        protected override void OnInit(EventArgs e)
        { 
            
            //base.OnInit(e);
            //string csslink = "<link rel='stylesheet' type='text/css' href='" + Page.ClientScript.GetWebResourceUrl(this.GetType(), "DidoxComponents.ImageLightBox.lightbox.css") + "' />";
            //LiteralControl include = new LiteralControl(csslink);
            //this.Page.Header.Controls.Add(include);
            //this.Page.ClientScript.RegisterClientScriptInclude(this.GetType(), "Key1", Page.ClientScript.GetWebResourceUrl(this.GetType(), "DidoxComponents.ImageLightBox.prototype.js"));
            //this.Page.ClientScript.RegisterClientScriptInclude(this.GetType(), "Key2", Page.ClientScript.GetWebResourceUrl(this.GetType(), "DidoxComponents.ImageLightBox.scriptaculous.js"));
            //this.Page.ClientScript.RegisterClientScriptInclude(this.GetType(), "Key3", Page.ClientScript.GetWebResourceUrl(this.GetType(), "DidoxComponents.ImageLightBox.effects.js"));
            //this.Page.ClientScript.RegisterClientScriptInclude(this.GetType(), "Key4", Page.ClientScript.GetWebResourceUrl(this.GetType(), "DidoxComponents.ImageLightBox.lightbox.js"));
            
            this.Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "key1", "<link rel=\"Stylesheet\" href=\"LightBox/css/lightbox.css\" />");
            this.Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "key2", "<script type=\"text/javascript\" src=\"LightBox/Js/prototype.js\"></script>");
            this.Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "key3", "<script type=\"text/javascript\" src=\"LightBox/Js/scriptaculous.js\"></script>");
            this.Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "key4", "<script type=\"text/javascript\" src=\"LightBox/Js/effects.js\"></script>");
            this.Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "key5", "<script type=\"text/javascript\" src=\"LightBox/Js/lightbox.js\"></script>");
             
        }

        /*private string _rel;
        [Bindable(true)]
        [DefaultValue("lightbox[cabins]")]
        [UrlProperty]
        public virtual string Rel
        {
            get { return _rel; }
            set { _rel = value; }
        } */
    }
}
