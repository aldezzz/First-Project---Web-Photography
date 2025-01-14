<!-- Printing -->
	<link rel="stylesheet" href="css/printing.css">
		
<?php
session_start();
error_reporting(0);
include('includes/config.php');
include('includes/format_rupiah.php');
include('includes/library.php');
if($_GET) {
	$Kode = $_GET['code'];
	$sqlsewa = "SELECT transaksi.*,paket.*,member.* FROM transaksi, paket, member WHERE transaksi.id_paket=paket.id_paket
				AND transaksi.email=member.email AND transaksi.id_trx='$Kode'";
	$querysewa = mysqli_query($koneksidb,$sqlsewa);
	$result = mysqli_fetch_array($querysewa);
	$bukti=$result['bukti_bayar'];
}
else {
	echo "Transaction Number Unreadable	";
	exit;
}
?>
<html>
<head>
</head>
<body>
<div id="section-to-print">
<div id="only-on-print">
	<h2>Booking Details</h2>
</div>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button>
	<h4 class="modal-title" id="myModalLabel">Booking Details</h4>
</div>
<div><br/></div>
<table width="100%">
	<tr>
		<td width="20%"><b>Booking Codes</b></td>
		<td width="2%"><b>:</b></td>
		<td width="78%"><?php echo $result['id_trx'];?></td>
	</tr>
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<tr>
		<td width="20%"><b>Member</b></td>
		<td width="2%"><b>:</b></td>
		<td width="78%"><?php echo $result['nama_user'];?></td>
	</tr>
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<tr>
		<td width="20%"><b>Packages</b></td>
		<td width="2%"><b>:</b></td>
		<td width="78%"><?php echo $result['nama_paket'];?></td>
	</tr>
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<tr>
		<td width="20%"><b>Date Taken</b></td>
		<td width="2%"><b>:</b></td>
		<td width="78%"><?php echo IndonesiaTgl($result['tgl_take']);?></td>
	</tr>
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<tr>
		<td width="20%"><b>Times</b></td>
		<td width="2%"><b>:</b></td>
		<td width="78%"><?php echo $result['jam_take'];?></td>
	</tr>
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<tr>
		<td width="20%"><b>Cost</b></td>
		<td width="2%"><b>:</b></td>
		<td width="78%"><?php echo format_rupiah($result['harga']);?></td>
	</tr>
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<tr>
		<td width="20%"><b>Status</b></td>
		<td width="2%"><b>:</b></td>
		<td width="78%"><?php echo $result['stt_trx'];?></td>
	</tr>
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<tr>
		<td width="20%"><b>Pay Date</b></td>
		<td width="2%"><b>:</b></td>
		<?php
			if($result['tgl_bayar']=="0000-00-00"){
		?>
			<td width="78%"> - </td>
			<?php
			}else{
			?>
			<td width="78%"><?php echo IndonesiaTgl($result['tgl_bayar']);?></td>
			<?php
			}
			?>
	</tr>
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<tr>
		<td width="20%"><b>Payment Proof</b></td>
		<td width="2%"><b>:</b></td>
		<?php
			if($bukti==""){
		?>
			<td width="78%">No proof of payment yet.</td>
			<?php
			}else{
			?>
			<td width="78%"><img src="../image/bukti/<?php echo htmlentities($result['bukti_bayar']);?>" width="120" height="150"></td>
			<?php
			}
			?>
	</tr>
</table>
	<div class="modal-footer">
	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	</div>

</div>

</body>
</html>