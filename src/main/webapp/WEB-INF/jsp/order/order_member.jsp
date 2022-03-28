<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="member_order_box">
	<%--상품 상세 내역 --%>
	<h1>주문 상세 내역</h1>
	<table class="table mt-3 text-center border">
		<thead class="thead-light">
			<tr>
				<th>상품 이름</th>
				<th>수량</th>
				<th>상품 금액</th>
				<th>적립</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${basketViewList}" var="basket">
			<tr>
				<td>${basket.product.productName}</td>
				<td>${basket.basket.count}</td>
				<td>
					<fmt:formatNumber value="${basket.basket.price * basket.basket.count}"/> 
				원</td>
				<td>${basket.basket.price * basket.basket.count / 100}원</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<%--총 주문금액, 배송비 --%>
	<div class="d-flex justify-content-end">
		<h4>총 금액: <fmt:formatNumber value="${totalPrice}"/>원</h4>
		<c:choose>
		<c:when test="${deliveryFee == 0}" >
			<h4 class="ml-4">배송비: <fmt:formatNumber value="${deliveryFee}"/>원</h4>
		</c:when>
		<c:otherwise>
			<h4 class="ml-4">배송비: <fmt:formatNumber value="${deliveryFee}"/>원</h4>
		</c:otherwise>
		</c:choose>
	</div>
	<hr>
	
	<%--주문자 정보 --%>
	<h1>주문자 정보</h1>
	<div class="d-flex justify-content-begin  align-items-center mt-4">
		<div class="font-weight-bold col-2">주문하시는 분*</div>
		<input type="text" id="name" class="form-control col-6" value="${member.name}" disabled>
	</div>

	<div class="d-flex justify-content-begin  align-items-center mt-3">
		<div class="font-weight-bold col-2">휴대폰 번호*</div>
		<input type="text" id="phoneNumber" class="form-control col-6"  value="${member.phoneNumber}" disabled>
	</div>
	
	<div class="d-flex justify-content-begin  align-items-center mt-3">
		<div class="font-weight-bold col-2">이메일*</div>
		<input type="text" id="email" class="form-control col-6"  value="${member.email}" disabled>
	</div>
	
	<br><hr><br>
	
	<h1>배송지 정보</h1>
	<div class="mt-3 d-flex justify-content-begin">
		<div>
			<label class="font-weight-bold">회원정보와 동일<input type="radio" class="ml-1" value="same" name="deliveryOption"></label>
		</div>
		<div class="ml-4">
			<label class="font-weight-bold">새로운 배송지<input type="radio" class="ml-1" value="different"  name="deliveryOption"></label>
		</div>
	</div>
	
	<div class="d-flex justify-content-begin  align-items-center mt-3">
		<div class="font-weight-bold col-2">받으실 분*</div>
		<input type="text" id="deliveredName" data-name="${member.name}" class="form-control col-6" placeholder="이름을 입력하세요.">
	</div>
	
	<div class="d-flex justify-content-begin  align-items-center mt-3">
		<div class="font-weight-bold col-2">받으실 장소*</div>
		<input type="text" id="deliveredAddress" data-address="${member.address}" class="form-control col-6" placeholder="주소를 입력하세요.">
	</div>
	
	<div class="d-flex justify-content-begin  align-items-center mt-3">
		<div class="font-weight-bold col-2">휴대폰 번호*</div>
		<input type="text" id="deliveredPhoneNumber" data-phone-number="${member.phoneNumber}" class="form-control col-6" placeholder="예)01056785678">
	</div>
	
	<div class="d-flex justify-content-begin  align-items-center mt-3">
		<div class="font-weight-bold col-2">남기실 말씀</div>
		<input type="text" id="deliveredComment" class="form-control col-6" placeholder="예) 문 앞에 놔주세요.">
	</div>
	<hr>
	
	<h1 class="pt-3">결제 정보</h1>
	<table class="table border text-center mt-4">
		<tr>
			<th class="table-secondary">상품 합계 비용</th>
			<td><fmt:formatNumber value="${totalPrice}"/>원</td>
		</tr>
		<tr>
			<th class="table-secondary">배송비</th>
			<td><fmt:formatNumber value="${deliveryFee}"/>원</td>
		</tr>
		<tr>
			<th class="table-secondary">적립금</th>
			<td>${totalPrice / 100}원</td>
		</tr>
		<tr>
			<th class="table-secondary">최종 결제 금액</th>
			<td><fmt:formatNumber value="${totalPrice + deliveryFee}"/>원</td>
		</tr>
	</table>
	<hr>
	
	<h1 class="pt-3">일반 결제</h1>
	<div class="mt-5 d-flex justify-content-begin">
		<div>
			<label class="font-weight-bold">신용카드<input type="radio" class="ml-1" value="1" name="pay"></label>
		</div>
		<div class="ml-4">
			<label class="font-weight-bold">실시간 계좌이체<input type="radio" class="ml-1" value="2" name="pay"></label>
		</div>
		<div class="ml-4">
			<label class="font-weight-bold">휴대폰 결제<input type="radio" class="ml-1" value="3" name="pay"></label>
		</div>
	</div>
	
	<div class="mt-5">
		<button id="payBtn" data-delivery-fee="${deliveryFee}" data-member-id="${member.id}" data-basket-number="${basketNumber}" type="button" class="btn btn-primary w-100">결제하기</button>
	</div>
