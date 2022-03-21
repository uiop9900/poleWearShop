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
	
	<div class="mt-5 ml-5">
		<div>
		타입
		<select>
			<option>top</option>
			<option>bottom</option>
			<option>set</option>
			<option>etc</option>
		</select>
		</div>
	
		<div>상품명
			<input type="text">
		</div>
		
		<div>상품번호
			<input type="text">
		</div>
	
		<div>상품가격
			<input type="text">
		</div>
		
		<div>색상
			<label><input type="checkbox" name="color"> Black</label>
			<label><input type="checkbox" name="color"> White</label>
			<label><input type="checkbox" name="color"> Blue</label>
			<label><input type="checkbox" name="color"> Navy</label>
			<label><input type="checkbox" name="color"> Pink</label>
			<label><input type="checkbox" name="color"> Red</label>
		</div>
		
		<div>사이즈
			<label><input type="checkbox" name="size"> S</label>
			<label><input type="checkbox" name="size"> M</label>
			<label><input type="checkbox" name="size"> L</label>
			<label><input type="checkbox" name="size"> XL</label>
		</div>

		<div>상품설명
		</div>
			<textarea id="textarea"></textarea>

		<div>상품사진</div>
		<div>1. 메인사진
			<input type="file" accept=".jpg,.gif,.jepg,.png">
		</div>
		
		<div>2. 추가사진
			<input type="file" accept=".jpg,.gif,.jepg,.png">
		</div>
		<div>3. 추가사진
			<input type="file" accept=".jpg,.gif,.jepg,.png">
		</div>
		<div>4. 추가사진
			<input type="file" accept=".jpg,.gif,.jepg,.png">
		</div>
		<div>5. 추가사진
			<input type="file" accept=".jpg,.gif,.jepg,.png">
		</div>
		
		<div class="d-flex mt-5">
			<div class="mr-5">
				<a href="/admin/product/product_list_view" class="btn btn-primary">목록</a>
			</div>
			<div class="mr-5">
				<button type="button" class="btn btn-secondary">취소하기</button>
			</div>
			<div>
				<button type="button" class="btn btn-primary">게시하기</button>
			</div>
		</div>
	</div>
</body>

<script>
$(document).ready(function(e){
	
});

</script>
</html>