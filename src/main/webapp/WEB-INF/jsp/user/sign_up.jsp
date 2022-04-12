<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://unpkg.com/balloon-css/balloon.min.css">

<%--회원가입 화면 --%>
<h1 class="text-center">회원가입</h1>
	<div class="signUp_box">
		<h3>기본정보</h3>
		
		<div class="d-flex justify-content-begin align-items-center mt-3">
			<div class="font-weight-bold col-2">아이디*</div>
			<input type="text"class="form-control col-6" id="loginId" placeholder="아이디를 입력하세요.">
			<button type="button" id="isDupliId" data-balloon-length="medium" aria-label="아이디는 최소 4글자에서 최대 14글자까지 가능합니다." data-balloon-pos="up" class="ml-4 btn-sm btn-outline-secondary col-2">중복확인</button>
		</div>
			<small id="possibleId" class="text-success d-none">사용가능한 아이디 입니다.</small>
		
		<div class="d-flex justify-content-begin  align-items-center mt-3">
			<div class="font-weight-bold col-2">비밀번호*</div>
			<input type="password" id="password" class="form-control col-6" placeholder="비밀번호를 입력하세요.">
		</div>
		<small id="passwordRule" class="font-weight-bold text-primary block ml-5 col-">최소 8자 이상으로 영문, 숫자, 하나 이상의 특수문자를 혼합해서 입력해주세요.</small>
				
		<div class="d-flex justify-content-begin  align-items-center mt-3">
			<div class="font-weight-bold col-2">비밀번호 확인*</div>
			<input type="password" id="checkPassword" class="form-control col-6" placeholder="비밀번호를 재입력하세요.">
		</div>
		
		<div class="d-flex justify-content-begin  align-items-center mt-3">
			<div class="font-weight-bold col-2">이름*</div>
			<input type="text" id="name" class="form-control col-6" placeholder="이름을 입력하세요.">
		</div>
		
		<div class="d-flex justify-content-begin  align-items-center mt-3">
			<div class="font-weight-bold col-2">전화번호*</div>
			<input type="text" id="phoneNumber" class="form-control col-6" placeholder="예) 01011112222">
		</div>
		
		<div class="d-flex justify-content-begin  align-items-center mt-3">
			<div class="font-weight-bold col-2">이메일*</div>
			<input type="text" id="email" class="form-control col-6" placeholder="예) qicdk9382@naver.com">
		</div>
		
		<div class="d-flex justify-content-begin  align-items-center mt-3">
			<div class="font-weight-bold col-2">주소</div>
			<input type="text" id="address" class="form-control col-6" placeholder="주소를 입력해주세요.">
		</div>
		
		<br><hr><br>
		
		<div class="d-flex justify-content-begin  align-items-center mt-3">
			<div class="font-weight-bold col-2">성별*</div>
			<input type="radio" name="sex" id="man" value="man" class="mr-2">
			<label for="man" class="mt-2">남성</label>
			<input type="radio"  name="sex" id="woman" value="woman" class="ml-5">
			<label for="woman" class="mt-2">여성</label>
		</div>
		
		<div class="d-flex justify-content-begin  align-items-center mt-3">
			<div class="font-weight-bold col-2">생일</div>
			<input type="text" id="birth" class="form-control col-6" placeholder="예) 20021028">
		</div>
		
		<button type="button" id="signUpBtn" class="btn btn-primary w-75 mt-4 font-weight-bold">가입하기</button>
</div>


<script>
$(document).ready(function(e){
	
	//아이디 길이, 중복 확인
	$("#isDupliId").on('click', function(e){
		let loginId = $("#loginId").val();
		
		if (loginId.length < 4 || loginId.length > 11) {
			alert("아이디는 최소 4글자에서 최대 14글자까지 가능합니다.");
			$("#loginId").val("");
		}
		
		$.ajax({
			type: "POST"
			, url: "/user/is_duplicated_id"
			, data: {"loginId":loginId}
			, success: function(data){
				if(data.result > 0) {
					alert("중복된 아이디가 있습니다.");
				} else if (data.result == 0) {
					alert("사용가능한 아이디 입니다.");
					$("#possibleId").removeClass("d-none");
				}
			}
			, error: function(e){
				alert("error");
			}
		
		});
		
	});
	
	//비밀번호 정규식
	$("#password").blur(function(e){
		let password = $(this).val();
		let passwordRule = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
		let testResult = passwordRule.test(password)
		
 		if (testResult == false) {
			alert("최소 8자 이상으로 영문, 숫자, 하나 이상의 특수문자를 혼합해서 입력해주세요.");
			$(this).val("");
			return false;
		}
		
	});
		
	
	//가입하기
	$("#signUpBtn").on('click', function(e){
		
		//비밀번호 일치 확인와 validation
		let password = $("#password").val();
		let checkPassword = $("#checkPassword").val();
		
		if (password == "" || checkPassword == "") {
			alert("비밀번호를 입력하세요.");
		}
		
		if (password != checkPassword) {
			alert("비밀번호가 불일치합니다.");
			return
		}
		
		// 나머지 validation
		let loginId = $("#loginId").val()
		let name = $("#name").val();
		let phoneNumber = $("#phoneNumber").val();
		let email = $("#email").val();
		let address = $("#address").val();
		let birth = $("#birth").val();
		
		
		if($("#possibleId").hasClass("d-none")) {
			alert("중복확인 검사를 해주세요.");
			return;
		}
		
		if(name == "") {
			alert("이름을 입력하세요.");
			return;
		}
		
		if(phoneNumber == "") {
			alert("전화번호를 입력하세요.");
			return;
		}
		
		if(email == "") {
			alert("이메일을 입력하세요.");
			return;
		}
		
		
		let sex = $('input[name="sex"]:checked').val();
		if(sex == undefined) {
			alert("성별을 선택하세요.");
			return;
		}
		
		$.ajax({
			type: "POST"
			, url: "/user/sign_up"
			, data: {"loginId":loginId, "password":password, "name":name, "phoneNumber":phoneNumber, 
					"email":email, "sex":sex, "address":address, "birth":birth}
			, success: function(data) {
				if(data.result == 'success'){
					alert("회원가입이 완료되었습니다. 로그인 해주세요.");
					location.href="/user/sign_in_view";
				} else{
					alert("회원가입에 실패했습니다. 담당자에게 연락부탁드립니다.");
				}
			}
			, error: function(e) {
				alert("error");
			}
		});
	});
});

</script>