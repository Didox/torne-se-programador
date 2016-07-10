using System;
using ExameAbril.DataBase;
using ExameAbril.DataBase.Generics;

namespace ExameAbril.Business
{
	#region Class User
	/// <summary>
	///  Classe de operações do Usuário
	/// </summary>
	/// <remarks>Danilo Aparecido</remarks>
	public class User : CType
	{
		#region Construtores
		/// <summary>
		/// Contrutor padrão sem argumentos
		/// </summary>
		/// <remarks>Danilo Aparecido</remarks>
		public User() { }
        /// <summary>
        /// Contrutor com argumentos identity e preenchido
        /// </summary>
        /// <param name="userId_"> Seta o atributo _userId do objeto User</param>
        /// <param name="isFull_"> Seta o atributo IsFull do objeto User, false: preenche o objeto com os dados da base, true: Utiliza o objeto atual</param>
        /// <remarks>Danilo Aparecido</remarks>
        public User(long? userId_, bool isFull_)
        {
            this._userId = userId_;
            this.IsFull = isFull_;
        }
		/// <summary>
        /// Contrutor com argumentos
		/// </summary>
        /// <param name="userId_"> Seta o atributo _userId do objeto User</param>
        /// <param name="name_"> Seta o atributo _name do objeto User</param>
        /// <param name="description_"> Seta o atributo IsFull do objeto User</param>
        /// <param name="theme_"> Seta o atributo _theme do objeto User</param>
        /// <remarks>Danilo Aparecido</remarks>
        public User(long? userId_, string name_, string description_, Themes? theme_, bool isFull_) 
		{
            this._userId = userId_;
            this._name = name_;
            this._description = description_;
            this._theme = theme_;
			this.IsFull = isFull_;
		}
		#endregion

        #region Destrutor
        ~User() { Dispose(); }
        #endregion

		#region Atributos
		private long? _userId;
        private string _name;
        private string _description;
        private Themes? _theme;
        private DateTime _creationDate;
        private LIType _carts;
		#endregion

		#region Propriedades		
		/// <summary>
		/// Seta ou retorna a o id do usuário
		/// </summary>
        [Property(true, false, false, false)]
        [Operations(true, true, true)]
		public long? UserId
		{
            get { return this._userId; }
            set { this._userId = value; }
		}
		/// <summary>
		/// Seta ou retorna o nome do usuário
		/// </summary>
        [Property(false, true, false, false)]
        [Operations(true, false, true)]
		public string Name
		{
			get{ return this._name;}
            set { this._name = value; }
		}
        /// <summary>
        /// Seta ou retorna a descrição do usuário
        /// </summary>
        [Property(false, true, false, false)]
        [Operations(true, false, false)]
        public string Description
        {
            get { return this._description; }
            set { this._description = value; }
        }
        /// <summary>
        /// Seta ou retorna a o tema que o usuário está usando
        /// </summary>
        [Property(false, true, false, false)]
        [Operations(true, false, false)]
        public Themes? Theme
        {
            get { return this._theme; }
            set { this._theme = value; }
        }
        /// <summary>
        /// Retorna a data de criação do usuário
        /// </summary>
        [Property(false, true, false, false)]
        [Operations(false, false, false)]
        public DateTime CreationDate
        {
            get { return this._creationDate; }
            set { this._creationDate = value; }
        }
        /// <summary>
        /// Seta ou retorna a coleção genérica para o objeto Cart(carrinho do usuário)
        /// </summary>
        [Property(false, false, false, true)]
        [Operations(false, false, false)]
        public LIType Carts
        {
            get
            {
                if (this._carts == null ) 
                    this._carts = Cart.GetByParameters(null, _userId, null);
                return this._carts;
            }
            set { this._carts = value; }
        }
		#endregion

		#region Metodos Estaticos	
        /// <summary>
        /// Retorna usuário autenticado
        /// </summary>
        public static User GetAutenticate()
        {
            return (User)System.Web.HttpContext.Current.Session["user"];
        }
        /// <summary>
        /// Faz o logoff do usuário autenticado
        /// </summary>
        public static void Logoff()
        {
            System.Web.HttpContext.Current.Session["user"] = null;
        }
        /// <summary>
        /// Retorna usuário pelo id
        /// </summary>
        /// <param name="id"> id do usuário </param>
        public static User GetById(long id) { return (User)GetByObject(new User(id, true)); }
        /// <summary>
        /// Retorna lista de usuários
        /// </summary>
        public static LIType GetAll() { return GetByParameters(new User()); }
        /// <summary>
        /// Retorna lista de usuários filtrando com parâmetros
		/// Ex: usar no ObjectDataSource
		/// </summary>
        public static LIType GetByParameters(long? userId_, string name_)
		{
			return GetByParameters(new User(userId_, name_, null, null, true));
		}
        /// <summary>
        /// Salva o registro através de uma referência do objeto User
        /// Ex: usar no ObjectDataSource
        /// </summary>
        /// <param name="objUser">objeto User</param>
        public static void Save(User objUser)
        {
            new DbUser().Save(objUser);
        }
        /// <summary>
        /// Exclui o registro através de uma referência do objeto User
        /// Ex: usar no ObjectDataSource
        /// </summary>
        /// <param name="objUser">objeto User</param>
        public static void Delete(User objUser)
        {
            new DbUser().Delete(objUser);
        }
		#endregion

		#region Metodos
		/// <summary>
		/// Seta o objeto atual com os registros do banco
		/// </summary>
        public void Get() { GetByObject(this); }

		/// <summary>
		/// Salva o objeto atual
		/// </summary>
		public void Save(){ Save(this); }

        /// <summary>
        /// Salva o objeto atual
        /// </summary>
        /// <param name="save">Parametro que salva ou não o objeto na sessão</param>
        public void Save(bool save)
        {
            Save(this);
            if (save) SaveSession();
        }

		/// <summary>
		/// Exclui o objeto atual
		/// </summary>
		public void Delete(){ Delete(this); }

        /// <summary>
        /// Faz a autenticação do usuário
        /// </summary>
        public void Autenticate()
        {
            Get();
            if (this.UserId == null) this.Dispose();
            else SaveSession();
        }
        /// <summary>
        /// Salva o objeto na sessao
        /// </summary>
        public void SaveSession()
        {
            System.Web.HttpContext.Current.Session["user"] = this;
        }
		#endregion

	}
	#endregion
}
