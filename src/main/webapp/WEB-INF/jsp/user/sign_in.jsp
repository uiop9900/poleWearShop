<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1 class="text-center">로그인</h1>

<div class="signIn_box">
		<%--로그인 화면 --%>
		<form>
		<div class="mt-4 font-weight-bold">아이디</div>
		<input type="text" id="loginId" class="form-control mt-2" placeholder="아이디를 입력하세요.">

		<div class="mt-3 font-weight-bold">비밀번호</div>
		<input type="password" id="password" class="form-control mt-2" placeholder="비밀번호를 입력하세요.">
		
		<button type="button" id="loginBtn" class="btn btn-primary w-100 mt-4 font-weight-bold">로그인</button>
		</form>
		<%--가입하기, 주문조회 a태그 --%>
		<div class="mt-3 d-flex justify-content-between align-items-center">
			<div>
				<a href="/user/sign_up_view" class="text-primary font-weight-bold text-decoration-none">가입하기</a>
			</div>
			<div>
				<a href="/user/nonMember/orderNumber_check_view" class="text-danger font-weight-bold text-decoration-none">비회원 주문 조회</a>
			</div>
		</div>
</div>
	

<script>
$(document).ready(function(e){
	
	$("#loginBtn").on('click', function(e){
		
		//validation
		let loginId = $("#loginId").val();
		let password = $("#password").val();
		
		if(loginId == "") {
			alert("아이디를 입력해주세요.");
			return;
		}
		
		if(password == "") {
			alert("아이디를 입력해주세요.");
			return;
		}
		
		
		$.ajax({
			type: "POST"
			, url:"/user/sign_in"
			, data: {"loginId": loginId, "password":password}
			, success: function(data) {
				if (data.result == "success") {
					alert(data.successMessage);
					location.href="/product/main_view"
				} else if (data.result == "errorPassword") {
					alert(data.errorPasswordMessage);
					location.reload();
				} 
			}
			, error: function(e) {
				alert("아이디가 존재하지 않습니다.");
				location.reload();
			}
		});
		
	});
});
</script>