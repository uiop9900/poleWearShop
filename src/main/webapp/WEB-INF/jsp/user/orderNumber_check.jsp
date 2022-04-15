<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1 class="text-center">비회원 주문 조회하기</h1>

<div class="signIn_box">
		<%--로그인 화면 --%>
		<form>
		<div class="mt-4 font-weight-bold">이름</div>
		<input type="text" id="name" class="form-control mt-2" placeholder="이름을 입력하세요.">

		<div class="mt-3 font-weight-bold">주문번호</div>
		<input type="text" id="orderNumber" class="form-control mt-2" placeholder="주문번호를 입력하세요.">
		
		<button type="submit" id="checkOrederNumber" class="btn btn-primary w-100 mt-4 font-weight-bold">조회하기</button>
		</form>
</div>

<script>
$(document).ready(function(e){
	$("#checkOrederNumber").on('click', function(e){
		let name = $("#name").val();
		let orderNumber = $("#orderNumber").val();
		
		if (name == "") {
			alert("이름을 입력하세요.");
			return;
		}
		
		if (orderNumber == "") {
			alert("주문번호를 입력하세요.");
			return;
		}
		
		$.ajax({
			type: "POST"
			, url: "/nonMember/check_orderNumber"
			, data: {"name":name, "orderNumber":orderNumber}
			, success: function(data) {
				if (data.result == 'success') {
					let orderNumber = data.orderNumber;
					location.href="/nonMember/orderNumber_check_result_view?orderNumber=" + orderNumber;
				} else if (data.result == 'fail') {
					alert("주문조회가 실패했습니다. 다시 시도해주세요.");
					location.reload();
				}
			}
			, error: function(e) {
				alert("error");
			}
		});
	});
});
</script>