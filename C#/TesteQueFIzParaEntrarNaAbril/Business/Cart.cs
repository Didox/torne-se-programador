using System;
using ExameAbril.DataBase;
using ExameAbril.DataBase.Generics;

namespace ExameAbril.Business
{
	#region Class Cart
	/// <summary>
	///  Classe de operações do Carrinho
	/// </summary>
	/// <remarks>Danilo Aparecido</remarks>
	public class Cart : CType
	{
		#region Construtores
		/// <summary>
		/// Contrutor padrão sem argumentos
		/// </summary>
		/// <remarks>Danilo Aparecido</remarks>
		public Cart() { }
		/// <summary>
		/// Contrutor com argumento identity e preenchido
		/// </summary>
        /// <param name="cartId_"> Seta o atributo _cartId do objeto Cart</param>
		/// <param name="isFull_"> Seta o atributo IsFull do objeto Cart, false: preenche o objeto com os dados da base, true: Utiliza o objeto atual</param>
		/// <remarks>Danilo Aparecido</remarks>
		public Cart(long? cartId_, bool isFull_) 
		{
			this._cartId = cartId_;
			base.IsFull = isFull_;
		}
		/// <summary>
		/// Contrutor padrão com argumentos
		/// </summary>
        /// <param name="cartId_"> Seta o atributo _cartId do objeto Cart</param>
        /// <param name="user_"> Seta o atributo _user do objeto Cart</param>
        /// <param name="product_"> Seta o atributo _product do objeto Cart</param>
		/// <param name="isFull"> Seta o atributo IsFull do objeto Cart</param>
		/// <remarks>Danilo Aparecido</remarks>
		public Cart(long? cartId_, User user_, Product product_, bool isFull_)
		{
			this._cartId = cartId_;
			this._user = user_;
            this._product = product_;
			this.IsFull = isFull_;
		}
		#endregion

        #region Destrutor
        ~Cart() { Dispose(); }
        #endregion

        #region Atributos
        private long? _cartId;
        private Product _product;
        private User _user;
		#endregion

		#region Propriedades		
		/// <summary>
		/// Seta ou retorna a o id do carrinho
		/// </summary>
        [Property(true, false, false, false)]
        [Operations(true, true, true)]
		public long? CartId
		{
			get{ return this._cartId;}
			set{ this._cartId = value;}
		}
        /// <summary>
        /// Seta e um novo objeto Product para propriedade ProductId
        /// Ex: usar no Bind() do ObjectDataSource para operações de save, delete
        /// </summary>
        [Property(false, true, false, false)]
        [Operations(true, true, true)]		
        public int? ProductId
        {
            get { return this.Product.ProductId; }
            set { _product = new Product(value, false); }
        }
        /// <summary>
        /// Seta ou retorna a referência do objeto Product
        /// </summary>
        [Property(false, false, true, false)]
        [Operations(false, false, false)]		        
        public Product Product
        {
            get
            {
                if (this._product == null)
                {
                    this._product = new Product();
                    return this._product;
                }
                if (!this._product.IsFull) this._product.Get();
                return this._product;
            }
            set { this._product = value; }
        }
        /// <summary>
        /// Seta e um novo objeto User para propriedade UserId
        /// Ex: usar no Bind() do ObjectDataSource para operações de save, delete
        /// </summary>
        [Property(false, true, false, false)]
        [Operations(true, true, true)]
        public long? UserId
        {
            get { return this.User.UserId; }
            set { _user = new User(value, false); }
        }
        /// <summary>
        /// Seta ou retorna a referência do objeto User
        /// </summary>
        [Property(false, false, true, false)]
        [Operations(false, false, false)]
        public User User
        {
            get
            {
                if (this._user == null)
                {
                    this._user = new User();
                    return this._user;
                }
                if (!this._user.IsFull) this._user.Get();
                return this._user;
            }
            set { this._user = value; }
        }
		#endregion

		#region Metodos Estaticos		
        /// <summary>
        /// Retorna o carrinho pelo id
        /// </summary>
        /// <param name="id"> id do carrinho </param>
        public static Cart GetById(long id) { return (Cart)GetByObject(new Cart(id, true)); }
        /// <summary>
        /// Retorna lista de carrinhos
        /// </summary>
        public static LIType GetAll() { return GetByParameters(new Cart()); }
        /// <summary>
        /// Retorna lista de carrinhos filtrando com parâmetros
		/// Ex: usar no ObjectDataSource
		/// </summary>
        public static LIType GetByParameters(long? cartId_, long? userId_, int? productId_)
		{
			return GetByParameters(new Cart(cartId_, new User(userId_, true), 
                new Product(productId_, true), true));
		}
        /// <summary>
        /// Salva o registro através de uma referência do objeto Cart
        /// Ex: usar no ObjectDataSource
        /// </summary>
        /// <param name="objCart">objeto Cart</param>
        public static void Save(Cart objCart)
        {
            new DbCart().Save(objCart);
        }
        /// <summary>
        /// Exclui o registro através de uma referência do objeto Cart
        /// Ex: usar no ObjectDataSource
        /// </summary>
        /// <param name="objCart">objeto Cart</param>
        public static void Delete(Cart objCart)
        {
            new DbCart().Delete(objCart);
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
		/// Exclui o objeto atual
		/// </summary>
		public void Delete(){ Delete(this); }

		#endregion

	}
	#endregion
}
