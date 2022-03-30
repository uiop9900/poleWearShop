<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="gnb" class="pt-5 w-100">
	<div class="d-flex justify-content-center align-items-center">
		<a href="/product/main_view" id="mainLogo" class="display-4 text-decoration-none font-weight-bold text-dark title">모두 다 폴웨어</a>
		<div id="userLogo">
			<c:choose>
			<c:when test="${not empty memberId}">
				<a href="/user/member_page_view?memberLoginId=${memberLoginId}"><img src="/static/images/user_logo.png" alt="user_logo"></a>
			</c:when>
			<c:otherwise>
				<a href="/user/sign_in_view"><img src="/static/images/user_logo.png" alt="user_logo"></a>
			</c:otherwise>
			</c:choose>
		</div>
		<div id="basket_logo">
			<c:choose>
				<c:when test="${empty basketNumber and empty memberLoginId}">
					<a href="/basket/basket/nothing_view"><img src="/static/images/basket_logo.png" alt="basket_logo"></a>
				</c:when>
				<c:when test="${empty basketNumber and not empty memberLoginId}">
					<a href="/basket/basket/nothing_view"><img src="/static/images/basket_logo.png" alt="basket_logo"></a>
				</c:when>
				<c:when test="${not empty basketNumber and not empty memberLoginId}" >
					<a href="/basket/basket/member_basket_list_view?basketNumber=${basketNumber}&memberId=${memberId}"><img src="/static/images/basket_logo.png" alt="basket_logo"></a>
				</c:when>
				<c:when test="${not empty basketNumber and empty memberLoginId}">
					<a href="/basket/basket/nonMember_basket_list_view?basketNumber=${basketNumber}"><img src="/static/images/basket_logo.png" alt="basket_logo"></a>
				</c:when>
			</c:choose>
		</div>
	</div>
	
	<nav class="dropdown mt-3">
		<ul class="nav nav-fill">
			<li class="nav-item"><a class="nav-link nav-font" href="#">best</a></li>
			<li class="nav-item shop-main"><a class="nav-link nav-font">shop</a>
				 <ul class="shop-sub nav flex-column">
					<li class="nav-item"><a class="nav-link" href="/product/shop_view?type=top">top</a></li>
					<li class="nav-item"><a class="nav-link" href="/product/shop_view?type=bottom">bottom</a></li>
					<li class="nav-item"><a class="nav-link" href="/product/shop_view?type=set">set</a></li>
					<li class="nav-item"><a class="nav-link" href="/product/shop_view?type=etc">etc</a></li>
				</ul> 
			</li>
			<li class="nav-item"><a class="nav-link nav-font" href="#">studio</a></li>
			<li class="nav-item"><a class="nav-link nav-font">customer</a>
				<ul class="shop-sub nav flex-column">
					<li class="nav-item"><a class="nav-link" href="#">Notice</a></li>
					<li class="nav-item"><a class="nav-link" href="/customer/review_list_view">Review</a></li>
					<li class="nav-item"><a class="nav-link" href="/customer/qna_list_view">QnA</a></li>
				</ul> 
			</li>
		</ul>
	</nav>
</div>
