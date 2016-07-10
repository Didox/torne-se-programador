
	//Model of jsobject. All should have at least those methods implemented
	JsDocument = function(name,location)
	{
		//JsObject properties
		this.name				= name;
		this.id					= "_" + this.name;
		this.type				= "JsDocument";
		this.menu				= null;
		this.parent				= null;
		this.childList			= new Array();

		//JsObject events
		this.events				= new Array();

		//JsObject main container
		if (!document.body)
		{
			document.write("<head><title></title></head><body></body>");
		}

		if( location == "" )
			this.output				= document.body;
		else
			this.output				= document.getElementById( location )
	}

	/********************************************
				  Exclusive Methods
	********************************************/
	JsDocument.prototype.setTitle = function(value)
	{
		document.title = value;
	}
	/********************************************
			   End of Exclusive Methods
	********************************************/

	/********************************************
				   Content Methods
	********************************************/

	JsDocument.prototype.addItem = function(obj)
	{
		this.childList[this.childList.length] = obj;
		obj.parent = this;
		this.output.appendChild(obj.output);
	}

	/********************************************
				End of Content Methods
	********************************************/

	/********************************************
				   Events Methods
	********************************************/

	JsDocument.prototype.setMenu = function()
	{
		this.output.menu = obj;
	}

	/********************************************
				End of Events Methods
	********************************************/