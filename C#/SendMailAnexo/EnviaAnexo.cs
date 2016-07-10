using System;
using System.Configuration;
using System.IO;
using System.Web.Mail;

namespace EnviaAnexo
{
	public class EnviaAnexo
	{
		#region " construtor "
		public EnviaAnexo()
		{
		}
		#endregion

		public string[] EnviarEmailAnexo( string nome, string email, string mensagem , System.Web.UI.HtmlControls.HtmlInputFile anexo )
		{
			MailMessage objEmail = new MailMessage();
			try
			{
				objEmail.From = ConfigurationSettings.AppSettings["email"].ToString();
				objEmail.Body = mensagem;
				objEmail.To = email;
				objEmail.Subject = ConfigurationSettings.AppSettings["subject"].ToString() + nome;
				string caminho = ConfigurationSettings.AppSettings["diretorio"].ToString() + Path.GetFileName( anexo.PostedFile.FileName );
				anexo.PostedFile.SaveAs( caminho );
				objEmail.Attachments.Add( new MailAttachment( caminho ) );
				SmtpMail.Send( objEmail );
				File.Delete( caminho );
				string[] retorno = new string[2];
				retorno[0] = "1";
				retorno[1] = ConfigurationSettings.AppSettings["confirmacao"].ToString();
				return retorno; 
			}
			catch( Exception erro )
			{	
				string[] retorno = new string[2];
				retorno[0] = "0";
				retorno[1] = erro.Message.ToString().Replace( "'","" );
				return retorno; 
			}
		}

	}
}
