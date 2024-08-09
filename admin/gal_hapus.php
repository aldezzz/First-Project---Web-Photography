<?php
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['alogin'])==0){	
header('location:index.php');
}
else{
if(isset($_GET['id'])){
	$id	= $_GET['id'];
	$mySql	= "DELETE FROM galery WHERE id_galery='$id'";
	$myQry	= mysqli_query($koneksidb, $mySql);
	echo "<script type='text/javascript'>
			alert('Data successfully deleted!.'); 
			document.location = 'gallery.php'; 
		</script>";
}else {
	echo "<script type='text/javascript'>
			alert('Something went wrong, please try again!.'); 
			document.location = 'gallery.php'; 
		</script>";
}
}
?>