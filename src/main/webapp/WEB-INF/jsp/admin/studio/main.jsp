<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_studio</title>
	<!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<!-- Ajax 쓰려면 전체의 jQuery가져와야 한다 -->
  <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="/static/css/admin_style.css">

</head>
<body>
	<%--상단의 지점 select --%>
	<div class="mt-5 ml-3">
		<div><small class='text-danger font-weight-bold'>지점을 선택하면 사진이 화면에 나타납니다.</small></div>
		<select id="titleSelectBtn">
			<option>고르기</option>
			<option value="1">강남점</option>
			<option value="2">개봉점</option>
			<option value="3">부천점</option>
		</select>
	</div>
	
	<%--지점별 사진--%>
	<div class="ml-5 mt-5 d-flex justify-content-around align-items-center">
		<div class="border studio_image_box">
			<div class="font-weight-bold">탈의실</div>
			<div><img src="#" onerror="this.src='/static/images/prepare.png'" alt="fitting-room"></div>
			<input type="file" class="file" accept=".jpg,.gif,.jpeg,.png">
		</div>
		<div class="border studio_image_box">
			<div class="font-weight-bold">수납장</div>
			<div><img src="#" onerror="this.src='/static/images/prepare.png'" alt="closet" width="200"></div>
			<input type="file" class="file" accept=".jpg,.gif,.jpeg,.png">
		</div>
		<div class="border studio_image_box">
			<div class="font-weight-bold">요가도구</div>
			<div><img src="#" onerror="this.src='/static/images/prepare.png'" alt="yoga-tool" width="200"></div>
			<input type="file" class="file" accept=".jpg,.gif,.jpeg,.png">
		</div>
		<div class="border studio_image_box">
			<div class="font-weight-bold">촬영도구</div>
			<div><img src="#" onerror="this.src='/static/images/prepare.png'" alt="photo-tool" width="200"></div>
			<input type="file" class="file" accept=".jpg,.gif,.jpeg,.png">
		</div>
	</div>
	
	<div class="ml-5 mt-5 d-flex justify-content-around align-items-center">
		<div class="border studio_image_box">
			<div class="font-weight-bold">빔프로젝터1</div>
			<div><img src="#" onerror="this.src='/static/images/prepare.png'" alt="fitting-room" width="200"></div>
			<input type="file" class="file" accept=".jpg,.gif,.jpeg,.png">
		</div>
		<div class="border studio_image_box">
			<div class="font-weight-bold">빔프로젝터2</div>
			<div><img src="#" onerror="this.src='/static/images/prepare.png'" alt="closet" width="200"></div>
			<input type="file" class="file" accept=".jpg,.gif,.jpeg,.png">
		</div>
		<div class="border studio_image_box">
			<div class="font-weight-bold">조명</div>
			<div><img src="#" onerror="this.src='/static/images/prepare.png'" alt="yoga-tool" width="200"></div>
			<input type="file" class="file" accept=".jpg,.gif,.jpeg,.png">
		</div>
		<div class="border studio_image_box">
			<div class="font-weight-bold">스튜디오 전경</div>
			<div><img src="#" onerror="this.src='/static/images/prepare.png'" alt="photo-tool" width="200"></div>
			<input type="file" class="" accept=".jpg,.gif,.jpeg,.png">
		</div>
	</div>
	
	
	
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
				$(".file").val(""); 
				return;
			}
		}
	});
	
	$("#titleSelectBtn").on('change', function(e){
		let studioId = $(this).val();
		alert(studioId);
	});
});

</script>

</html>
