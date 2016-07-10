using System;
using System.Web;
using System.Drawing.Design;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.ComponentModel;
using System.Drawing;
using System.Collections;
using System.Data;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Collections.Specialized;


namespace Controle
{
	namespace Componentes
	{	
		#region DataGrid Control (Column dragging)
		[ToolboxData("<{0}:DataGrid runat=server EnableColumnDrag='true' EnableClientSort='true'></{0}:DataGrid>")]
		public class DataGrid : System.Web.UI.WebControls.DataGrid, IPostBackDataHandler
		{
			public DataGrid() : base()
			{
				EnableColumnDrag = true;
				EnableClientSort = true;
				DragColor = Color.Empty;
				HitColor = Color.Empty;
				SlColor=Color.Empty;
				HlColor=Color.Empty;
				ColumnOrder = "";
				SmartClientRendering = true;
			}


			// *************************************************************
			// PRIVATE members
			//private const string HIDDENFIELD_DRAG = "__COLUMNORDER_";
			private const string HIDDENFIELD_SORT = "__SORTEXPR_";
			// *************************************************************


			// *************************************************************
			// IPostBackDataHandler::LoadPostData
			// Automatically updates the ColumnOrder property based on the 
			// content of the hidden field named as this control
			public virtual bool LoadPostData(string postDataKey, NameValueCollection postCollection) 
			{
				string currentColumnOrder = ColumnOrder;
				string postedColumnOrder = Convert.ToString(postCollection[postDataKey]);

				// Discard new values if empty
				if (postedColumnOrder == "")
					return false;

				// New value posted?
				if (!currentColumnOrder.Equals(postedColumnOrder)) 
				{
					// Discard new values if empty
					ColumnOrder = postedColumnOrder;
					return true;
				}

				return false;
			}
			// *************************************************************
     
			// *************************************************************
			// IPostBackDataHandler::RaisePostDataChangedEvent
			public virtual void RaisePostDataChangedEvent() 
			{
				// Do nothing here
				// No need of firing server-side events
			}
			// *************************************************************

			// *************************************************************
			// Fires when the grid gets loaded
			protected override void OnLoad(EventArgs e)
			{
				base.OnLoad(e);

				// Check the browser caps and disable dragging if needed
				bool uplevel = false;
				HttpBrowserCapabilities caps = Page.Request.Browser;
				if (caps.Browser.ToUpper().IndexOf("IE") > -1)
				{
					// This is IE. But is it at least v5?
					if (caps.MajorVersion >4)
						uplevel = true;
				}

				// If the browser is not IE5 or higher, drop dragging 
				if (!uplevel)
					EnableColumnDrag = false;
			}
			// *************************************************************

			// *************************************************************
			// Gets the name of the hidden field used to carry client info
			private string HiddenFieldForDragging
			{
				//get {return HIDDENFIELD_DRAG + ID;}
				get {return ID;}
			}
			// *************************************************************

			// *************************************************************
			// Gets the name of the hidden field used to carry client info
			private string HiddenFieldForSorting
			{
				get {return HIDDENFIELD_SORT + ID;}
			}
			// *************************************************************

			// *************************************************************
			// Stores the comma-separated string indicating the column order
			private string ColumnOrder
			{
				get {return Convert.ToString(ViewState["ColumnOrder"]);}
				set {ViewState["ColumnOrder"] = value;}
			}
			// *************************************************************

			// *************************************************************
			// Enable column dragging on the client
			// This means using a behavior and making the grid return
			// THEAD and TBODY elements
			public bool EnableColumnDrag
			{
				get {return Convert.ToBoolean(ViewState["EnableColumnDrag"]);}
				set {
					if (!ShowHeader)
					{
						ViewState["EnableColumnDrag"] = false;
						return;
					}
					ViewState["EnableColumnDrag"] = value;
					string behavior = Style["behavior"];
					if (behavior == null)
						behavior = "";
					behavior = behavior.Replace("url(htc/dragdrop.htc)", ""); // arrasta coluna não funciona para coluna desable
					if (value)
						behavior += " url(htc/dragdrop.htc)";
					Style["behavior"] = behavior;
				}
			}
			// *************************************************************

