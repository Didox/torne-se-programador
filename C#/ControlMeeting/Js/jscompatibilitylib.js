	/********************************************

	This lib sets a lot of variables used to
	make the lib as compatible as possible
	with all browsers.

	********************************************/

	/********************************************
				Browser detection
	********************************************/
	var browserType;
	var detect = navigator.userAgent.toLowerCase();
	var OS,version,total,thestring;

	function checkIt(string)
	{
		place = detect.indexOf(string) + 1;
		thestring = string;
		return place;
	}

	if (checkIt('konqueror')) browserType = "kq";
	else if (checkIt('safari')) browserType = "Safari";
	else if (checkIt('omniweb')) browserType = "OmniWeb";
	else if (checkIt('opera')) browserType = "Opera";
	else if (checkIt('webtv')) browserType = "WebTV";
	else if (checkIt('icab')) browserType = "iCab";
	else if (checkIt('msie')) browserType = "ie";
	else if (!checkIt('compatible')) browserType = "ns"
	else browserType = "An unknown browser";

	/********************************************
		 Blocks edition and mouse selection
	********************************************/

	function disableSelection()
	{
		document.onselectstart	= new Function ("return false");
		document.onmousedown 	= new Function ("return false");
	}

	function enableSelection()
	{
		document.onselectstart	= new Function ("return true");
		document.onmousedown 	= new Function ("return true");
	}

	//disableSelection();

	/********************************************
	   Equalizes event handling on IE and NS
	********************************************/
	//if (browserType == "ie")
		//e = event;
	//seems to be impossible... :-(
