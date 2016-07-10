namespace CSGen.wsLuisSanches
{
    using System;
    using System.CodeDom.Compiler;
    using System.ComponentModel;
    using System.Diagnostics;
    using System.Runtime.CompilerServices;
    using System.Threading;
    using System.Web.Services;
    using System.Web.Services.Description;
    using System.Web.Services.Protocols;

    [GeneratedCode("System.Web.Services", "2.0.50727.1433"), DesignerCategory("code"), DebuggerStepThrough, WebServiceBinding(Name="LuisSanchesServicesSoap", Namespace="http://tempuri.org/")]
    public class LuisSanchesServices : SoapHttpClientProtocol
    {
        private SendOrPostCallback ReportBugOperationCompleted;
        private bool useDefaultCredentialsSetExplicitly;

        public event ReportBugCompletedEventHandler ReportBugCompleted;

        public LuisSanchesServices()
        {
            this.Url = "";
            if (this.IsLocalFileSystemWebService(this.Url))
            {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else
            {
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }

        public void CancelAsync(object userState)
        {
            base.CancelAsync(userState);
        }

        private bool IsLocalFileSystemWebService(string url)
        {
            if ((url == null) || (url == string.Empty))
            {
                return false;
            }
            Uri uri = new Uri(url);
            return ((uri.Port >= 0x400) && (string.Compare(uri.Host, "localHost", StringComparison.OrdinalIgnoreCase) == 0));
        }

        private void OnReportBugOperationCompleted(object arg)
        {
            if (this.ReportBugCompleted != null)
            {
                InvokeCompletedEventArgs args = (InvokeCompletedEventArgs) arg;
                this.ReportBugCompleted(this, new AsyncCompletedEventArgs(args.Error, args.Cancelled, args.UserState));
            }
        }

        [SoapDocumentMethod("http://tempuri.org/ReportBug", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=SoapBindingUse.Literal, ParameterStyle=SoapParameterStyle.Wrapped)]
        public void ReportBug(int codigoDominio, string nome, string email, string titulo, string comentario, string token)
        {
            base.Invoke("ReportBug", new object[] { codigoDominio, nome, email, titulo, comentario, token });
        }

        public void ReportBugAsync(int codigoDominio, string nome, string email, string titulo, string comentario, string token)
        {
            this.ReportBugAsync(codigoDominio, nome, email, titulo, comentario, token, null);
        }

        public void ReportBugAsync(int codigoDominio, string nome, string email, string titulo, string comentario, string token, object userState)
        {
            if (this.ReportBugOperationCompleted == null)
            {
                this.ReportBugOperationCompleted = new SendOrPostCallback(this.OnReportBugOperationCompleted);
            }
            base.InvokeAsync("ReportBug", new object[] { codigoDominio, nome, email, titulo, comentario, token }, this.ReportBugOperationCompleted, userState);
        }

        public string Url
        {
            get
            {
                return base.Url;
            }
            set
            {
                if (!((!this.IsLocalFileSystemWebService(base.Url) || this.useDefaultCredentialsSetExplicitly) || this.IsLocalFileSystemWebService(value)))
                {
                    base.UseDefaultCredentials = false;
                }
                base.Url = value;
            }
        }

        public bool UseDefaultCredentials
        {
            get
            {
                return base.UseDefaultCredentials;
            }
            set
            {
                base.UseDefaultCredentials = value;
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
    }
}