			// *************************************************************
			// Enable column sorting on the client
			// This means using a behavior and making the grid return
			// THEAD and TBODY elements
			public bool EnableClientSort
			{
				get {return Convert.ToBoolean(ViewState["EnableClientSort"]);}
				set 
				{
					bool valueToSet = value;

					// AllowSorting (server-side) and this are mutually exclusive
					//if (AllowSorting)
					//	valueToSet = false;

					ViewState["EnableClientSort"] = valueToSet;
					string behavior = Style["behavior"];
					if (behavior == null)
						behavior = "";
					behavior = behavior.Replace("url(htc/sort.htc) url(htc/destaque.htc)", "");
					if (value)
						behavior += " url(htc/sort.htc) url(htc/destaque.htc)";
					Style["behavior"] = behavior;
				}
			}
			// *************************************************************

			// *************************************************************
			// Optimize the HTML markup for client rendering
			public bool SmartClientRendering
			{
				get {return Convert.ToBoolean(ViewState["SmartClientRendering"]);}
				set {ViewState["SmartClientRendering"] = value;}
			}
			// *************************************************************

			// *************************************************************
			// ShowHeader--override
			public override bool ShowHeader
			{
				get {return base.ShowHeader;}
				set {
					base.ShowHeader = value;
					if (!ShowHeader)
						EnableColumnDrag = false;
				}
			}
			// *************************************************************

			// *************************************************************
			// AllowSorting--override
			/*
			public override bool AllowSorting
			{
				get {return base.AllowSorting;}
				set 
				{
					base.AllowSorting = value;
					if (AllowSorting)
						EnableClientSort = false;
				}
			}
			*/
			// *************************************************************

			// *************************************************************
			// Indicates the color of dragged column
			public Color SlColor
			{
				get {return (Color) ViewState["SlColor"];}
				set {ViewState["SlColor"] = value;}
			}
			// *************************************************************

			// *************************************************************
			// Indicates the color of the column being the current target 
			public Color HlColor
			{
				get {return (Color) ViewState["HlColor"];}
				set {ViewState["HlColor"] = value;}
			}
			// *************************************************************
			public Color DragColor
			{
				get {return (Color) ViewState["DragColor"];}
				set {ViewState["DragColor"] = value;}
			}
			// *************************************************************

			// *************************************************************
			// Indicates the color of the column being the current target 
			public Color HitColor
			{
				get {return (Color) ViewState["HitColor"];}
				set {ViewState["HitColor"] = value;}
			}
			// *************************************************************

			// *************************************************************
			// Undocumented overridable that is called to create the set of columns for the grid
			protected override ArrayList CreateColumnSet(PagedDataSource dataSource, bool useDataSource)
			{
				// Let the grid generate the base column set (take the
				// AutoGenerateColumns property into account)
				ArrayList a = base.CreateColumnSet(dataSource, useDataSource);

				// If column dragging is disabled or reordering unnecessary
				if (ColumnOrder == "" || !EnableColumnDrag)
					return a;

				// Apply the desired sequence of columns
				if (ColumnOrder != "")
				{
					// Reorder the column set to reflect the client-side changes
					IComparer myComparer = new ColumnComparer(ColumnOrder);
					a.Sort(myComparer);
				}

				// Client-side sorting is not restored here but once back
				// on the client. For this to happen, we only have to ensure 
				// that a hidden field is created

				return a;
			}
			// *************************************************************

