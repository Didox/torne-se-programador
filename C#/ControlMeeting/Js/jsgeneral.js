	/********************************************

	This lib sets a lot of variables used to
	make the lib as compatible as possible
	with all browsers.

	********************************************/

	/********************************************
	variables required for correct functionality
	********************************************/
	top.activemenu = null;
	top.showmenus = false;	

	/********************************************
	        Super trooper randomizer!!!!
	     Creates dinamic object valid names
		   Used in some JsObjects when no
	object is Senhaed as argument to addItem Methods
	********************************************/
	function randomizer()
	{
		var randomstr = "";
		var alpha = new Array("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z");
		for (js_i=0;js_i<32;js_i++)
		{
			var randomnumber=Math.floor(Math.random()*26);
			randomstr += alpha[randomnumber];
		}
		return randomstr;
	}

	/********************************************
	Don't even know if those should still exists
	Very bogus both of them
	********************************************/

	function getObjTop(obj, parentObj)
	{
		if (!parentObj)
			parentObj = document;
		var value = obj.offsetTop;
		if (obj.parentNode != parentObj)
			value += getObjTop(obj.parentNode, parentObj)
		return parseInt(value);
	}

	function getObjLeft(obj, parentObj)
	{
		if (!parentObj)
			parentObj = document;
		var value = obj.offsetLeft;			
		if (obj.parentNode != parentObj)
			value += getObjLeft(obj.parentNode,parentObj)
		return value;
	}

	/********************************************
				General use functions
	Some things we are always using, so why don't
	get then ready for use as part of the package?
	********************************************/
	/********************************************
	  Transfer itens from one listox to another
	********************************************/

	function transferListItens(sourceobj, targetobj)
	{
		var values = sourceobj.getValue();

		for (i in values)
		{
			var allvalues = sourceobj.getAllValues();
			for (j in allvalues)
			{
				if (values[i][0] == allvalues[j][0])
				{
					targetobj.addItem(values[i][0],values[i][1],values[i][2]);
					sourceobj.delItem(j);
				}
			}
		}
	}

	//This function should be changed to fit your needs.
	//It's used to detect if changes were made to the page
	//like field edition, for instance.
	function setHasChanges(e)
	{
		hasChanges = true;
	}

	//By default:
	hasChanges = false;
