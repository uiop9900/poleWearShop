<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
    <h1>${user.name}</h1>
    <c:forEach var="memberOrder" items="${memberPageViewList}">
		<h1>${memberOrder.order.id}</h1>
		<c:forEach var="product" items="${memberOrder.product}">
		<h1>${product.productName}</h1>
		</c:forEach>
		<c:forEach var="order" items="${memberOrder.orderProduct}">
		<h1>${order.count}</h1>
		</c:forEach>
		
	</c:forEach>

<a id="logOutBtn" href="/user/sign_out">로그아웃</a>

<script>
$(document).ready(function(e){

});

</script>