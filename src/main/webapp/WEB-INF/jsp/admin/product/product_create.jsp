<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product Create</title>

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
			<option>top</option>
			<option>bottom</option>
			<option>set</option>
			<option>etc</option>
		</select>
		</div>
	
		<div>상품명
			<input id="productName" type="text">
		</div>
		
		<div>상품번호
			<input id="productNumber" type="text">
		</div>
	
		<div>상품가격
			<input id="price" type="text">
		</div>
		
		<div>재고
			<input id="stock" type="text">
		</div>
		
		<div>색상
			<label><input type="checkbox" name="color" value="black"> Black</label>
			<label><input type="checkbox" name="color" value="white"> White</label>
			<label><input type="checkbox" name="color" value="blue"> Blue</label>
			<label><input type="checkbox" name="color" value="navy"> Navy</label>
			<label><input type="checkbox" name="color" value="pink"> Pink</label>
			<label><input type="checkbox" name="color" value="red"> Red</label>
		</div>
		
		<div>사이즈
			<label><input type="checkbox" name="size" value="s"> S</label>
			<label><input type="checkbox" name="size" value="m"> M</label>
			<label><input type="checkbox" name="size" value="l"> L</label>
			<label><input type="checkbox" name="size" value="xl"> XL</label>
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
	
	//게시하기 버튼
	$("#uploadBtn").on('click', function(e){
		
		// validation
		let type = $("#type").val();
		if (type == "") {
			alert("타입을 선택하세요.");
			return;
		}
		
		// 색
		let colorArr = [];
		$("input:checkbox[name='color']:checked").each(function(){
			let color = $(this).val();
			colorArr.push(color);
		});
		
		if (colorArr == "") {
			alert("색을 선택하세요.");
			return;
		}
		
		// 사이즈
		let sizeArr = [];
		$("input:checkbox[name='size']:checked").each(function(){
			let size = $(this).val();
			sizeArr.push(size);
		});
		
		if (sizeArr == "") {
			alert("사이즈를 선택하세요.");
			return;
		}
		
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
				type: "post"
				, url: "/admin/product_create"
				, data: formData 
				, enctype: "multipart/form-data" 
				, processData: false 
				, contentType: false 
				, success: function(data) {
					if (data.result == 'success') {
						alert("상품을 성공적으로 업로드 되었습니다.");
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