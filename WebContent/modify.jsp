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
			<h4 class="mb-3">글 수정</h4>
			<form class="validation-form" action="${root}/main">
				<input type="hidden" name="action" value="modify"> 
				<input type="hidden" name="articleNo" value="${article.articleNo}">

				<div class="mb-3">
					<label for="subject" class="form-label">제목 : </label> <input
						type="text" class="form-control" id="subject" name="subject"
						value="${article.subject}" />
				</div>

				<div class="mb-3">
					<label for="content" class="form-label">내용 : </label>
					<textarea class="form-control" id="content" name="content" rows="7">${article.content}</textarea>
				</div>
				<hr class="mb-4">
				<div class="mb-4"></div>
				<div class="col-auto text-center">
					<button type="submit" class="btn btn-outline-primary mb-3">글수정</button>
					<button type="button" class="btn btn-outline-danger mb-3" onclick="location.href='${root}/main?action=list'">목록</button>
				</div>
			</form>
		</div>
	</div>
	<footer class="my-3 text-center text-small">
		<p class="mb-1">&copy; 2023 SangSub</p>
	</footer>
</div>
