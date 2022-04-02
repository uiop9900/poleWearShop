<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	 <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>    
	
	<link rel="stylesheet" type="text/css" href="/static/css/admin_style.css">

</head>
<body>
	<%--상단의 지점 select --%>
	
	<div class="mt-5 ml-5">
		<div><small class='text-danger font-weight-bold'>지점을 선택하면 예약내용과 사진이 화면에 나타납니다.</small></div>
		<select id="titleSelectBtn">
			<option value="0">지점 선택</option>
			<option value="1">강남점</option>
			<option value="2">개봉점</option>
			<option value="3">부천점</option>
		</select>
	</div>
	
	<%--지점별 사진--%>
	<h1 class="mt-5 ml-5">스튜디오 사진</h1>
	<div class="ml-5 mt-5 d-flex justify-content-around align-items-center">
		<div class="border studio_image_box">
			<div class="font-weight-bold">탈의실</div>
			<div><img src="#" onerror="this.src='/static/images/prepare.png'" alt="fitting-room"></div>
			<input type="file" class="file" accept=".jpg,.gif,.jpeg,.png">
		</div>
		<div class="border studio_image_box">
			<div class="font-weight-bold">수납장</div>
			<div><img src="#" onerror="this.src='/static/images/prepare.png'" alt="closet" ></div>
			<input type="file" class="file" accept=".jpg,.gif,.jpeg,.png">
		</div>
		<div class="border studio_image_box">
			<div class="font-weight-bold">요가도구</div>
			<div><img src="#" onerror="this.src='/static/images/prepare.png'" alt="yoga-tool" ></div>
			<input type="file" class="file" accept=".jpg,.gif,.jpeg,.png">
		</div>
		<div class="border studio_image_box">
			<div class="font-weight-bold">촬영도구</div>
			<div><img src="#" onerror="this.src='/static/images/prepare.png'" alt="photo-tool"></div>
			<input type="file" class="file" accept=".jpg,.gif,.jpeg,.png">
		</div>
	</div>
	
	<div class="ml-5 mt-5 d-flex justify-content-around align-items-center">
		<div class="border studio_image_box">
			<div class="font-weight-bold">빔프로젝터1</div>
			<div><img src="#" onerror="this.src='/static/images/prepare.png'" alt="beam-projector1"></div>
			<input type="file" class="file" accept=".jpg,.gif,.jpeg,.png">
		</div>
		<div class="border studio_image_box">
			<div class="font-weight-bold">빔프로젝터2</div>
			<div><img src="#" onerror="this.src='/static/images/prepare.png'" alt="beam-projector2"></div>
			<input type="file" class="file" accept=".jpg,.gif,.jpeg,.png">
		</div>
		<div class="border studio_image_box">
			<div class="font-weight-bold">조명</div>
			<div><img src="#" onerror="this.src='/static/images/prepare.png'" alt="lighting"></div>
			<input type="file" class="file" accept=".jpg,.gif,.jpeg,.png">
		</div>
		<div class="border studio_image_box">
			<div class="font-weight-bold">스튜디오 전경</div>
			<div><img src="#" onerror="this.src='/static/images/prepare.png'" alt="studio-view"></div>
			<input type="file" class="" accept=".jpg,.gif,.jpeg,.png">
		</div>
	</div>
	

	<%--상단의 지점 예약 --%>
	<h1 class="mt-5 ml-5">스튜디오 예약</h1>
	<div class="mt-1 ml-5">
		<small class="text-success font-weight-bold">- 담당자는 미확정예약의 예약자에게 연락 후, 예약을 확정하길 바랍니다.</small><br>
			<div class="mt-3 d-flex align-items-center">
				
				<button value="notFix" class="btnType btn btn-secondary">미확정 예약</button>
				<button value="fix" class="btnType btn btn-primary ml-3">확정 예약</button>
				<div class="ml-5">날짜: </div> <input id="date" type="text">
				<button value="fixDate" class="btnType btn btn-primary ml-3">날짜별 확정예약 확인</button>
			</div>
	</div>
	<div>
		<table class="mt-5 ml-5 border table text-center table_box">
			<thead>
				<tr>
					<th>No.</th>
					<th>예약자</th>
					<th>전화번호</th>
					<th>예약날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${reserveList}" var="reserve" varStatus="status">
				<tr>
					<th>${reserve.id}</th>
					
					<th><a href="/admin/studio/update_reserve_list_view?reserveId=${reserve.id}">${reserve.visitorName}</a></th>
					
					<th>${reserve.visitorPhoneNumber}</th>
					<th>
						${reserve.visitorDate}
					</th>
				</tr>
				</c:forEach>
			</tbody>
		
		
		
		</table>
	
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
	
	$(".btnType").on('click', function(e){
		e.preventDefault();
		let btnType = $(this).val();
		let visitorDate = $("#date").val();
		
		location.href="/admin/studio/main_view?btnType=" + btnType + "&&visitorDate=" + visitorDate;
		
	});
	
	$("#date").datepicker({
		changeMonth: true
		, dateFormat: "yy-mm-dd"
		, monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12']
		, dayNamesMin: ['일','월','화','수','목','금','토']
	});
	
});

</script>

</html>
