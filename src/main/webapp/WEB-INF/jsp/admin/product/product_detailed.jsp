<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Detailed View</title>
	<!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<!-- Ajax 쓰려면 전체의 jQuery가져와야 한다 -->
  <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="/static/css/admin_style.css">
</head>
<body>
	
	<section class="mt-5 ml-5 box2">
		<div>
		타입
		<select id="type">
			<option value="top" <c:if test="${productView.product.type == 'top'}"> selected="selected" </c:if>>top</option>
			<option value="bottom" <c:if test="${productView.product.type == 'bottom'}"> selected="selected" </c:if>>bottom</option>
			<option value="set" <c:if test="${productView.product.type == 'set'}"> selected="selected" </c:if>>set</option>
			<option value="etc" <c:if test="${productView.product.type == 'etc'}"> selected="selected" </c:if>>etc</option>
		</select>
		</div>
	
		<div>상품명
			<input id="productName" type="text" value="${productView.product.productName}">
		</div>
		
		<div>상품번호
			<input id="productNumber" type="text" value="${productView.product.productNumber}">
		</div>
	
		<div>상품가격
			<input id="price" type="text" value="${productView.product.price}">
		</div>
		
		<div>재고
			<input id="stock" type="text" value="${productView.product.stock}">
		</div>
		
		<div>색상
			<c:forEach items="${productView.color}" var="color">
				<c:set var="colorList" value="${color}" />
			</c:forEach>
				<label><input  type="checkbox" name="color" value="black" <c:if test="${fn:contains(colors, 'black')}"> checked="checked" </c:if>> Black</label>
				<label><input  type="checkbox" name="color" value="white" <c:if test="${fn:contains(colors, 'white')}"> checked="checked" </c:if> > White</label>
				<label><input  type="checkbox" name="color" value="blue"<c:if test="${fn:contains(colors, 'blue')}"> checked="checked" </c:if>> Blue</label>
				<label><input  type="checkbox" name="color" value="navy" <c:if test="${fn:contains(colors, 'navy')}"> checked="checked" </c:if>> Navy</label>
				<label><input  type="checkbox" name="color" value="pink" <c:if test="${fn:contains(colors, 'pink')}"> checked="checked" </c:if>> Pink</label>
				<label><input  type="checkbox" name="color" value="red" <c:if test="${fn:contains(colors, 'red')}"> checked="checked" </c:if>> Red</label>
		</div>
		
		<div>사이즈
			<c:forEach items="${productView.size}" var="size">
				<label><input  type="checkbox" name="size" value="s" <c:if test="${size.size == 's'}"> checked="checked" </c:if>> S</label>
				<label><input  type="checkbox" name="size" value="m" <c:if test="${size.size == 'm'}"> checked="checked" </c:if>> M</label>
				<label><input type="checkbox" name="size" value="l" <c:if test="${size.size == 'l'}"> checked="checked" </c:if> > L</label>
				<label><input type="checkbox" name="size" value="xl" <c:if test="${size.size == 'xl'}"> checked="checked" </c:if> > XL</label>
			</c:forEach>
		</div>

		<div>상품설명
		</div>
			<textarea id="content"></textarea>

		<div>상품사진</div>
		<div>1. 메인사진
			<input class="file" id="file1" type="file" multiple accept=".jpg,.gif,.jpeg,.png">
		</div>
		
		<div>2. 추가사진
			<input class="file" id="file2" type="file" accept=".jpg,.gif,.jpeg,.png">
		</div>
		<div>3. 추가사진
			<input class="file" id="file3" type="file" accept=".jpg,.gif,.jpeg,.png">
		</div>
		<div>4. 추가사진
			<input class="file" id="file4" type="file" accept=".jpg,.gif,.jpeg,.png">
		</div>
		<div>5. 추가사진
			<input class="file" id="file5" type="file" accept=".jpg,.gif,.jpeg,.png">
		</div>
		
		<div class="d-flex mt-5">
			<div class="mr-5">
				<a href="/admin/product/product_list_view" class="btn btn-primary">목록</a>
			</div>
			<div class="mr-5">
				<button type="button" id="clearBtn" class="btn btn-secondary">취소하기</button>
			</div>
			<div>
				<button type="button" id="uploadBtn" class="btn btn-primary">게시하기</button>
			</div>
		</div>
	</section>
</body>

</html>