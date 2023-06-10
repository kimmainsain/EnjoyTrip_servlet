<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>SangminSub</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="./css/footer.css">
	<link rel="stylesheet" href="./css/header.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="./js/home.js" defer></script>
	<script src="./js/login.js" defer></script>

	<style>
		.carousel-inner img {
			width: 100%;
			/* Set width to 100% */
			margin: auto;
			height: 300px;
		}
	</style>
</head>

<body>
	<%@ include file="/include/nav.jsp" %>
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="./img/alley-89197.jpg" alt="Image" style="height: 800px;" href="">
			</div>

			<div class="item">
					<img src="./img/japan-2014618.jpg" alt="Image" style="height: 800px;">
			</div>

			<div class="item">
					<img src="./img/prague-3010407.jpg" alt="Image" style="height: 800px;">
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>

	<div class="container text-center">
		<h3>What We Do</h3><br>
		<div class="row">
			<div class="col-sm-4">
				<img src="./img/img01.jpg" class="img-responsive" style="width:100%" alt="Image">
			</div>
			<div class="col-sm-4">
				<img src="./img/img02.jpg" class="img-responsive" style="width:100%" alt="Image">
			</div>
			<div class="col-sm-4">
				<img src="./img/img03.jpg" class="img-responsive" style="width:100%" alt="Image">
			</div>
		</div>
	</div><br>
	<%@ include file="/include/footer.jsp" %>

</body>

</html>