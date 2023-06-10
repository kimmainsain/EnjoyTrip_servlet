let on = document.getElementById("header_nav_confirm_on");
let off = document.getElementById("header_nav_confirm_off");
let on2 = document.getElementById("header_nav_confirm_on2");
let off2 = document.getElementById("header_nav_confirm_off2");

if (localStorage.getItem("id") == "ssafy") {
	off.style.display = "none";
	on.style.display = "block";
	off2.style.display = "none";
	on2.style.display = "block";
}

function logout() {
	window.localStorage.removeItem("id");
	window.localStorage.removeItem("password");
	off.style.display = "block";
	on.style.display = "none";
	off2.style.display = "block";
	on2.style.display = "none";
}

function modal() {
	open("signUp.html", "투표 생성", "width=400px, height=500px");
}