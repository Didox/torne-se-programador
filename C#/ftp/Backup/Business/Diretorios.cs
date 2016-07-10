namespace Business
{
    using System;
    using System.Configuration;
    using System.Data;
    using System.IO;
    using System.Web;

    public class Diretorios
    {
        private string _arq;
        private DataTable _dir = new DataTable("Dir");
        private string _diratu;
        private string _dirAtual;
        private string _dirFix;
        private string _newDir;
        private string _pag;
        private string[] _ret = new string[2];

        public Diretorios(string dirFix)
        {
            this._dir.Columns.Add("Nome");
            this._dir.Columns.Add("Tamanho");
            this._dir.Columns.Add("Tipo");
            this._dir.Columns.Add("Data");
            this._dir.Columns.Add("NomeLimpo");
            dirFix = dirFix + "";
            this._dirFix = HttpUtility.UrlEncode(dirFix.Trim());
            if ((dirFix != null) && (dirFix != ""))
            {
                this._diratu = this._dirFix;
            }
        }

        private void AtualizaNewDir(string dirAtual)
        {
            this._newDir = dirAtual.Replace("//", "/");
        }

        public bool ExcluirArquivo()
        {
            try
            {
                string path = HttpUtility.UrlDecode(AppDomain.CurrentDomain.BaseDirectory + ConfigurationSettings.AppSettings["dirMain"] + this._dirFix + "/" + this._newDir);
                DirectoryInfo diretorio = new DirectoryInfo(path);
                string dirAtual = diretorio.Name;
                string voltaDir = HttpUtility.UrlDecode(path + this._arq);
                if (Path.GetExtension(voltaDir) != "")
                {
                    if (File.Exists(voltaDir))
                    {
                        File.Delete(voltaDir);
                    }
                }
                else
                {
                    Directory.Delete(voltaDir, true);
                }
                this._ret[0] = "1";
                return true;
            }
            catch (Exception)
            {
                this._ret[0] = "0";
                this._ret[1] = "N\x00e3o foi poss\x00edvel excluir arquivo ou diret\x00f3rio, se diret\x00f3rio, verifique n\x00e3o est\x00e1 vazia.\\n";
                return false;
            }
        }

        public void ListaArquivos()
        {
            try
            {
                string path = HttpUtility.UrlDecode(AppDomain.CurrentDomain.BaseDirectory + ConfigurationSettings.AppSettings["dirMain"] + this._dirFix + "/" + this._newDir);
                DirectoryInfo diretorio = new DirectoryInfo(path);
                FileInfo[] arq = diretorio.GetFiles();
                string dirAtual = diretorio.Name;
                string volta = "../";
                string dircomp = "";
                if ((this._diratu == null) || (this._diratu == ""))
                {
                    dircomp = "";
                }
                else
                {
                    dircomp = this._diratu;
                }
                string voltaDir = dircomp;
                if (diretorio.Name.ToLower() != dircomp)
                {
                    voltaDir = diretorio.Name + "/";
                }
                while (dirAtual.ToLower() != dircomp)
                {
                    DirectoryInfo dirAnt = new DirectoryInfo(path + volta);
                    dirAtual = dirAnt.Name;
                    if (dirAtual.ToLower() == dircomp)
                    {
                        dirAtual = dircomp;
                    }
                    voltaDir = dirAtual + "/" + voltaDir;
                    dirAtual = dirAnt.Name;
                    volta = volta + "../";
                }
                for (int i = 0; i < arq.Length; i++)
                {
                    if (arq[i].Name != "Thumbs.db")
                    {
						DataRow dr = this._dir.NewRow();
                        FileInfo icone = new FileInfo(HttpUtility.UrlDecode(AppDomain.CurrentDomain.BaseDirectory + ConfigurationSettings.AppSettings["dirProj"] + arq[i].Extension.Replace(".", "") + ".gif"));
                        string strIcone = icone.Name;
                        if (!icone.Exists)
                        {
                            strIcone = "semicone.gif";
                        }
                        dr["nome"] = "<a href=\"javascript:void(0)\" onclick=\"VerImagem('" + voltaDir + "//" + arq[i].Name
							+ "'); \" ><img src=imagens/ftp/" + strIcone + " alt=\"Clique para baixar\" border=0 >&nbsp;&nbsp;" + arq[i].Name + "</a>";
                        dr["tamanho"] = Convert.ToDouble((double) (((double) arq[i].Length) / 1000)).ToString() + "&nbsp KB";
                        dr["tipo"] = arq[i].Extension.Replace(".", "");
                        dr["data"] = arq[i].LastWriteTime;
                        dr["NomeLimpo"] = arq[i].Name;
                        this._dir.Rows.Add(dr);
                    }
                }
            }
            catch (Exception)
            {
                this._newDir = "";
                this.ListaDiretorios();
            }
        }

        public void ListaDiretorios()
        {
            try
            {
                string path = HttpUtility.UrlDecode(AppDomain.CurrentDomain.BaseDirectory + ConfigurationSettings.AppSettings["dirMain"] + this._dirFix + "/" + this._newDir);
                DirectoryInfo diretorio = new DirectoryInfo(path);
                DirectoryInfo[] subdir = diretorio.GetDirectories();
                string dirAtual = diretorio.Name;
                string voltaDir = "";
                string volta = "../";
                string dircomp = "";
                if ((this._diratu == null) || (this._diratu == ""))
                {
                    dircomp = "main";
                }
                else
                {
                    dircomp = this._diratu;
                }
                if (diretorio.Name.ToLower() != dircomp)
                {
                    voltaDir = diretorio.Name + "/";
                }
                while (dirAtual.ToLower() != dircomp)
                {
                    DirectoryInfo dirAnt = new DirectoryInfo(path + volta);
                    dirAtual = dirAnt.Name;
                    if (dirAtual.ToLower() == dircomp)
                    {
                        dirAtual = "";
                    }
                    voltaDir = dirAtual + "/" + voltaDir;
                    dirAtual = dirAnt.Name;
                    volta = volta + "../";
                }
				for (int i = 0; i < subdir.Length; i++)
				{
					DataRow dr = this._dir.NewRow();
					string location = this._pag + "?dirUser=" + this._diratu + "&dir=" + voltaDir + subdir[i].Name;
					dr["nome"] = "<a href=\""+ location +"\" ><img src=\"imagens/ftp/diretorio.gif\" border=0 alt=\"Cliques para abrir o diret\x00f3rio\">&nbsp;&nbsp;" + subdir[i].Name + "</a>";
					dr["tamanho"] = "";
					dr["tipo"] = "Pasta de arquivos";
					dr["data"] = subdir[i].LastWriteTime;
					dr["NomeLimpo"] = subdir[i].Name;
					this._dir.Rows.Add(dr);
				}
                this._dirAtual = this._diratu + voltaDir;
            }
            catch (Exception)
            {
                this._newDir = "";
                this.ListaDiretorios();
            }
        }

        public string Arq
        {
            get
            {
                return HttpUtility.UrlDecode(this._arq.Trim());
            }
            set
            {
                this._arq = HttpUtility.UrlEncode(value.Trim());
            }
        }

        public DataTable Dir
        {
            get
            {
                return this._dir;
            }
            set
            {
                this._dir = value;
            }
        }

        public string dirAtu
        {
            get
            {
                return this._dirAtual;
            }
        }

        public string NewDir
        {
            get
            {
                return HttpUtility.UrlDecode(this._newDir.Trim());
            }
            set
            {
                this._newDir = HttpUtility.UrlEncode(value.Trim());
            }
        }

        public string Pagina
        {
            get
            {
                return this._pag.Trim();
            }
            set
            {
                this._pag = value.Trim();
            }
        }

        public string[] Ret
        {
            get
            {
                return this._ret;
            }
            set
            {
                this._ret = value;
            }
        }
    }
}

