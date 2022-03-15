<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--메인페이지의 배너 --%>
<div>
	<img id="mainImage" src="#" alt="main_images">
</div>

<%--랜덤 상품 6개 출력 --%>
<div class="mt-5 d-flex flex-wrap align-content-center justify-content-between random_product">
	<c:forEach begin="1" end="6" step="1">
		<img src="#" alt="random_product" class="mt-4">
	</c:forEach>
</div>

<script>
$(document).ready(function(e){
	
	//3초마다 메인사진 변경
//	let mainImages = ["1.jpg", "2.jpg", "3.jpg"]; 
	//let imagesIndex = 0;
	
	//setInterval(function(e){
	//	$("#mainImage").attr("src" , "/static/images/pole_main" + mainImages[imagesIndex]);
	//	imagesIndex++;
	//	if (imagesIndex > mainImages.length-1) { //3
	//		imagesIndex = 0;
	//	}
	//}, 3000);
});
</script>