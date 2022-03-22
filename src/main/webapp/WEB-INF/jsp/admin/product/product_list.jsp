<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product</title>

	<!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<!-- Ajax 쓰려면 전체의 jQuery가져와야 한다 -->
  <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="/static/css/admin_style.css">
</head>
<body>
	<div class="mt-5 ml-3">
	<select id="typeSelectBtn">
		<option>고르기</option>
		<option value="/admin/product/product_list_view?type=all">All</option>
		<option value="/admin/product/product_list_view?type=top">top</option>
		<option value="/admin/product/product_list_view?type=bottom">bottom</option>
		<option value="/admin/product/product_list_view?type=set">set</option>
		<option value="/admin/product/product_list_view?type=etc">etc</option>
	</select>
	</div>
	
	<h1 class="mt-4 ml-4">${type}</h1>
	
	<div class="mt-4 ml-3">
		<table class="table">
			<thead>
				<tr>
					<th>No.</th>
					<th>물품번호</th>
					<th>상품명</th>
					<th>생성일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${productList}" var="product" varStatus="status">
				<tr>
					<td>${product.id}</td>
					<td>${product.productNumber}</td>
					<td><a href="/admin/product/product_detailed_view?productId=${product.id}">${product.productName}</a></td>
					<td>
						<fmt:formatDate value="${product.createdAt}" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초" />
					</td>
				</tr>
				</c:forEach>
			</tbody>	
		</table>
	</div>
	
	<div class="mt-5 ml-3">
		<a href="/admin/product/product_create_view" class="btn btn-primary">글쓰기</a>
	</div>
</body>

<script>
$(document).ready(function(e){
	$("#typeSelectBtn").on('change', function(e){
		let url = $(this).val();
		location.href = url;
	});
});

</script>
</html>