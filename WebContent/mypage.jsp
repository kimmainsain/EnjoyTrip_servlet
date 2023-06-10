<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>my page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./css/footer.css">
<link rel="stylesheet" href="./css/mypage.css">
<link rel="stylesheet" href="./css/header.css">
<script src="./js/home.js" defer></script>
<script src="./js/login.js" defer></script>
</head>

<body>
	<%@ include file="/include/nav.jsp"%>
	<%-- jstl 사용하기 위한 코드 --%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%-- 프로젝트의 context 경로를 편하게 사용하기 위한 코드 --%>
	<c:set var="root" value="${pageContext.request.contextPath}" />
	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-3 sidenav">
				<h4>나만의 계획</h4>
				<ul class="nav nav-pills nav-stacked">
					<li><a href="#section1">서울</a></li>
					<li><a href="#section2">대전</a></li>
					<li><a href="#section3">대구</a></li>
					<li><a href="#section4">광주</a></li>
					<li><a href="#section5">부산</a></li>
					<li><a href="#section6">울산</a></li>
					<li><a href="#section7">세종특별자치시</a></li>
					<li><a href="#section8">경기도</a></li>
					<li><a href="#section9">강원도</a></li>
					<li><a href="#section10">충청북도</a></li>
					<li><a href="#section11">충청남도</a></li>
					<li><a href="#section12">경상북도</a></li>
					<li><a href="#section13">경상남도</a></li>
					<li><a href="#section14">전라북도</a></li>
					<li><a href="#section15">전라남도</a></li>
					<li><a href="#section16">제주도</a></li>
				</ul>
				<br>
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Search Area..">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</span>
				</div>
			</div>

			<div class="col-sm-9">
				<h4>
					<small>[마이페이지]</small>
				</h4>
				<hr>
				<h2>
				${userDetail.userNick}</h2>
				<h5>
					<span class="glyphicon glyphicon-time"></span> March 17, 2023.
				</h5>
				<h5>
					<span class="label label-danger">Food</span> <span
						class="label label-primary">Ipsum</span>
				</h5>
				<br>
				<div class="box">
					<img class="profile" src="./img/profile.png">
				</div>
				<br>
				<div class="box_text">${userDetail.userName}</div>

				<h4>
					<small>RECENT POSTS</small>
				</h4>
				<hr>
				<div class="for_me_buttons">
					<button class="plan_for_me" type="button" onclick="location.href='${root}/main?action=mvUserInfo' ">회원 정보 확인</button>
					<button class="heart_for_me" type="button">찜 목록</button>
				</div>
				<h5>
					<span class="glyphicon glyphicon-time"></span> Last Updated Jan 24,
					2023.
				</h5>
				<h5>
					<span class="label label-success">Lorem</span>
				</h5>
				<br>

				<div class="row">
					<div class="container">
						<h2>Wish List</h2>
						<div class="row">
							<div class="col-md-4">
								<div class="thumbnail">
									<img src="./heart_img/lake-1681485_1920.jpg" alt="Lights"
										style="width: 100%">
									<div class="caption">
										<h5>
											<span class="glyphicon glyphicon-time"></span> Last Updated
											Jan 24, 2023.
										</h5>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="thumbnail">
									<img src="./heart_img/mountains-100367_1920.jpg" alt="Nature"
										style="width: 100%">
									<div class="caption">
										<h5>
											<span class="glyphicon glyphicon-time"></span> Last Updated
											Jan 13, 2023.
										</h5>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="thumbnail">
									<img src="./heart_img/mountains-1587287_1920.jpg" alt="Fjords"
										style="width: 100%">
									<div class="caption">
										<h5>
											<span class="glyphicon glyphicon-time"></span> Last Updated
											Jan 2, 2023.
										</h5>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">
								<div class="thumbnail">
									<img src="./heart_img/nature-3040468_1920.jpg" alt="Lights"
										style="width: 100%">
									<div class="caption">
										<h5>
											<span class="glyphicon glyphicon-time"></span> Last Updated
											Oct 27, 2022.
										</h5>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="thumbnail">
									<img src="./heart_img/sea-164989.jpg" alt="Nature"
										style="width: 100%">
									<div class="caption">
										<h5>
											<span class="glyphicon glyphicon-time"></span> Last Updated
											june 21, 2022.
										</h5>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="thumbnail">
									<img src="./heart_img/tree-736885_1280.jpg" alt="Fjords"
										style="width: 100%">
									<div class="caption">
										<h5>
											<span class="glyphicon glyphicon-time"></span> Last Updated
											Feb 24, 2022.
										</h5>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/include/footer.jsp"%>

</body>

</html>