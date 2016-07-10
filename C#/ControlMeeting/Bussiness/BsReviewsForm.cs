using System;
using System.Collections;
using System.Web;
using System.Data;

namespace Business
{
	#region " Class BsReviewsForm "
	public class BsReviewsForm : BsObjectList
	{
		public BsReviewForm this[int i_]
		{
			get{ return ( BsReviewForm )(((DictionaryEntry)this.List[i_]).Value);}
		}

		public BsReviewForm GetKey( int key_ )
		{
			for( int x=0; x < this.Count; x++ )
			{
				DictionaryEntry dE = ( DictionaryEntry )this.List[x];
				if( dE.Key.Equals( key_ ) )
					return ( BsReviewForm )dE.Value;
			}
			return null;
		}
	}
	#endregion

	#region " Class BsReviewForm "
	public class BsReviewForm
	{
		#region " Constructor "
		public BsReviewForm(){}
		public BsReviewForm( int id_ )
		{
			_id = id_;
		}

		public BsReviewForm( int id_, BsItemForm itemForm_ )
		{
			_id = id_;
			_itemForm = itemForm_;
		}

		#endregion

		#region " Destructor "
		~BsReviewForm(){}
		#endregion

		#region " Attributes "
		private int			_id = 0;
		private BsUser		_user;
		private BsItemForm	_itemForm;
		private string		_review = "";
		private DateTime	_date;

		#endregion

		#region " Properties "
		public int Id			
		{
			get{ return _id; }
			set{ _id = value; }
		}

		public BsUser User
		{
			get
			{
				if( _user == null ) _user = new BsUser();
				return _user;
			}
			set{ _user = value; }
		}

		public BsItemForm ItemForm
		{
			get
			{
				if( _itemForm == null ) _itemForm = new BsItemForm();
				return _itemForm;
			}
		}

		public string Review
		{
			get{return _review;}
			set{_review = value.Replace("'", "");}
		}

		public string ReviewHTML
		{
			get{return _review.Replace("\r\n", "<br>");}
		}

		public string ReviewSumary
		{
			get
			{
				if( _review.Length > 98 )
					return _review.Replace("<br>", "&nbsp;").Substring(0,95) + "...";
				else
					return _review;
			}
		}

		public DateTime Date
		{
			get{return _date;}
		}

		#endregion

		#region " Events "

		private BsReviewForm setObject( BsReviewForm m_, DataRow dr_ )
		{
			m_._id			= Convert.ToInt32( dr_["idReview"] );			
			m_._review		= dr_["review"].ToString();
			m_._date		= Convert.ToDateTime( dr_["data"] );

			m_.ItemForm.Id	= Convert.ToInt32( dr_["idItemForm"] );

			m_.User.Id		= Convert.ToInt32( dr_["idUser"] );
			m_.User.Name	= dr_["nameUser"].ToString();
			return m_;
		}

		public void ExcludeObject()
		{
			if( _id == 0 && ItemForm.Id == 0 ) throw new Exception( "id or idItemForm not found. " );
			Database.DaReviewsForm.ExcludeObject( _id, ItemForm.Form.Id );
		}

		public void SaveObject()
		{ 
			if( ItemForm.Id == 0 ) throw new Exception( "idItemform not found. " );
			Database.DaReviewsForm.SaveObject( ref _id, User.Id, ItemForm.Id, ItemForm.Form.Id, _review ); 
		}

		public BsReviewForm GetObject()
		{	
			if( _id == 0 && ItemForm.Id == 0 ) return this;
			DataTable dt = Database.DaReviewsForm.GetReviews( _id, ItemForm.Id, ItemForm.Form.Id, "" );	
			if( dt.Rows.Count > 0 )
				setObject( this, dt.Rows[0] );
			else _id = 0;
			return this;
		}

		public BsReviewsForm GetObjects( string order )
		{	
			if( ItemForm.Id == 0 ) throw new Exception( "idForm not found. " );
			DataTable dt = Database.DaReviewsForm.GetReviews(  _id, ItemForm.Id, ItemForm.Form.Id, order );				
			return addObjectsList( dt );	
		}

		private BsReviewsForm addObjectsList( DataTable dt_ )
		{
			BsReviewsForm objects = new BsReviewsForm();
			foreach( DataRow dr in dt_.Rows )
				objects.Add( Convert.ToInt32( dr["idReview"] ), setObject(new BsReviewForm(), dr) );
			return objects;
		}

		#endregion
	}

	#endregion
}
