<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1 class="text-center">비회원 주문 조회하기</h1>

<div class="signIn_box">
		<%--로그인 화면 --%>
		<form>
		<div class="mt-4 font-weight-bold">이름</div>
		<input type="text" id="name" class="form-control mt-2" placeholder="이름을 입력하세요.">

		<div class="mt-3 font-weight-bold">주문번호</div>
		<input type="password" id="orderNumber" class="form-control mt-2" placeholder="주문번호를 입력하세요.">
		
		<button type="submit" id="checkOrederNumber" class="btn btn-primary w-100 mt-4 font-weight-bold">조회하기</button>
		</form>
</div>
	