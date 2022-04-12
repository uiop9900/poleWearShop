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
		<b>타입</b>
		<select id="type">
			<option value="top" <c:if test="${productView.product.type == 'top'}"> selected="selected" </c:if>>top</option>
			<option value="bottom" <c:if test="${productView.product.type == 'bottom'}"> selected="selected" </c:if>>bottom</option>
			<option value="set" <c:if test="${productView.product.type == 'set'}"> selected="selected" </c:if>>set</option>
			<option value="etc" <c:if test="${productView.product.type == 'etc'}"> selected="selected" </c:if>>etc</option>
		</select>
		</div>
	
		<div class="mt-2"><b>상품명</b>
			<input id="productName" type="text" value="${productView.product.productName}">
		</div>
		
		<div class="mt-2"><b>상품번호</b>
			<input id="productNumber" type="text" value="${productView.product.productNumber}">
		</div>
	
		<div class="mt-2"><b>상품가격</b>
			<input id="price" type="text" value="${productView.product.price}">
		</div>
		
		<div class="mt-2"><b>재고</b>
			<input id="stock" type="text" value="${productView.product.stock}">
		</div>
		
		

		<div class="mt-2"><b>현재 색상:</b> 
				<c:forEach var="color" items="${productView.color}" >
					${color.color}
				</c:forEach>
				<br>
					<label><input type="checkbox" name="color" value="black">black</label>
					<label><input type="checkbox" name="color" value="white">white</label>
					<label><input type="checkbox" name="color" value="navy">navy</label>
					<label><input type="checkbox" name="color" value="blue">blue</label>
					<label><input type="checkbox" name="color" value="red">red</label>
					<label><input type="checkbox" name="color" value="pink">pink</label>
				
		</div>
		
		<div class="mt-2"><b>현재 사이즈:</b>
			<c:forEach var="size" items="${productView.size}">
				${size.size}
			</c:forEach>
			<br>
				<label><input type="checkbox" name="size" value="s">S</label>
				<label><input type="checkbox" name="size" value="m">M</label>
				<label><input type="checkbox" name="size" value="l">L</label>
				<label><input type="checkbox" name="size" value="xl">XL</label>
		</div>

		<div class="mt-2"><b>상품설명</b>
		</div>
			<textarea id="content">${productView.product.content}</textarea>

		<div class="mt-5"><b>현재 상품사진</b></div>
		
		<div class="d-flex justify-content-begin">
		<c:forEach var="productImages" items="${productView.productImages}" varStatus="status">
			<c:if test="${not empty productImages.productImagePath}">
				<div class="border">
					<div class="ml-4">
						<img src="${productImages.productImagePath}" alt="product_images" width="200">
					</div>
					<div class="ml-2">
						<button class="imageDeleteBtn" type="button" class="btn btn-danger ml-3" data-product-id ="${productView.product.id}" data-image-path ="${productImages.productImagePath}" >삭제</button>
					</div>
				</div>
			</c:if>
		</c:forEach>
		</div>
	
		<div class="mt-5"><b>상품 추가 사진</b></div>
		<div>1. 상세사진
			<input class="file" id="file1" type="file" multiple accept=".jpg,.gif,.jpeg,.png">
		</div>
		
		<div>2. 상세사진
			<input class="file" id="file2" type="file" accept=".jpg,.gif,.jpeg,.png">
		</div>
		<div>3. 상세사진
			<input class="file" id="file3" type="file" accept=".jpg,.gif,.jpeg,.png">
		</div>
		<div>4. 상세사진
			<input class="file" id="file4" type="file" accept=".jpg,.gif,.jpeg,.png">
		</div>
		<div>5. 상세사진
			<input class="file" id="file5" type="file" accept=".jpg,.gif,.jpeg,.png">
		</div>
		
		<%--버튼 --%>
		<div class="d-flex mt-5">
			<div class="mr-5">
				<a href="/admin/product/product_list_view" class="btn btn-primary">목록</a>
			</div>
			<div class="mr-5">
				<button type="button" id="deleteBtn" class="btn btn-secondary" data-product-id="${productView.product.id}" >삭제하기</button>
			</div>
			<div>
				<button type="button" id="updateBtn" class="btn btn-primary" data-product-id="${productView.product.id}">수정하기</button>
			</div>
		</div>
	</section>
