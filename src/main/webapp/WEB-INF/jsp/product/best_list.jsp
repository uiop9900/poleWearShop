<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<h1 class="text-center">shop | BEST</h1>

<div class="mt-5 d-flex flex-wrap align-content-center justify-content-between product-box">
	<c:forEach var="product" items="${productList}">
		<div class="border mt-5">
			<a href="/product/shop_detailed_view?type=${product.product.type}&productId=${product.product.id}">
				<img src="${product.productImagePath}" alt="product_images">
			</a><br>
			<span class="product-text1">${product.product.productName}</span><br>
			<span class="product-text2"><fmt:formatNumber value="${product.product.price}" />원</span>
		</div>
	</c:forEach>
</div>
