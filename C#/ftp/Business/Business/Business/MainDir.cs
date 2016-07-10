namespace Business
{
    using System;
    using System.Configuration;
    using System.Data;
    using System.IO;
    using System.Web;

    public class MainDir
    {
        private string _arq;
        private DataTable _dir = new DataTable("Dir");
        private string _diratu;
        private string _dirAtual;
        private string _dirFix;
        private string _newDir;
        private string _pag;
        private string[] _ret = new string[2];

        public MainDir(string dirFix)
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
                string path = HttpUtility.UrlDecode(AppDomain.CurrentDomain.BaseDirectory + ConfigurationSettings.AppSettings["Images"] + this._dirFix + "/" + this._newDir);
                DirectoryInfo info = new DirectoryInfo(path);
                string name = info.Name;
                string str2 = HttpUtility.UrlDecode(path + this._arq);
                if (Path.GetExtension(str2) != "")
                {
                    if (File.Exists(str2))
                    {
                        File.Delete(str2);
                    }
                }
                else
                {
                    Directory.Delete(str2, true);
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
                string path = HttpUtility.UrlDecode(AppDomain.CurrentDomain.BaseDirectory + ConfigurationSettings.AppSettings["dirMainImages"] + this._dirFix + "/" + this._newDir);
                DirectoryInfo info = new DirectoryInfo(path);
                FileInfo[] files = info.GetFiles();
                string name = info.Name;
                string str3 = "../";
                string str4 = "";
                if ((this._diratu == null) || (this._diratu == ""))
                {
                    str4 = "";
                }
                else
                {
                    str4 = this._diratu;
                }
                string str5 = str4;
                if (info.Name.ToLower() != str4)
                {
                    str5 = info.Name + "/";
                }
                while (name.ToLower() != str4)
                {
                    DirectoryInfo info2 = new DirectoryInfo(path + str3);
                    name = info2.Name;
                    if (name.ToLower() == str4)
                    {
                        name = str4;
                    }
                    str5 = name + "/" + str5;
                    name = info2.Name;
                    str3 = str3 + "../";
                }
                for (int i = 0; i < files.Length; i++)
                {
                    if (files[i].Name != "Thumbs.db")
                    {
                        DataRow row = this._dir.NewRow();
                        FileInfo info3 = new FileInfo(HttpUtility.UrlDecode(AppDomain.CurrentDomain.BaseDirectory + ConfigurationSettings.AppSettings["dirProj"] + files[i].Extension.Replace(".", "") + ".gif"));
                        string str6 = info3.Name;
                        if (!info3.Exists)
                        {
                            str6 = "semicone.gif";
                        }
                        row["nome"] = "<img src=imagens/ftp/" + str6 + " alt=\"Clique para baixar\">&nbsp;&nbsp;<a href=\"javascript:void(0)\" onclick=\"VerImagem('" + str5 + "/" + files[i].Name + "'); \" >" + files[i].Name + "</a>";
                        row["tamanho"] = Convert.ToDouble((double) (((double) files[i].Length) / 1000.0)).ToString() + "&nbsp KB";
                        row["tipo"] = files[i].Extension.Replace(".", "");
                        row["data"] = files[i].LastWriteTime;
                        row["NomeLimpo"] = files[i].Name;
                        this._dir.Rows.Add(row);
                    }
                }
            }
            catch (Exception)
            {
            }
        }

        public void ListaDiretorios()
        {
            try
            {
                string path = HttpUtility.UrlDecode(AppDomain.CurrentDomain.BaseDirectory + ConfigurationSettings.AppSettings["dirMainImages"] + this._dirFix + "/" + this._newDir);
                DirectoryInfo info = new DirectoryInfo(path);
                DirectoryInfo[] directories = info.GetDirectories();
                string name = info.Name;
                string str3 = "";
                string str4 = "../";
                string str5 = "";
                if ((this._diratu == null) || (this._diratu == ""))
                {
                    str5 = "imagens";
                }
                else
                {
                    str5 = this._diratu;
                }
                if (info.Name.ToLower() != str5)
                {
                    str3 = info.Name + "/";
                }
                while (name.ToLower() != str5)
                {
                    DirectoryInfo info2 = new DirectoryInfo(path + str4);
                    name = info2.Name;
                    if (name.ToLower() == str5)
                    {
                        name = "";
                    }
                    str3 = name + "/" + str3;
                    name = info2.Name;
                    str4 = str4 + "../";
                }
                for (int i = 0; i < directories.Length; i++)
                {
                    DataRow row = this._dir.NewRow();
                    string str6 = this._pag + "?dirUser=" + this._diratu + "&dir=" + str3 + directories[i].Name;
                    row["nome"] = "<a href=\"" + str6 + "\" ><img src=\"imagens/ftp/diretorio.gif\" border=0 alt=\"Cliques para abrir o diret\x00f3rio\">&nbsp;&nbsp;" + directories[i].Name + "</a>";
                    row["tamanho"] = "";
                    row["tipo"] = "Pasta de arquivos";
                    row["data"] = directories[i].LastWriteTime;
                    row["NomeLimpo"] = directories[i].Name;
                    this._dir.Rows.Add(row);
                }
                this._dirAtual = this._diratu + str3;
            }
            catch (Exception)
            {
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

