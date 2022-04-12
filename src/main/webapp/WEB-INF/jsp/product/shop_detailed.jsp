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
		

		<%--etc는 사이즈와 색상을 선택하지 못한다. --%>
		<h6><b>사이즈</b></h6>
		<c:choose>
		<c:when test="${type == 'etc'}">
			 <select id="size" class="form-select" disabled>
		 		<option>Free</option>
			</select>
		</c:when>
		<c:otherwise>
		<select id="size" class="form-select">
		 	<option>[필수] 사이즈 선택</option>
		 	<c:forEach var="size" items="${product.size}">
		 	<option class="text-uppercase">${size.size}</option>
		 	</c:forEach>
		 </select>
		 </c:otherwise>
		 </c:choose>
		 
		<h6 class="mt-3"><b>색상</b></h6>
		<c:choose>
		<c:when test="${type == 'etc'}">
			 <select id="size" class="form-select" disabled>
		 		<option>Free</option>
			</select>
		</c:when>
		<c:otherwise>
		 <select id="color" class="form-select">
		 	<option>[필수] 색상 선택</option>
		 	<c:forEach var="color" items="${product.color}">
		 	<option class="text-uppercase">${color.color}</option>
		 	</c:forEach>
		 </select>
		 </c:otherwise>
		 </c:choose>
		 
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
		 	<button id="basket" data-product-price="${product.product.price}" data-member-id="${memberId}"  data-product-id="${product.product.id}" type="button" class="btn btn-info mr-5">장바구니</button>
		 </div>
	</div>
</div>

<%--상품 디테일 설명 --%>
<div>
	<c:forEach var="images" items="${product.productImages}" varStatus="status">
		<div class="d-flex justify-content-center detailed-product-box">
			<img src="${images.productImagePath}" alt="product-images"><br>
		</div>
			<div class="text-center">제품 상세 사진${status.count}</div>
	</c:forEach>
	<div class="text-center mt-5 product-detailed-content-box">${product.product.content}</div>
</div><hr>


<%--상품의 리뷰 --%>
<div class="member_order_box mt-5">
 <h1 class="text-center">Review</h1>
 <%--없을시, 문구 출력 --%>
 <c:if test="${empty reviewList}"> 
 	<h5 class="text-center">아직 작성된 리뷰가 없습니다.</h5>
 </c:if>
 <%--있으면 리뷰리스트 --%>
 <c:if test="${not empty reviewList}" >
 <table class="table text-center mt-5">
    	<thead class="thead-light">
    		<tr>
    			<th>No.</th>
    			<th>상품명</th>
    			<th>제목</th>
    			<th>작성자</th>
    			<th>작성일</th>
    		</tr>
    	</thead>
		<tbody>
			<c:forEach var="review" items="${reviewList}" varStatus="status">
			<tr>
				<td>
					${reviewNumber - first - status.index}
				</td>
				<td>${review.productName}</td>
				<td><a href="/customer/review_detailed_view?reviewId=${review.id}&productId=${product.product.id}&productName=${product.product.productName}&image=${mainImagePath}&price=${product.product.price}">
					${review.subject}
				</a></td>
				<td>${review.loginId}</td>
				<td>
					<fmt:formatDate value="${review.createdAt}" pattern="yyyy-MM-dd" />
				</td>
			</tr>
			</c:forEach>
		</tbody>    
    </table>
</c:if>
    <%--number 페이징 --%>
	<c:set var="lastPage" value="${Math.ceil(reviewNumber / 5)}"/>
	<div class="mt-5 text-center paging">
		<c:forEach var="page" begin="1" end="${lastPage}" step="1">
				<a class="page" data-current-page="${page}" href="/product/shop_detailed_view?type=${type}&productId=${product.product.id}&vpage=${page}">${page}</a>
		</c:forEach>
	</div>
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
		
		if (memberId == "") {
			memberId = 0;
		}
		
		// 로그인 유무에 따라 다른 화면으로 보낸다.
		$.ajax({
			type:"Get"
			, url: "/order/order/basket_list"
			, data: {"productId":productId, "memberId":memberId, "size":size,
					"color":color, "count":count, "price":price}
			, success: function(data) {
				if(data.memberId != 0 && data.result == "success") {
					//로그인 회원이 구매하기
					let basketNumber = data.basketNumber;
					alert("구매 성공");
					location.href="/order/order_member_view?basketNumber=" + basketNumber;
				} else if(data.memberId == 0 && data.result == 'success') {
					//비회원이 구매하기
					let basketNumber = data.basketNumber;
					location.href="/order/sign_in_view?basketNumber=" + basketNumber;
				}
				
				else if (data.result == "fail") {
					alert("구매하기에 실패했습니다. 다시 시도해주세요.");
					location.reload();
				}
			}
			, error: function(e){
				alert("error");
			}
		});

	});
	
	//장바구니 버튼을 누를 경우
	$("#basket").on('click', function(e){
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
		
		if (memberId == "") {
			memberId = 0;
		}
		
		
		// 로그인 유무에 따라 다른 화면으로 보낸다.
		$.ajax({
			type:"Get"
			, url: "/basket/basket_list"
			, data: {"productId":productId, "memberId":memberId, "size":size,
					"color":color, "count":count, "price":price}
			, success: function(data) {
				if(data.memberId != 0 && data.result == "success") {
					//로그인 회원이 구매하기
					let basketNumber = data.basketNumber;
					let memberId = data.memberId;
					alert("장바구니로 이동합니다.");
					location.href="/basket/basket/member_basket_list_view?basketNumber=" + basketNumber + "&memberId=" + memberId;
				} else if(data.memberId == 0 && data.result == 'success') {
					//비회원이 구매하기
					let basketNumber = data.basketNumber;
					location.href="/basket/basket/nonMember_basket_list_view?basketNumber=" + basketNumber;
				}
				else if (data.result == "fail") {
					alert("구매하기에 실패했습니다. 다시 시도해주세요.");
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