			// *************************************************************
			// Render the control
			protected override void Render(HtmlTextWriter output)		
			{
				if (!Visible)
					return;

				// Must insert THEAD and TBODY wrapper tags
				bool hasTopMostPager = (AllowPaging && 
										(PagerStyle.Position == PagerPosition.Top || 
										PagerStyle.Position == PagerPosition.TopAndBottom));
				bool hasBottomPager = (AllowPaging && 
										(PagerStyle.Position == PagerPosition.Bottom || 
										PagerStyle.Position == PagerPosition.TopAndBottom));

				// Sets attributes for the DragDrop and Sort behavior
				if (EnableColumnDrag || EnableClientSort)
				{
					if (EnableColumnDrag)
					{
						if (DragColor != Color.Empty)
							Attributes["DragColor"] = DragColor.Name.ToLower();
						if (HitColor != Color.Empty)
							Attributes["HitColor"] = HitColor.Name.ToLower();		   			   
						Attributes["HasTopMostPager"] = "false";
						if (hasTopMostPager)
							Attributes["HasTopMostPager"] = "true";

						// Register the hidden fields to communicate
						Page.RegisterHiddenField(HiddenFieldForDragging, "");
					}
					if (EnableClientSort)
					{
						string buf = "";
						if (Page.Request[HiddenFieldForSorting] != "")
							buf = Convert.ToString(Page.Request[HiddenFieldForSorting]);
						Page.RegisterHiddenField(HiddenFieldForSorting, buf);
					}

					// Capture the default output of the DataGrid control
					if (SlColor != Color.Empty)
						Attributes["SlColor"] = SlColor.Name.ToLower();
					if (HlColor != Color.Empty)
						Attributes["HlColor"] = HlColor.Name.ToLower();

					StringWriter writer = new StringWriter();
					HtmlTextWriter buffer = new HtmlTextWriter(writer);
					base.Render(buffer);
					string gridMarkup = writer.ToString();

					// Parse the markup to insert missing tags

					// Find the 1st occurrence of > and insert <thead>
					int insertPoint;
					insertPoint = gridMarkup.IndexOf(">") + ">".Length; 
					gridMarkup = gridMarkup.Insert(insertPoint, "<thead>");
					
					// In case of topmost pager, the THEAD includes pager and first row
					// <thead>
					//   <tr>pager</tr>
					//   <tr>header</tr>
					// </thead>
					insertPoint = gridMarkup.IndexOf("</tr>") + "</tr>".Length; 
					if (hasTopMostPager)
						insertPoint = gridMarkup.IndexOf("</tr>", insertPoint) + "</tr>".Length;
					
					gridMarkup = gridMarkup.Insert(insertPoint, "</thead><tbody>");

					// In case of a bottom pager and/or a footer, wrap them into a TFOOT section
					bool tFootNeeded = (ShowFooter || hasBottomPager); 

					// No TFOOT needed
					if (!tFootNeeded)
						gridMarkup = gridMarkup.Replace("</table>", "</tbody></table>");
					else
					{
						// Grab the string after <tbody>
						insertPoint += "</thead><tbody>".Length;
						string tbody = gridMarkup.Substring(insertPoint);

						// Truncates gridMarkup
						gridMarkup = gridMarkup.Substring(0, insertPoint-1); 

						// Split the string into an array of <tr>
						Regex r = new Regex("<tr>");  
						string[] trs = r.Split(tbody);

						// Both footer elements have been specified
						int insertBeginTag = trs.Length-1;
						if (ShowFooter && hasBottomPager)
							insertBeginTag -= 1;

						// Rebuild the string
						StringBuilder sb = new StringBuilder(gridMarkup);
						for(int i=0; i<trs.Length; i++)
						{
							string s = trs[i];
							if (i != insertBeginTag)
								sb.AppendFormat("<tr>{0}", s);
							else
								sb.AppendFormat("</tbody><tfoot><tr>{0}", s);
						}
						sb.Append("</tfoot></table>");
						gridMarkup = sb.ToString();
					}
					
					// Output the markup
					if (SmartClientRendering && EnableClientSort)
						gridMarkup = String.Format("<div id=\"{0}\" style=\"visibility:hidden\">{1}</div>", 
							"__main_" + ID, gridMarkup);
					
					output.Write(gridMarkup);
					return;
				}

				base.Render(output);
				return;
			}
			// *************************************************************
		}


		#region Custom Column Comparer Class
		public class ColumnComparer : IComparer  
		{
			public ColumnComparer(string order)
			{
				ColumnsOrder = order.Split(',');
			}

			private string[] ColumnsOrder;


			int IComparer.Compare(object x, object y)  
			{
				DataGridColumn dgc1 = (DataGridColumn) x;
				int indexOf1 = Array.IndexOf(ColumnsOrder, dgc1.HeaderText);

				DataGridColumn dgc2 = (DataGridColumn) y;
				int indexOf2 = Array.IndexOf(ColumnsOrder, dgc2.HeaderText);

				if (indexOf1 < indexOf2)
					return -1;
				if (indexOf1 == indexOf2)
					return 0;
				else
					return 1;
			}
		}

		#endregion


		#endregion
	}
}
