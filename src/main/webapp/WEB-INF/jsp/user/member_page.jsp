<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<div class="member_order_box">
	<%--admin은 로그아웃만 보여진다.--%>
	<c:if test="${memberId != 951011}">
	
	<%--회원 정보 --%>
    <h1 class="text-center">My Page</h1>
    <div class="d-flex justify-content-center align-items-center mt-5">
	    <div class="mr-5 user_page_font">
	    	이름<br>
	    	전화번호<br>
	    	이메일<br>
	    	주소
	    </div>
	    <div class="ml-3 user_page_font">
	    	${user.name}<br>
	    	${user.phoneNumber}<br>
	    	${user.email}<br>
	    	${user.address}
	    </div>
    </div>

    <div class="d-flex justify-content-center mt-5">
    	<button id="updateUserInfo" data-member-id="${user.id}" type="button" class="btn btn-secondary">개인 정보 수정하기</button>
    </div><hr>
    
    <%--마일리지 --%>
    <div>
	    <h1 class="text-center mt-4">My Mileage</h1>
	    <h3 class="text-center mt-2"><fmt:formatNumber value="${user.mileage}"/> 점</h3>
	    <div class="text-center"><small class="text-center text-danger">10,000점 이상부터 사용가능합니다.</small></div>
    </div><hr>
    
    
    <%--주문 정보 --%>
    <h1 class="text-center mt-5">Order</h1>
    <table class="table text-center mt-4">
    	<thead class="thead-light">
    		<tr>
    			<th>상품이름</th>
    			<th>수량</th>
    			<th>가격</th>
    			<th>구매일자</th>
    			<th></th>
    		</tr>
    	</thead>
    	<tbody>
    		<c:forEach var="memberPage" items="${memberPageViewList}">
    		<c:forEach var="order" items="${memberPage.orderProduct}" varStatus="status" >
    		<tr>
    			<td>${memberPage.product[status.index].productName}</td>
    			<td>${order.count}</td>
    			<td><fmt:formatNumber value="${order.price}"/> 원</td>
    			<td>
    				<fmt:formatDate value="${order.createdAt}" pattern="yyyy-MM-dd" />
    			</td>
    			<td>
    				<button class="goToReview btn btn-secondary" data-login-id="${memberLoginId}" data-product-id="${memberPage.product[status.index].id}" >리뷰 남기기</button>
    			</td>
    		</tr>
    		</c:forEach> 
    		</c:forEach>
    	</tbody>
    </table>


	 <%--리뷰정보 --%>
    <h1 class="text-center mt-5">Review</h1>
    <table class="table text-center mt-4">
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
				<td>${fn:length(reviewList) -status.index}</td>
				<td>${review.productName}</td>
				<td>
					<a href="/customer/review_detailed_view?reviewId=${review.id}">${review.subject}</a>
				</td>
				<td>${review.loginId}</td>
				<td>
					<fmt:formatDate value="${review.createdAt}" pattern="yyyy-MM-dd" />
				</td>
			</tr>
			</c:forEach>
		</tbody>    
    </table>


	</c:if>
	<%--로그아웃 --%>
	<div class="text-center mt-5">
		<button data-toggle="modal" data-target="#moreModal" class="btn btn-danger">로그아웃</button>
	</div>


</div>



<!-- Modal -->
<div class="modal fade" id="moreModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Log out</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        로그아웃시, 현재 들어있는 장바구니의 목록이 사라집니다.<br>
        정말 로그아웃 하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" id="logOutBtn" class="btn btn-primary" data-basket-number="${basketNumber}">네! 로그아웃합니다.</button>
      </div>
    </div>
  </div>
</div>

<script>
$(document).ready(function(e){
	
	//개인정보 수정
	$("#updateUserInfo").on('click', function(e){
		let memberId = $(this).data("member-id");
		location.href="/user/member_update_page_view?memberId=" + memberId;
	});
	
	//리뷰버튼
	$(".goToReview").on('click', function(e){
		let productId = $(this).data("product-id");
		let logindId = $(this).data("login-id");
		
		$.ajax({
			type:"GET"
			, url: "/customer/review_is_duplicate"
			, data: {"productId": productId, "logindId":logindId}
			, success: function(data){
				if(data.result == "success"){
					alert("이미 리뷰를 작성했습니다. 다른 상품의 리뷰를 작성해주세요.");
					location.reload();
				} else if (data.result == "fail") {
					location.href="/customer/review_create_view?productId=" + productId;
				}
			}
			, error: function(e){
				alert("error");
			}
		});
	});
	
	
	// 로그아웃
	$("#moreModal #logOutBtn").on('click', function(e){
		let basketNumber = $(this).data("basket-number");
		
		$.ajax({
			type: "GET"
			, url: "/user/sign_out"
			, data: {"basketNumber":basketNumber}
			, success: function(data) {
				if (data.result == "success") {
					alert("성공적으로 로그아웃했습니다. 또 찾아주세요");
					location.href="/product/main_view";
				} else if (data.result == "fail") {
					alert("로그아웃에 실패했습니다. 다시 시도해주세요.");
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