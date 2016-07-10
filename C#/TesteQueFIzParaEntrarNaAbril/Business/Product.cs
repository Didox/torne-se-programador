using System;
using ExameAbril.DataBase;
using ExameAbril.DataBase.Generics;

namespace ExameAbril.Business
{
	#region Class Product
	/// <summary>
	///  Classe de operações do Product
	/// </summary>
	/// <remarks>Danilo Aparecido</remarks>
	public class Product : CType
	{
		#region Construtores
		/// <summary>
		/// Contrutor padrão sem argumentos
		/// </summary>
		/// <remarks>Danilo Aparecido</remarks>
		public Product() { }
		/// <summary>
		/// Contrutor padrão com argumento identity e preenchido
		/// </summary>
		/// <param name="productId_"> Seta o atributo _productId do objeto Product</param>
		/// <param name="isFull_"> Seta o atributo IsFull do objeto Product, false: preenche o objeto com os dados da base, true: Utiliza o objeto atual</param>
		/// <remarks>Danilo Aparecido</remarks>
		public Product(int? productId_, bool isFull_) 
		{
			this._productId = productId_;
			this.IsFull = isFull_;
		}
		/// <summary>
		/// Contrutor padrão com argumentos
		/// </summary>
		/// <param name="ProductId"> Seta o atributo _productId do objeto Product</param>
		/// <param name="description"> Seta o atributo _description do objeto Product</param>
		/// <param name="isFull"> Seta o atributo IsFull do objeto Product</param>
		/// <remarks>Danilo Aparecido</remarks>
        public Product(int? productId_, string description_, Category? category_, float? price_, bool isFull_)
		{
			this._productId = productId_;
			this._description = description_;
            this._category = category_;
            this._price = price_;
			this.IsFull = isFull_;
		}
		#endregion

        #region Destrutor
        ~Product() { Dispose(); }
        #endregion

		#region Atributos
		private int? _productId;
		private string _description;
        private Category? _category;
        private float? _price;
        private DateTime _creationDate;
        private LIType _carts;
		#endregion

		#region Propriedades		
		/// <summary>
		/// Seta ou retorna a propriedade ProductId
		/// </summary>
        [Property(true, false, false, false)]
        [Operations(true, true, true)]
		public int? ProductId
		{
			get{ return this._productId;}
			set{ this._productId = value;}
		}
		/// <summary>
		/// Seta ou retorna a propriedade description
		/// </summary>
        [Property(false, true, false, false)]
        [Operations(true, false, true)]
		public string Description
		{
			get{ return this._description;}
            set { this._description = value; }
		}
        /// <summary>
        /// Seta ou retorna a propriedade Category
        /// </summary>
        [Property(false, true, false, false)]
        [Operations(true, false, true)]
        public Category? Category
        {
            get { return this._category; }
            set { this._category = value; }
        }
        /// <summary>
        /// Seta ou retorna a propriedade Price
        /// </summary>
        [Property(false, true, false, false)]
        [Operations(true, false, false)]
        public float? Price
        {
            get { return this._price; }
            set { this._price = value; }
        }
        /// <summary>
        /// Retorna a data de criação do produto
        /// </summary>
        [Property(false, true, false, false)]
        [Operations(false, false, false)]
        public DateTime CreationDate
        {
            get { return this._creationDate; }
            set { this._creationDate = value; }
        }
        /// <summary>
        /// Seta ou retorna a coleção genérica para o objeto Cart
        /// </summary>
        [Property(false, false, false, true)]
        [Operations(false, false, false)]
        public LIType Carts
        {
            get
            {
                if (this._carts == null) this._carts = Cart.GetByParameters(null, null, _productId);
                return this._carts;
            }
            set { this._carts = value; }
        }
		#endregion

		#region Metodos Estaticos		
        /// <summary>
        /// Retorna Product pelo id
        /// </summary>
        /// <param name="id"> id do Product </param>
        public static Product GetById(int id) { return (Product)GetByObject(new Product(id, true)); }
        /// <summary>
        /// Retorna lista de Product
        /// </summary>
        public static LIType GetAll() { return GetByParameters(new Product()); }
        /// <summary>
		/// Retorna lista de Product filtrando com parâmetros
		/// Ex: usar no ObjectDataSource
		/// </summary>
        public static LIType GetByParameters(int? productId_, string description_, int? category)
		{
            return GetByParameters(new Product(productId_, description_, (Category?)category, null, true));
		}
        /// <summary>
        /// Salva o registro através de uma referência do objeto Product
        /// Ex: usar no ObjectDataSource
        /// </summary>
        /// <param name="objProduct">objeto Product</param>
        public static void Save(Product objProduct)
        {
            new DbProduct().Save(objProduct);
        }
        /// <summary>
        /// Exclui o registro através de uma referência do objeto Product
        /// Ex: usar no ObjectDataSource
        /// </summary>
        /// <param name="objProduct">objeto Product</param>
        public static void Delete(Product objProduct)
        {
            new DbProduct().Delete(objProduct);
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
