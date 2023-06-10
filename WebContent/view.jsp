<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="./css/signup.css">
<%-- jstl 사용하기 위한 코드 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 프로젝트의 context 경로를 편하게 사용하기 위한 코드 --%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<div class="container">
	<div class="input-form-backgroud row">
		<div class="input-form col-md-12 mx-auto">
			<h4 class="mb-3">글 보기</h4>
			<form class="validation-form">
				<div class="mb-3">
					<label for="email">제목</label>
					<h2 class="text-secondary px-5">${article.subject}</h2>
				</div>

				<div class="mb-3">
					<label for="address">내용</label>
					<h5 class="text-secondary px-5">${article.content}</h5>
				</div>
				<hr class="mb-4">
				<div class="mb-3">
					<span class="fw-bold">${article.userId}</span> <br /> <span
						class="text-secondary fw-light"> ${article.registerTime}
						조회수 : ${article.hit} </span>
				</div>

				<hr class="mb-4">
				<div class="mb-4"></div>
				<div class="col-auto text-center">
					<button type="button" class="btn btn-outline-primary mb-3"
						onclick="location.href='${root}/main?action=list'">글목록</button>
					<c:if test="${userinfo.userId eq article.userId}">
						<button type="button" class="btn btn-outline-success mb-3 ms-1"
							onclick="location.href='${root}/main?action=mvmodify&articleNo=${article.articleNo}'">글수정</button>
						<button type="button" class="btn btn-outline-danger mb-3 ms-1"
							onclick="location.href='${root}/main?action=delete&articleNo=${article.articleNo}'">글삭제</button>
					</c:if>
				</div>
			</form>
		</div>
	</div>
	<footer class="my-3 text-center text-small">
		<p class="mb-1">&copy; 2023 SangSub</p>
	</footer>
</div>
