<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%--메인페이지의 배너 --%>
<div>
	<img id="mainImage" src="#" alt="main_images">
</div>

<%--랜덤 상품 6개 출력 --%>
<div class="mt-5 d-flex flex-wrap align-content-center justify-content-between product-box">
	<c:forEach var="product" items="${productList}">
		<div class="border mt-5">
			<a href="/product/shop_detailed_view?type=${type}&productId=${product.product.id}">
				<img src="${product.productImagePath}" alt="product_images">
			</a><br>
			<span class="product-text1">${product.product.productName}</span><br>
			<span class="product-text2"><fmt:formatNumber value="${product.product.price}" />원</span>
		</div>
	</c:forEach>
</div>

<script>
$(document).ready(function(e){
	
	//3초마다 메인사진 변경
	let mainImages = ["1.jpg", "2.jpg", "3.jpg"]; 
	let imagesIndex = 0;
	
	setInterval(function(e){
		$("#mainImage").attr("src" , "/static/images/pole_main" + mainImages[imagesIndex]);
		imagesIndex++;
		if (imagesIndex > mainImages.length-1) { //3
			imagesIndex = 0;
		}
	}, 3000);
});
</script>