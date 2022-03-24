<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1 class="text-center">shop | ${type}</h1>

<div class="mt-5 d-flex flex-wrap align-content-center justify-content-between product-box">
	<c:forEach var="product" items="${productList}">
		<div class="border">
			<a href="/product/shop_detailed_view?type=${type}&productId=${product.product.id}">
			<img src="${product.productImagePath}" alt="product_images"><hr>
			<span class="product-text1">${product.product.productName}</span><br>
			<span class="product-text2">${product.product.price}원</span>
			</a>
		</div>
	</c:forEach>
</div>