<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>admin</title>
<%--ajax를 위한 jQuery --%>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/static/css/admin_style.css">

</head>
<body>
	<div class="box">
		<form>
		아이디
		<input type="text" id="adminId">
		비밀번호
		<input type="password" id="adminPassword">
		<button id="adminLoginBtn" type="button">로그인</button>
		
		</form>
	</div>
	
</body>

<script>
$(document).ready(function(e){
	$("#adminLoginBtn").on('click', function(e){
		e.preventDefault();
		let adminId = $("#adminId").val();
		let adminPassword = $("#adminPassword").val();
		
		if (adminId == "") {
			alert("아이디를 입력하세요.");
			return;
		}
		
		if (adminPassword == "") {
			alert("비밀번호를 입력하세요.");
			return;
		}
		
		$.ajax({
			type: "POST"
			, url: "/admin/sign_in"
			, data: {"adminId":adminId, "adminPassword":adminPassword}
			, success: function(data) {
				if (data.result == "success"){
					alert("로그인 성공");
					location.href="/admin/select_view"
				} else {
					alert("로그인 실패, 다시 시도하세요.");
					location.reload();
				}
			}
			, error: function(e){
				alert("error");
			}
		});
	});
});

</script>
</html>