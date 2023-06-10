<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Forum</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0-2/css/all.min.css"
	integrity="sha256-46r060N2LrChLLb5zowXQ72/iKKNiw/lAmygmHExk/o="
	crossorigin="anonymous" />
<link rel="stylesheet" href="./css/forum.css">
<link rel="stylesheet" href="./css/header.css">
<link rel="stylesheet" href="./css/footer.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="./js/home.js" defer></script>
<script src="./js/login.js" defer></script>

</head>

<body>
	<%@ include file="/include/nav.jsp"%>

	<div class="container">
		<div class="main-body p-0">
			<div class="inner-wrapper">

				<!-- Inner main -->
				<div class="inner-main">
					<!-- Inner main header -->
					<div class="inner-main-header">
						<a
							class="nav-link nav-icon rounded-circle nav-link-faded mr-3 d-md-none"
							href="#" data-toggle="inner-sidebar"><i
							class="material-icons"></i></a> <select
							class="custom-select custom-select-sm w-auto mr-1">
							<option selected="">Latest</option>
							<option value="1">Popular</option>
							<option value="3">Solved</option>
							<option value="3">Recommendation</option>
						</select> <span class="input-icon input-icon-sm ml-auto w-auto"> <input
							type="text"
							class="form-control form-control-sm bg-gray-200 border-gray-200 shadow-none mb-4 mt-4"
							placeholder="Search forum" />
						</span> <a href="${root }/main?action=mvwrite"
							style="text-decoration: none; display: block; width: 80px; line-height: 30px; text-align: center; background-color: #222; color: #fff;">글
							쓰기</a>

					</div>
					<!-- /Inner main header -->

					<!-- Inner main body -->

					<!-- Forum List -->
					<div class="inner-main-body p-2 p-sm-3 collapse forum-content show">
						<c:forEach var="article" items="${articles}">

							<div class="card mb-2">
								<div class="card-body p-2 p-sm-3">
									<div class="media forum-item">
										<a href="#" data-toggle="collapse"
											data-target=".forum-content"><img
											src="./img/profile.png" class="mr-3 rounded-circle"
											width="50" alt="User" /></a>
										<div class="media-body">
											<h6>
												<a
													href="${root}/main?action=mvview&articleNo=${article.articleNo}"
													data-toggle="collapse" data-target=".forum-content"
													class="text-body">${article.subject}</a>
											</h6>
											<p class="text-secondary">${article.content}</p>
											<p class="text-muted">
												<a href="javascript:void(0)">${article.userId}</a> replied <span
													class="text-secondary font-weight-bold">${article.registerTime}</span>
											</p>
										</div>
										<div class="text-muted small text-center align-self-center">
											<span class="d-none d-sm-inline-block"><i
												class="far fa-eye"></i> ${article.hit} </span> <span><i
												class="far fa-comment ml-2"></i> 0</span>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						<!-- /Inner main body -->
					</div>
					<!-- /Inner main -->
				</div>

			</div>
		</div>
		<%@ include file="/include/footer.jsp"%>
</body>

</html>