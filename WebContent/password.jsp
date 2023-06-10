<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="./css/signup.css">
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:set var="root" value="${pageContext.request.contextPath}" />
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-18 mx-auto">
				<h4 class="mb-3">비밀번호 찾기</h4>
				<form class="validation-form" method = "post" action="${root }/main">
					<input type="hidden" name="action" value="pass">
					<div class="mb-3">
						<label for="id">아이디</label> <input class="form-control"
							id="userId" name="userId" placeholder="" required>
						<div class="invalid-feedback">아이디를 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="email">이메일</label> <input type="email"
							class="form-control" id="address" placeholder="you@example.com"
							name="userEmail" required>
						<div class="invalid-feedback">이메일을 입력해주세요.</div>
					</div>

					<button class="btn btn-primary btn-lg btn-block" type="submit">비밀번호
						찾기</button>
				</form>
			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">&copy; 2023 SangSub</p>
		</footer>
	</div>
</body>
</html>