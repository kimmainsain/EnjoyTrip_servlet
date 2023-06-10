<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>여행지 검색</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="./css/footer.css">
	<link rel="stylesheet" href="./css/header.css">
	<link rel="stylesheet" href="./css/search.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="./js/home.js" defer></script>
	<script src="./js/login.js" defer></script>
</head>

<body>
	<%@ include file="/include/nav.jsp" %>
	<div>
		<h3 style="text-align: center;">우리동네 구석구석!!!</h3>
		<div class="col-md-12">
			<div class="alert alert-primary mt-3 text-center fw-bold" role="alert" style="font-size: 40px;">
				전국 관광지 정보
			</div>
			<!-- 관광지 검색 start -->
			<form class="d-flex my-3" onsubmit="return false;" role="search" id="search-form">
				<select id="search-sido" class="form-select" onchange="getGugun()">
					<option value="0" selected>검색 할 지역 선택(시/도)</option>
				</select>
				<select id="search-gugun" class="form-select">
					<option value="0" selected>검색 할 지역 선택(구/군)</option>
				</select>
				<select id="search-content-id" class="form-select">
					<!-- <option value="0" selected>관광지 유형</option> -->
					<option value="12">관광지</option>
					<option value="14">문화시설</option>
					<option value="15">축제공연행사</option>
					<option value="25">여행코스</option>
					<option value="28">레포츠</option>
					<option value="32">숙박</option>
					<option value="38">쇼핑</option>
					<option value="39">음식점</option>
				</select>
				<input id="search-keyword" class="form-control me-2" type="search" placeholder="검색어" aria-label="검색어" />
				<button id="btn-search" class="btn btn-outline-success" type="button">검색</button>
			</form>
			<!-- kakao map start -->
			<div id="map" class="mt-3" style="width: 100%; height: 600px"></div>
			<!-- kakao map end -->
			<div class="row">
				<table class="table table-striped" style="display: none">
					<thead>
						<tr>
							<th>대표이미지</th>
							<th>관광지명</th>
							<!--<th>주소</th>
							<th>위도</th>
							<th>경도</th> -->
						</tr>
					</thead>
					<tbody id="trip-list"></tbody>
				</table>
			</div>
			<!-- 관광지 검색 end -->
		</div>
	</div>

	
	<%@ include file="/include/footer.jsp" %>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3594d16165618fe879c8f5134fd78758&libraries=services,clusterer,drawing"></script>
	<script src="./js/key.js"></script>
	<script src="./js/search.js"></script>
</body>

</html>