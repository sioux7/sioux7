<script type="text/javascript" src="plugin/links/js/ModalPopups.js" language="javascript"></script>
<script type="text/javascript" language="javascript"> 
function ModalPopupsConfirm(site) {
	ModalPopups.Confirm("idConfirm1",
		"Weiterleitung",
		"<div style='padding: 25px;'>Sie werden nun weitergeleitet.<br/><br/><b>Sind Sie sicher?</b></div>", 
		{
			yesButtonText: "OK",
			noButtonText: "Abrechen",
			onYes: "ModalPopupsConfirmYes(\"" + site + "\")",
			onNo: "ModalPopupsConfirmNo()",
		}
	);
}

function ModalPopupsConfirmYes(site) {
	window.open(site,'','');
	ModalPopups.Close("idConfirm1");
}

function ModalPopupsConfirmNo() {
	// alert('You pressed No');
	ModalPopups.Cancel("idConfirm1");
}

</script>
<?php
$sql_query = "SELECT * FROM sioux7_links ORDER BY bereich";
$result = mysqli_query($GLOBALS['DB'],$sql_query);
?>
<table>
<tbody>
<tr><td class="normal"><u>Hinweis:</u> Bitte beachten Sie die Bestimmungen f&uuml;r Links im Impressum. <hr></td></tr>
<?php
while ($row = mysqli_fetch_array($result)) {
if ($row["bereich"] !="") {
?>
<tr>
	<td align="left">&raquo; <strong><?php echo $row["bereich"]; ?> :</strong><a href="javascript:ModalPopupsConfirm('<?php echo $row["link"]; ?>');" class="text">&nbsp;<?php echo $row["link"]; ?></a></td>
</tr>
 <tr>
        <td class="normal"><?php echo nl2br($row["descr"]); ?><hr></td>
</tr>
<?php
}}
?>
</tbody>
</table>
