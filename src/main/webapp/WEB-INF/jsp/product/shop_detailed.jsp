<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%--상단 사진과 상품구매가능정보 --%>
<div class="mt-5 d-flex justify-content-center">
	<div class="product_box">
		<img src="${mainImagePath}" alt="product_detailed_images">	
	</div>
	<div class="ml-5 product-content-box">
		<h1>${product.product.productName}</h1>
		<h4><fmt:formatNumber value="${product.product.price}" />원</h4>
		<br>
		
		<h6><b>사이즈</b></h6>
		 <select id="size" class="form-select">
		 	<option>[필수] 사이즈 선택</option>
		 	<c:forEach var="size" items="${product.size}">
		 	<option class="text-uppercase">${size.size}</option>
		 	</c:forEach>
		 </select>
		 
		<h6 class="mt-3"><b>색상</b></h6>
		 <select id="color" class="form-select">
		 	<option>[필수] 색상 선택</option>
		 	<c:forEach var="color" items="${product.color}">
		 	<option class="text-uppercase">${color.color}</option>
		 	</c:forEach>
		 </select>
		 
		 <h6 class="mt-3"><b>수량</b></h6>
		 <select id="count">
		 	<option>[필수] 수량 선택</option>
		 	<c:forEach var="count" begin="1" end="10" step="1">
		 	<option>${count}</option>
		 	</c:forEach>
		 </select><br>
		 <small class="text-danger">대량구매는 관리자에게 연락바랍니다.</small>
		 
		 <hr>
		 <div class="d-flex justify-content-between">
		 	<button id="purchase" data-product-price="${product.product.price}" data-member-id="${memberId}" data-product-id="${product.product.id}" type="button" class="btn btn-primary">구매하기</button>
		 	<button id="basket" data-product-id="${product.product.id}" type="button" class="btn btn-info mr-5">장바구니</button>
		 </div>
	</div>
</div>

<%--상품 디테일 설명 --%>
<div>
	<c:forEach var="images" items="${product.productImages}">
		<div class="d-flex justify-content-center detailed-product-box">
			<img src="${images.productImagePath}" alt="product-images">
		</div>
	</c:forEach>
	<div class="text-center mt-5">${product.product.content}</div>
</div>

<script>
$(document).ready(function(e) {
	//구매하기 버튼을 누를 경우
	$("#purchase").on('click', function(e){
		let size = $("#size").val();
		let color = $("#color").val();
		let count = $("#count").val();
		let productId = $(this).data("product-id");
		let memberId = $(this).data("member-id");
		let price = $(this).data("product-price");
		
		//validation check
		if (size == "") {
			alert("사이즈를 선택하세요.");
			return;
		}
		
		if (color == "") {
			alert("색상을 선택하세요.");
			return;
		}
		
		if (count == "") {
			alert("수량을 선택하세요.");
			return;
		}
		
		// 로그인 유무에 따라 다른 화면으로 보낸다.
		if (memberId == "") { //비로그인-로그인 창
			
			location.href="/order/sign_in_view";
		}
		
		if (memberId != "") { //로그인-구매하기로 넘어가기 
			$.ajax({
				type:"Get"
				, url: "/order/order_member"
				, data: {"productId":productId, "memberId":memberId, "size":size,
						"color":color, "count":count, "price":price}
				, success: function(data) {
					if(data.result == "success") {
						//let basketId = data.basketId;
						alert("구매 성공");
						//location.href="/order/order_member_view?basketId=" + basketId;
					} else if (data.result == "fail") {
						alert("구매하기에 실패했습니다. 다시 시도해주세요.");
						location.reload();
					}
				}
				, error: function(e){
					alert("error");
				}
			});
		}

	});
	
	//장바구니 버튼을 누를 경우
	$("#basket").on('click', function(e){
		let productId = $(this).data("product-id");
	});
});
</script>