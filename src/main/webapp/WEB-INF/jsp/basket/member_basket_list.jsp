<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="member_order_box">
	
	<h1 class="text-center mb-5">cart</h1>
	<%--장바구니가 비었을때 --%>
	<c:if test="${empty basketViewList}">
	<h1 class="text-center">장바구니가 비어있습니다.</h1>
		<div class="d-flex justify-content-center mt-5">
			<a href="/product/main_view" class="btn btn-outline-primary col-4">쇼핑하러 가기</a>
		</div>
	</c:if>
	
	<%--장바구니가 있을때 --%>
	<c:if test="${not empty basketViewList}">
	<c:forEach items="${basketViewList}" var="basket" varStatus="status">
		<div class="d-flex justify-content-between align-items-center">
			<h1>${status.count}</h1>
			<div class="basket_delete">
				<button class="delete_basket btn btn-outline-dark" data-basket-id="${basket.basket.id}">Delete</button>
			</div>
		</div>
		<table class="table text-center">
		<thead class="thead-light">
			<tr>
				<th>상품 이름</th>
				<th>수량</th>
				<th>사이즈</th>
				<th>상품 금액</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><a href="/product/shop_detailed_view?type=${basket.product.type}&productId=${basket.product.id}">${basket.product.productName}</a></td>
				<td>${basket.basket.count}</td>
				<td>${basket.basket.size}</td>
				<td>
					<fmt:formatNumber value="${basket.basket.price}" />원
				</td>
			</tr>
		</tbody>
	</table>	
	<hr>
	</c:forEach>
	
	<div class="mt-4">
		<div class="d-flex justify-content-center">
		<button id="allOrder" class="btn btn-primary col-6" data-basket-number="${basketNumber}">전체 구매하기</button>
		</div>
	</div>
	</c:if>
</div>


<script>
$(document).ready(function(e){
	$(".delete_basket").on('click', function(e){
		let basketId = $(this).data("basket-id");
		
		$.ajax({
			type:"DELETE"
			, url: "/basket/nonMember_delete_basket"
			, data: {"basketId":basketId}
			, success: function(data){
				if (data.result == "success"){
					location.reload();
				} else if (data.result == "fail") {
					alert("장바구니 삭제를 실패했습니다. 다시 시도해주세요.");
					location.reload();
				}
			}
			, error: function(e){
				alert("error");
			}
		});
	});

	$("#allOrder").on('click', function(e){
		let basketNumber = $(this).data("basket-number");
		location.href="/order/order_member_view?basketNumber=" + basketNumber;	
	});
});

</script>