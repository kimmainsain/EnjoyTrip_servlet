<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/header.css">
<%-- jstl 사용하기 위한 코드 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 프로젝트의 context 경로를 편하게 사용하기 위한 코드 --%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<script>
		let root = "${root}";
</script>

<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${root}/main?action=mvhome"><img
				id="home_img" src="./img/logo.jpg" /></a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li class="active"><a href="${root}/main?action=mvhome">Home</a></li>
				<li><a href="${root}/main?action=mvsearchpage">Tourist</a></li>
				<li><a href="${root}/main?action=list">Forum</a></li>
			</ul>
			<c:if test="${empty userinfo }">
				<ul class="nav navbar-nav navbar-right">
					<li id="header_nav_confirm_off"><a
						href="${root}/main?action=mvlogin"><span
							class="glyphicon glyphicon-log-in"></span> Login</a></li>
					<li id="header_nav_confirm_off2"><a
						href="${root }/main?action=mvsignup"> 회원가입</a></li>
				</ul>
			</c:if>
			<%-- 로그아웃 버튼 눌렀을때 session invalid해야한다. --%>
			<c:if test="${not empty userinfo }">
				<ul class="nav navbar-nav navbar-right">
					<li id="header_nav_confirm_on"><a
						href="${root}/main?action=logout"><span
							class="glyphicon glyphicon-log-out"></span> Logout</a></li>
					<li id="header_nav_confirm_on2"><a
						href="${root}/main?action=mvmypage">마이페이지</a></li>
				</ul>
			</c:if>
		</div>
	</div>
</nav>
