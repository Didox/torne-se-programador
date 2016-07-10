using System;
using System.Text;
using System.Data;

namespace Business
{
	public class BsFunctions
	{
		public BsFunctions(){}

		public static bool IsDate( string date )
		{
			try
			{
				DateTime d = Convert.ToDateTime( date );
				return true;
			}
			catch
			{
				return false;
			}
		}

		public static bool IsDouble( string doubles )
		{
			try
			{
				double d = Convert.ToDouble( doubles );
				return true;
			}
			catch
			{
				return false;
			}
		}

		public static string monthToString( int month )
		{
			switch( month )
			{
				case 1:
					return "Janeiro";
				case 2:
					return "Fevereiro";
				case 3:
					return "Marco";
				case 4:
					return "Abril";
				case 5:
					return "Maio";
				case 6:
					return "Junho";
				case 7:
					return "Julho";
				case 8:
					return "Agosto";
				case 9:
					return "Setembro";
				case 10:
					return "Outubro";
				case 11:
					return "Novembro";
				default:
					return "Dezembro";
			}
		}

		public static string NotCarectersNotValid( string s )
		{
			s = s.Replace( "/","" );
			s = s.Replace( "\\","" );
			s = s.Replace( ">","" );
			s = s.Replace( "<","" );
			return s;
		}

		public static string NotAcent( string s )
		{
			s = s.Replace( "á","a" );
			s = s.Replace( "à","a" );
			s = s.Replace( "ã","a" );
			s = s.Replace( "â","a" );
			s = s.Replace( "é","e" );
			s = s.Replace( "ê","e" );
			s = s.Replace( "í","i" );
			s = s.Replace( "ó","o" );
			s = s.Replace( "ô","o" );
			s = s.Replace( "õ","o" );
			s = s.Replace( "ú","u" );
			s = s.Replace( "ü","u" );
			s = s.Replace( "ç","c" );
			s = s.Replace( "Á","A" );
			s = s.Replace( "À","A" );
			s = s.Replace( "Ã","A" );
			s = s.Replace( "Â","A" );
			s = s.Replace( "É","E" );
			s = s.Replace( "Ê","E" );
			s = s.Replace( "Í","I" );
			s = s.Replace( "Ó","O" );
			s = s.Replace( "Ô","O" );
			s = s.Replace( "Õ","O" );
			s = s.Replace( "Ú","U" );
			s = s.Replace( "Ü","U" );
			s = s.Replace( "Ç","C" );

			return s;
		}

		public static int NoFone( string fone )
		{
			fone += "";
			return Convert.ToInt32( "0" + fone.Replace( "-","" ) );
		}
		
		public static int GetIdade( DateTime dateAniver )
		{
			int idate = DateTime.Now.Year - dateAniver.Year;

			if( DateTime.Now < Convert.ToDateTime( dateAniver.Day + "/" + dateAniver.Month + "/" + DateTime.Now.Year ) )
				idate--;

			return idate;
		}

		public static string FormatCpfCnpj( string cpfCnpj )
		{
			cpfCnpj += "";
			if( cpfCnpj.Length == 11 && cpfCnpj.IndexOf( "." ) == -1 )
			{
				string format = cpfCnpj.Substring(0,3) + ".";
				format += cpfCnpj.Substring(3,3) + ".";
				format += cpfCnpj.Substring(6,3) + "-";
				format += cpfCnpj.Substring(9,2);
				return format;
			}
			else if( cpfCnpj.Length == 14 && cpfCnpj.IndexOf( "." ) == -1 )
			{
				string format = cpfCnpj.Substring(0,2) + ".";
				format += cpfCnpj.Substring(2,3) + ".";
				format += cpfCnpj.Substring(5,3) + "/";
				format += cpfCnpj.Substring(8,4) + "-";
				format += cpfCnpj.Substring(12,2);
				return format;
			}


			return "";
		}

		public static string FormatFone( string fone )
		{
			fone += "";
			if( fone.Length == 8 && fone.IndexOf( "-" ) == -1 )
			{
				string format = fone.Substring(0,4) + "-";
				format += fone.Substring(4,4);
				return format;
			}
			return "";
		}

		public static string NotCpfCnpj( string cpfcnpj )
		{
			cpfcnpj += "";
			return cpfcnpj.Replace( ".","" ).Replace( "-","" ).Replace( "/","" );
		}

		public static bool CpfIsValidLen( string cpf )
		{
			cpf = NotCpfCnpj( cpf );
			if( cpf.Length < 11 ) return false;
			else return true;
		}

		public static string FormatCep( string cep )
		{
			cep += "";
			if( cep.Length == 8 && cep.IndexOf( "-" ) == -1 )
			{
				string format = cep.Substring(0,5) + "-";
				format += cep.Substring(5,3);
				return format;
			}
			return "";
		}

		public static string NoCep( string cep )
		{
			cep += "";
			return cep.Replace( "-","" );
		}
	}
}
