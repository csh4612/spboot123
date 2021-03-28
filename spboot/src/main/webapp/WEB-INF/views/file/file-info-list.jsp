<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="text" id="fiiTitle" placeholder="제목"><br>
<input type="text" id="fiiContent" placeholder="내용"><br>
<button onclick="search()">검색</button>
<table border="1">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>사진</th>
	</tr>
	<tbody id="tBody">
	</tbody>
</table>

<c:if test="${customerInfo ne null }">
<button onclick="location.href='/views/file/file-info-insert'">등록</button>
</c:if>

<script>
/* 홈페이지 관리자라 치면
 * 유저테이블에 저장 관리자, 유저를 나눠서 들어갈 수 있게 없게 나눔. 
 */
function search(){
	var xhr = new XMLHttpRequest();
	var param = '?';
	if(document.querySelector('#fiiTitle').value.trim()){
		param += 'fiiTitle=' + document.querySelector('#fiiTitle').value.trim() + '&';
	}
	if(document.querySelector('#fiiContent').value.trim()){
		param += 'fiiContent=' + document.querySelector('#fiiContent').value.trim() + '&';
	}
	xhr.open('GET','/file-infos' + param);
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4 && xhr.status==200){
			console.log(xhr.responseText);
			var res = JSON.parse(xhr.responseText);
			var html = '';
			for(var fi of res){
				html += '<tr onclick="location.href=\'/views/file/file-info-view?fiiNum=' + fi.fiiNum + '\'" style="cursor:pointer">';
				html += '<td>' + fi.fiiNum + '</td>';
				html += '<td>' + fi.fiiTitle + '</td>';
				html += '<td><img src="/resources/' + fi.fiiFilePath + '" width="50"></td>';
				html += '</tr>';
			}
			document.querySelector('#tBody').innerHTML = html;
		}
	}
	xhr.send();
}
window.onload = search;
</script>
</body>
</html>