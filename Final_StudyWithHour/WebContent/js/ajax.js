// ajax.js


var ajax = null;

function createAjax()
{
	if (window.XMLHttpRequest)
		return new XMLHttpRequest();
	else if (window.ActiveXObject)
		return new ActiveXObject("Microsoft.XMLHTTP");
	else					
		return null;
}