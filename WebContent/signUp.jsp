<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sign Up</title>
<link rel="stylesheet" href="./css/signup.css">
<script src="./js/signup.js" defer></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous">
</head>

<body>
    <%-- jstl 사용하기 위한 코드 --%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%-- 프로젝트의 context 경로를 편하게 사용하기 위한 코드 --%>
    <c:set var="root" value="${pageContext.request.contextPath}" />

    <div class="container">
        <div class="input-form-backgroud row">
            <div class="input-form col-md-18 mx-auto">
                <h4 class="mb-3">회원가입</h4>
                <form class="validation-form" action="${root }/main">
                    <input type="hidden" name="action" value="regist">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="name">이름</label> <input type="text"
                                class="form-control" id="name" name="userName" placeholder=""
                                value="" required>
                            <div class="invalid-feedback">이름을 입력해주세요.</div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="nickname">닉네임</label> <input type="text"
                                class="form-control" id="nickname" name="userNick"
                                placeholder="" value="" required>
                            <div class="invalid-feedback">닉네임을 입력해주세요.</div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="email">이메일</label> <input type="email"
                            class="form-control" id="email" name="userEmail"
                            placeholder="you@example.com" required>
                        <div class="invalid-feedback">이메일을 입력해주세요.</div>
                    </div>

                    <div class="mb-3">
                        <label for="address">아이디</label> <input type="text"
                            class="form-control" id="address" placeholder="" name="userId"
                            required>
                        <div class="invalid-feedback">아이디를 입력해주세요.</div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="password">비밀번호</label> <input type="password"
                                class="form-control" id="pw" name="userPass" placeholder=""
                                value="" onchange="check_pw()" required>

                            <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="password">비밀번호 확인</label> <input type="password"
                                class="form-control" id="pw2" name="userPass2" placeholder=""
                                value="" onchange="check_pw()" required>

                            <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <span id="check"></span>
                    </div>
                    <hr class="mb-4">
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="aggrement"
                            required> <label class="custom-control-label"
                            for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
                    </div>
                    <div class="mb-4"></div>
                    <button class="btn btn-primary btn-lg btn-block" type="submit">가입
                        완료</button>

                </form>
            </div>
        </div>
        <footer class="my-3 text-center text-small">
            <p class="mb-1">&copy; 2023 SangSub</p>
        </footer>
    </div>
    <script>
        function check_pw(){
 
            var pw = document.getElementById('pw').value;
            if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
                if(document.getElementById('pw').value==document.getElementById('pw2').value){
                    document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                    document.getElementById('check').style.color='blue';
                }
                else{
                    document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                    document.getElementById('check').style.color='red';
                }
            }
        }
    </script>
</body>
</html>