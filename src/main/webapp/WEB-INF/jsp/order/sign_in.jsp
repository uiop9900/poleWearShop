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
				<a href="/order/order_nonMember_view?basketNumber=${basketNumber}" class="text-danger font-weight-bold text-decoration-none">비회원으로 주문하기</a>
			</div>
		</div>
</div>

<script>
$(document).ready(function(e){
	//로그인
	$("#loginBtn").on('click', function(e){
		
		//validation
		let loginId = $("#loginId").val();
		let password = $("#password").val();
		
		if(loginId == "") {
			alert("아이디를 입력해주세요.");
			return;
		}
		
		if(password == "") {
			alert("비밀번호를 입력해주세요.");
			return;
		}
		
		
		$.ajax({
			type: "POST"
			, url:"/user/sign_in"
			, data: {"loginId": loginId, "password":password}
			, success: function(data) {
				if (data.result == "success") {
					let memberId = data.memberId;
					let basketNumber = data.basketNumber;
					alert(data.successMessage);
					alert("멤버 전용의 주문하기 페이지로 넘어갑니다.");
					location.href="/order/order_member_view?basketNumber=" + basketNumber + "&memberId" + memberId;
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