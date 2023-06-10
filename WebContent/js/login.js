function login() {
	console.log("login?")
	let idString = document.getElementById('id').value;
	let pwString = document.getElementById('password').value;
	console.log(idString);
	console.log(pwString);
	if (idString == "ssafy" && pwString == "1234") {
		alert("로그인 성공!!!");
		window.localStorage.setItem("id", idString);
		window.localStorage.setItem("password", pwString);
		window.open("./home.html");
		window.close();
	} else {
		alert("로그인 실패");
	}
}

function modal() {
	open("signUp.html", "투표 생성", "width=400px, height=500px");
}