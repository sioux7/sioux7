// Generelle Funktionen

function askDelete(url){
   if(url=='') { url = '#'; }
   var status;
   status=confirm('Wollen Sie dieses Objekt wirklich löschen?');
   if(status) document.location.href=url;
   else return false;
}

function switchZahlungsart(id) {
	$('.zahlungsarten').hide();
	$('#zahlungsart_'+id).slideToggle();
}