</div>

<script>
$(document).ready(function(e) {
	//배송지 정보
	$("input[name=deliveryOption]").on('change', function(e){
		let value = $(this).val();
		
		if (value == 'same') {
			$("#deliveredName").val($("#deliveredName").data("name"));
			$("#deliveredAddress").val($("#deliveredAddress").data("address"));
			$("#deliveredPhoneNumber").val($("#deliveredPhoneNumber").data("phone-number"));
			return;
		}
		
		if (value == 'different') {
			$("#deliveredName").val("");
			$("#deliveredAddress").val("");
			$("#deliveredPhoneNumber").val("");
			return;
		}
	});
	
	//결제하기 버튼
	$("#payBtn").on('click', function(e) {
		let deliveredName = $("#deliveredName").val();
		alert(deliveredName);
		let deliveredAddress = $("#deliveredAddress").val();
		let deliveredPhoneNumber = $("#deliveredPhoneNumber").val();
		let deliveredComment = $("#deliveredComment").val();
		let checkedPay = $('input:radio[name=pay]').is(':checked');
		let deliveryFee = $(this).data("delivery-fee");
		
		//validation
		if (deliveredName == "") {
			alert("받으실 분의 성함을 입력하세요.");
			return;
		}
		
		if (deliveredAddress == "") {
			alert("받으실 분의 주소를 입력하세요.");
			return;
		}
		
		if (deliveredPhoneNumber == "") {
			alert("받으실 분의 핸드폰 번호를 입력하세요.");
			return;
		}
		
		if (checkedPay == false) {
			alert("결제방법을 선택하세요.");
			return;
		}
		
		let name = $("#name").val();
		let phoneNumber = $("#phoneNumber").val();
		let email = $("#email").val();
		let memberId = $(this).data('member-id');
		let basketNumber = $(this).data('basket-number');
		alert(memberId);
		
		$.ajax({
			type: "GET"
			,url: "/order/order_member"
			,data: {"type":"member", "orderUserId":memberId, "basketNumber":basketNumber,"deliveryFee":deliveryFee, "deliveredName":deliveredName,
					"deliveredAddress":deliveredAddress, "deliveredPhoneNumber":deliveredPhoneNumber, "deliveredComment": deliveredComment}
			, success: function(data) {
				if (data.result == 'success') {
					alert("결제되었습니다. 감사합니다.");
					location.href="/product/main_view";
				} else {
					alert("결제에 실패했습니다. 관리자에게 문의하세요.");
					location.reload();
				}
			}
			, error: function(e) {
				alert("error");
			}
		});
	});
})

</script>