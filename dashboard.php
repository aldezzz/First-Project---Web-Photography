<?php
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['alogin'])==0)
	{	
header('location:index.php');
}
else{
	?>
<!doctype html>
<html lang="en" class="no-js">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="theme-color" content="#3e454c">
	
	<title>C. A. H Photography</title>
	<link rel="shortcut icon" href="img/C. A. H.png">

	<!-- Font awesome -->
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<!-- Sandstone Bootstrap CSS -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!-- Bootstrap Datatables -->
	<link rel="stylesheet" href="css/dataTables.bootstrap.min.css">
	<!-- Bootstrap social button library -->
	<link rel="stylesheet" href="css/bootstrap-social.css">
	<!-- Bootstrap select -->
	<link rel="stylesheet" href="css/bootstrap-select.css">
	<!-- Bootstrap file input -->
	<link rel="stylesheet" href="css/fileinput.min.css">
	<!-- Awesome Bootstrap checkbox -->
	<link rel="stylesheet" href="css/awesome-bootstrap-checkbox.css">
	<!-- Admin Stye -->
	<link rel="stylesheet" href="css/style.css">
</head>

<body>
<?php include('includes/header.php');?>

	<div class="ts-main-content">
<?php include('includes/leftbar.php');?>
		<div class="content-wrapper">
			<div class="container-fluid">

				<div class="row">
					<div class="col-md-12">

						<h2 class="page-title">Dashboard </a>
						</h2>

						<div class="row">
							<div class="col-md-12">
								<div class="row">

									<div class="col-md-4">
										<div class="panel panel-default">
											<div class="panel-body bk-info text-light">
												<div class="stat-panel text-center">
												<?php 
												$sqlbayar = "SELECT id_trx FROM transaksi WHERE stt_trx='Menunggu Pembayaran'";
												$querybayar = mysqli_query($koneksidb,$sqlbayar);
												$bayar=mysqli_num_rows($querybayar);
												?>
													<div class="stat-panel-number h1 "><?php echo htmlentities($bayar);?></div>
													<div class="stat-panel-title text-uppercase">Waiting for Payment</div>
												</div>
											</div>
											<a href="trx_bayar.php" class="block-anchor panel-footer text-center">Details &nbsp; <i class="fa fa-arrow-right"></i></a>
										</div>
									</div>
									
									<div class="col-md-4">
										<div class="panel panel-default">
											<div class="panel-body bk-success text-light">
												<div class="stat-panel text-center">
												<?php 
												$sqlkonfir = "SELECT id_trx FROM transaksi WHERE stt_trx='Menunggu Konfirmasi'";
												$querykonfir = mysqli_query($koneksidb,$sqlkonfir);
												$konfir=mysqli_num_rows($querykonfir);
												?>
													<div class="stat-panel-number h1 "><?php echo htmlentities($konfir);?>Waiting for Confirmation</div>
													<div class="stat-panel-title text-uppercase"></div>
												</div>
											</div>
											<a href="trx_konfirmasi.php" class="block-anchor panel-footer text-center">Details &nbsp; <i class="fa fa-arrow-right"></i></a>
										</div>
									</div>
									
									<div class="col-md-4">
										<div class="panel panel-default">
											<div class="panel-body bk-warning text-light">
												<div class="stat-panel text-center">
												<?php 
												$now = date('Y-m-d');
												$st = "Sudah Dibayar";
												$jadwal = "SELECT id_trx FROM transaksi WHERE tgl_take='$now' AND stt_trx='Sudah Dibayar'";
												$querypaket = mysqli_query($koneksidb,$jadwal);
												$paket=mysqli_num_rows($querypaket);
												?>
													<div class="stat-panel-number h1 "><?php echo htmlentities($paket);?></div>
													<div class="stat-panel-title text-uppercase">Today's Schedule</div>
												</div>
											</div>
											<a href="jadwal.php" class="block-anchor panel-footer text-center">Details &nbsp; <i class="fa fa-arrow-right"></i></a>
										</div>
									</div>
								</div>
							</div>
						</div>

						
							</div>
						</div>
					</div>
				</div>









			</div>
		</div>
	</div>

	<!-- Loading Scripts -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap-select.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/dataTables.bootstrap.min.js"></script>
	<script src="js/Chart.min.js"></script>
	<script src="js/fileinput.js"></script>
	<script src="js/chartData.js"></script>
	<script src="js/main.js"></script>
	
	<script>
		
	window.onload = function(){
    
		// Line chart from swirlData for dashReport
		var ctx = document.getElementById("dashReport").getContext("2d");
		window.myLine = new Chart(ctx).Line(swirlData, {
			responsive: true,
			scaleShowVerticalLines: false,
			scaleBeginAtZero : true,
			multiTooltipTemplate: "<%if (label){%><%=label%>: <%}%><%= value %>",
		}); 
		
		// Pie Chart from doughutData
		var doctx = document.getElementById("chart-area3").getContext("2d");
		window.myDoughnut = new Chart(doctx).Pie(doughnutData, {responsive : true});

		// Dougnut Chart from doughnutData
		var doctx = document.getElementById("chart-area4").getContext("2d");
		window.myDoughnut = new Chart(doctx).Doughnut(doughnutData, {responsive : true});

	}
	</script>
</body>
</html>
<?php } ?>