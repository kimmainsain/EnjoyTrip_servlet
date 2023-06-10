<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Info</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="./css/signup.css">
<%-- jstl 사용하기 위한 코드 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 프로젝트의 context 경로를 편하게 사용하기 위한 코드 --%>
<c:set var="root" value="${pageContext.request.contextPath}" />
</head>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">${userDetail.userName}의 회원정보 확인</h4>
				<form class="validation-form"
					style="background-color: #E1F6FA; border-radius: 8%;">
					<br>
					<div>
						<h5 class="mb-3">${userDetail.userName}님의 닉네임은 ${userDetail.userNick}입니다.
					</div>
					<br> <br>
					<div>
						<h5 class="mb-3">${userDetail.userName}님의 아이디는 ${userDetail.userId}입니다.
					</div>
					<br> <br>
					<div>
						<h5 class="mb-3">${userDetail.userName}님의 이메일은 ${userDetail.userEmail}입니다.
					</div>
					<br> <br>
					<div>
						<h5 class="mb-3">${userDetail.userName}님의 비밀번호는 ${userDetail.userPass}입니다.
					</div>
					<br>
					<button class="btn btn-primary btn-lg btn-block" type="button"
						onclick="location.href='${root}/main?action=mvmypage' ">
						돌아가기</button>
						<div class="col-auto text-center">
					<button type="button" class="btn btn-outline-success mb-3 ms-1"
						onclick="location.href='${root}/main?action=mvupdateuser'">회원 정보 변경</button>
					<button type="button" class="btn btn-outline-danger mb-3 ms-1"
						onclick="location.href='${root}/main?action=deleteUser'">회원 탈퇴</button>
						</div>
				</form>
			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">&copy; 2023 SangSub</p>
		</footer>
	</div>
</body>
</html>
