<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="text" id="cuiId" placeholder="아이디"><br>
<input type="text" id="cuiPwd" placeholder="비밀번호"><br>
<button onclick="login()">로그인</button>

<script>
function login(){
	var xhr = new XMLHttpRequest();
	xhr.open('POST','/login');
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			console.log(xhr.responseText);
		}
	}
	var formData = new FormData();
	var cuiId = document.querySelector('#cuiId');
	var cuiPwd = document.querySelector('#cuiPwd');
	formData.append('cuiId',cuiId.value);
	formData.append('cuiPwd',cuiPwd.value);
	xhr.send(formData);
}
</script>
</body>
</html>