</body>
<script>
$(document).ready(function(e){
	
	//사진선택시 확장자 체크
	$(".file").on('change', function(e){
		let fileName = $(this).val();
		if (fileName != "") {
			let ext = fileName.split('.').pop().toLowerCase(); 
			if ($.inArray(ext, ['jpg', 'gif', 'png', 'jpeg']) == -1) {
				alert("gif, png, jpg, jepg 파일만 업로드 할 수 있습니다.");
				$("#file").val(""); 
				return;
			}
		}
	});
	
	// 게시물 삭제버튼을 누를때
	$("#deleteBtn").on('click', function(e){
		let productId = $(this).data("product-id");

		$.ajax({
			type: "DELETE"
			, url: "/admin/product/delete_product"
			, data: {"productId":productId}
			, success: function(data) {
				if (data.result == 'success') {
					alert("삭제되었습니다.");
					location.href="/admin/product/product_list_view";
				} else if (data.result == 'fail') {
					alert("상품삭제가 실패되었습니다. 다시한번 시도하세요.");
					location.reload();
				}
			}
			, error: function(e) {
				alert("error");
			}
		});

	});
	
	// 사진의 삭제 버튼을 누를때
	$(".imageDeleteBtn").on('click', function(e){
		let imagePath = $(this).data('image-path');
		let productId = $(this).data('product-id');
		
		$.ajax({
			type: "DELETE"
			, url: "/productImages/delete_productImages"
			, data: {"productId":productId, "imagePath":imagePath}
			, success: function(data) {
				if (data.result == "success") {
					alert("사진 삭제");
					location.reload();
				} else if (data.result == "fail") {
					alert("사진 삭제 실패");
				}
			}
			, error: function(e){
				alert("error");
			}
		});
	});
	
	// 수정하기 버튼을 누를때
	$("#updateBtn").on('click', function(e){
		let productId = $(this).data('product-id');
		
		// validation
		let type = $("#type").val();
		if (type == "") {
			alert("타입을 선택하세요.");
			return;
		}
		
		let colorArr = [];
		$("input:checkbox[name='color']:checked").each(function(){
			let color = $(this).val();
			colorArr.push(color);
		});

		let sizeArr = [];
		$("input:checkbox[name='size']:checked").each(function(){
			let size = $(this).val();
			sizeArr.push(size);
		});
		
		let productName = $("#productName").val();
		if (productName == "") {
			alert("상품명을 입력하세요.");
			return;
		}
		
		let productNumber = $("#productNumber").val();
		if (productNumber == "") {
			alert("상품번호를 입력하세요.");
			return;
		}
		
		let price = $("#price").val();
		if (price == "") {
			alert("가격을 입력하세요.");
			return;
		}
		
		let stock = $("#stock").val();
		if (stock == "") {
			alert("재고를 입력하세요.");
			return;
		}
		
		let content = $("#content").val();
		if (content == "") {
			alert("상품설명을 입력하세요.");
			return;
		}
		
		//formData에 담아서 보내기
		let formData = new FormData();
		formData.append("productId", productId);
		formData.append("type", type);
		formData.append("colorArr", colorArr);
		formData.append("sizeArr", sizeArr);
		formData.append("productName", productName);
		formData.append("productNumber", productNumber);
		formData.append("price", price);
		formData.append("stock", stock);
		formData.append("content", content);
		formData.append("file1", $(".file")[0].files[0]);
		formData.append("file2", $(".file")[1].files[0]);
		formData.append("file3", $(".file")[2].files[0]);
		formData.append("file4", $(".file")[3].files[0]);
		formData.append("file5", $(".file")[4].files[0]);

		
		$.ajax({
				type: "PUT"
				, url: "/admin/product/product_update"
				, data: formData 
				, enctype: "multipart/form-data" 
				, processData: false 
				, contentType: false 
				, success: function(data) {
					if (data.result == 'success') {
						alert("상품을 성공적으로 수정했습니다.");
						location.href="/admin/product/product_list_view"
					} else if (data.result == "fail"){
						alert("업로드를 실패했습니다. 다시 시도해주세요.");
						location.reload();
					}
				}
				, error: function(e) {
					alert("error");
				}
			});
			
	});
		
		
		
		
	
});

</script>
</html>