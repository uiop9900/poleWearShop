<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<div class="member_order_box">
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
    </div>
    
    <h1 class="text-center mt-5">Order</h1>
    <table class="table text-center mt-4">
    	<thead class="thead-light">
    		<tr>
    			<th>상품이름</th>
    			<th>수량</th>
    			<th>가격</th>
    			<th>구매일자</th>
    		</tr>
    	</thead>
    	<tbody>
    		<c:forEach var="memberPage" items="${memberPageViewList}">
    		<c:forEach var="product" items="${memberPage.product}">
    		<c:forEach var="order" items="${memberPage.orderProduct}">
    		<tr>
    			<td>${product.productName}</td>
    			<td>${order.count}</td>
    			<td><fmt:formatNumber value="${order.price}"/> 원</td>
    			<td>
    				<fmt:formatDate value="${order.createdAt}" pattern="yyyy년 MM월 dd일" />
    			</td>
    		</tr>
    		</c:forEach>
    		</c:forEach>
    		</c:forEach>
    	</tbody>
    </table>

	<div class="text-center mt-5">
		<a id="logOutBtn" class="btn btn-danger" href="/user/sign_out">로그아웃</a>
	</div>
</div>

<script>
$(document).ready(function(e){
	$("#updateUserInfo").on('click', function(e){
		let memberId = $(this).data("member-id");
		location.href="/user/member_update_page_view?memberId=" + memberId;
	});
});

</script>