<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://unpkg.com/balloon-css/balloon.min.css">

<%--회원가입 화면 --%>
<h1 class="text-center">회원가입</h1>
	<div class="signUp_box">
		<h3>기본정보</h3>
		
		<div class="d-flex justify-content-begin align-items-center mt-3">
			<div class="font-weight-bold col-2">아이디*</div>
			<input type="text"class="form-control col-6" placeholder="아이디를 입력하세요.">
			<button type="button" data-balloon-length="medium" aria-label="아이디는 최소 4글자에서 최대 14글자까지 가능합니다." data-balloon-pos="up" class="ml-4 btn-sm btn-outline-secondary col-2">중복확인</button>
		</div>
		
		<div class="d-flex justify-content-begin  align-items-center mt-3">
			<div class="font-weight-bold col-2">비밀번호*</div>
			<input type="password" class="form-control col-6" placeholder="비밀번호를 입력하세요.">
		</div>
		<small id="passwordRule" class="font-weight-bold text-primary block ml-5 col-">최소 8자 이상으로 영문, 숫자, 하나 이상의 특수문자를 혼합해서 입력해주세요.</small>
				
		<div class="d-flex justify-content-begin  align-items-center mt-3">
			<div class="font-weight-bold col-2">비밀번호 확인*</div>
			<input type="password" class="form-control col-6" placeholder="비밀번호를 재입력하세요.">
			<small class="text-success font-weight-bold ml-3 d-none">비밀번호가 일치합니다.</small>
			<small class="text-danger font-weight-bold ml-3">비밀번호가 불일치합니다.</small>
		</div>
		
		<div class="d-flex justify-content-begin  align-items-center mt-3">
			<div class="font-weight-bold col-2">이름*</div>
			<input type="text" class="form-control col-6" placeholder="이름을 입력하세요.">
		</div>
		
		<div class="d-flex justify-content-begin  align-items-center mt-3">
			<div class="font-weight-bold col-2">전화번호*</div>
			<input type="text" class="form-control col-6" placeholder="전화번호를 입력하세요.">
		</div>
		
		<div class="d-flex justify-content-begin  align-items-center mt-3">
			<div class="font-weight-bold col-2">이메일*</div>
			<input type="text" class="form-control col-6" placeholder="예) qicdk9382@naver.com">
		</div>
		
		<div class="d-flex justify-content-begin  align-items-center mt-3">
			<div class="font-weight-bold col-2">주소</div>
			<input type="text" class="form-control col-6" placeholder="주소를 입력해주세요.">
		</div>
		
		<br><hr><br>
		
		<div class="d-flex justify-content-begin  align-items-center mt-3">
			<div class="font-weight-bold col-2">성별*</div>
			<input type="radio" id="man" class="mr-2">
			<label for="man" class="mt-2">남성</label>
			<input type="radio" id="woman" class="ml-5">
			<label for="woman" class="mt-2">여성</label>
		</div>
		
		<div class="d-flex justify-content-begin  align-items-center mt-3">
			<div class="font-weight-bold col-2">생일</div>
			<input type="text" class="form-control col-6" placeholder="예) 20021028">
		</div>
		
		<button type="button" id="signUpBtn" class="btn btn-primary w-75 mt-4 font-weight-bold">가입하기</button>
</div>