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
			<option value="1" <c:if test="${studioId == 1 or empty studioId}">selected</c:if> >강남점</option>
			<option value="2" <c:if test="${studioId == 2}">selected</c:if>>개봉점</option>
			<option value="3" <c:if test="${studioId == 3}">selected</c:if>>부천점</option>
		</select>
	</div>
	
	<%--지점별 사진--%>
	<h1 class="mt-5 ml-5">스튜디오 사진</h1>
	<div class="ml-5 mt-5 d-flex justify-content-around align-items-center">
		<div class="border studio_image_box">
		
			<div class="font-weight-bold">탈의실</div>
			<div>
				<img src="	<c:forEach var="image" items="${studioImages}">
							<c:if test="${image.type == 'fittingRoom'}">
								${image.studioImagePath} <c:set value="${image.studioImagePath}" var="imagePath"/>
							</c:if>
							</c:forEach>" 
						onerror="this.src='/static/images/prepare.png'" alt="fitting-room"></div>
			<input type="file" class="file" data-file-type="fittingRoom" accept=".jpg,.gif,.jpeg,.png">
			<div class="d-flex justify-content-end">
				<button type="button" class="mr-2 btn btn-primary btn-sm">등록</button>
				<button type="button" class="delBtn mr-2 btn btn-danger btn-sm" data-image-path="${imagePath}">삭제</button>
			</div><c:remove var="imagePath" />
		</div>
		
		<div class="border studio_image_box">
			<div class="font-weight-bold">수납장</div>
			<div>
				<img src="	<c:forEach var="image" items="${studioImages}">
							<c:if test="${image.type == 'closet'}">
								${image.studioImagePath} <c:set value="${image.studioImagePath}" var="imagePath"/>
							</c:if>
							</c:forEach>" 
						onerror="this.src='/static/images/prepare.png'" alt="closet" >
			</div>
			<input type="file" class="file" data-file-type="closet" accept=".jpg,.gif,.jpeg,.png">
			<div class="d-flex justify-content-end">
				<button type="button" class="mr-2 btn btn-primary btn-sm">등록</button>
				<button type="button" class="delBtn mr-2 btn btn-danger btn-sm" data-image-path="${imagePath}">삭제</button>
			</div><c:remove var="imagePath" />
		</div>
		
		<div class="border studio_image_box">
			<div class="font-weight-bold">요가도구</div>
			<div>
				<img src="	<c:forEach var="image" items="${studioImages}">
							<c:if test="${image.type == 'yogaTool'}">
							${image.studioImagePath} <c:set value="${image.studioImagePath}" var="imagePath"/>
							</c:if>
							</c:forEach>" 
						onerror="this.src='/static/images/prepare.png'" alt="yoga-tool" ></div>
			<input type="file" class="file" data-file-type="yogaTool" accept=".jpg,.gif,.jpeg,.png">
			<div class="d-flex justify-content-end">
				<button type="button" class="mr-2 btn btn-primary btn-sm">등록</button>
				<button type="button" class="delBtn mr-2 btn btn-danger btn-sm" data-image-path="${imagePath}">삭제</button>
			</div><c:remove var="imagePath" />
		</div>
		
		<div class="border studio_image_box">
			<div class="font-weight-bold">촬영도구</div>
			<div>			<%--사진type에 따라 다르게 출력된다. 이하 다른 타입도 동일 --%>
				<img src="	<c:forEach var="image" items="${studioImages}">
							<c:if test="${image.type == 'photoTool'}">
								${image.studioImagePath} <c:set value="${image.studioImagePath}" var="imagePath"/>
							</c:if>
							</c:forEach>" 
						onerror="this.src='/static/images/prepare.png'" alt="photo-tool"></div>
			<input type="file" class="file" data-file-type="photoTool" accept=".jpg,.gif,.jpeg,.png">
			<div class="d-flex justify-content-end">
				<button type="button" class="mr-2 btn btn-primary btn-sm">등록</button>
				<button type="button" class="delBtn mr-2 btn btn-danger btn-sm" data-image-path="${imagePath}">삭제</button>
			</div><c:remove var="imagePath" />
		</div>
	</div>
	
	<div class="ml-5 mt-5 d-flex justify-content-around align-items-center">
		<div class="border studio_image_box">
			<div class="font-weight-bold">빔프로젝터1</div>
			<div><img class="image" src="<c:forEach var="image" items="${studioImages}">
							<c:if test="${image.type == 'beamProject1'}">
								${image.studioImagePath} <c:set value="${image.studioImagePath}" var="imagePath"/>
							</c:if>
							</c:forEach>" onerror="this.src='/static/images/prepare.png'" alt="beam-projector1"></div>
			<input type="file" class="file"  data-file-type="beamProject1" accept=".jpg,.gif,.jpeg,.png">
			<div class="d-flex justify-content-end">
				<button type="button" class="mr-2 btn btn-primary btn-sm">등록</button>
				<button type="button" class="delBtn mr-2 btn btn-danger btn-sm" data-image-path="${imagePath}">삭제</button>
			</div><c:remove var="imagePath" />
		</div>
		
		<div class="border studio_image_box">
			<div class="font-weight-bold">빔프로젝터2</div>
			<div><img src="<c:forEach var="image" items="${studioImages}">
							<c:if test="${image.type == 'beamProject2'}">
								${image.studioImagePath} <c:set value="${image.studioImagePath}" var="imagePath"/>
							</c:if>
							</c:forEach>" onerror="this.src='/static/images/prepare.png'" alt="beam-projector2"></div>
			<input type="file" class="file"  data-file-type="beamProject2" accept=".jpg,.gif,.jpeg,.png">
			<div class="d-flex justify-content-end">
				<button type="button" class="mr-2 btn btn-primary btn-sm">등록</button>
				<button type="button" class="delBtn mr-2 btn btn-danger btn-sm" data-image-path="${imagePath}">삭제</button>
			</div>
		</div>
		<div class="border studio_image_box">
			<div class="font-weight-bold">조명</div>
			<div><img src="<c:forEach var="image" items="${studioImages}">
							<c:if test="${image.type == 'lighting'}">
								${image.studioImagePath} <c:set value="${image.studioImagePath}" var="imagePath"/>
							</c:if>
							</c:forEach>" onerror="this.src='/static/images/prepare.png'" alt="lighting"></div>
			<input type="file" class="file"  data-file-type="lighting" accept=".jpg,.gif,.jpeg,.png">
			<div class="d-flex justify-content-end">
				<button type="button" class="mr-2 btn btn-primary btn-sm">등록</button>
				<button type="button" class="delBtn mr-2 btn btn-danger btn-sm" data-image-path="${imagePath}">삭제</button>
			</div><c:remove var="imagePath" />
		</div>
		
		<div class="border studio_image_box">
			<div class="font-weight-bold">스튜디오 전경</div>
			<div><img src="<c:forEach var="image" items="${studioImages}">
							<c:if test="${image.type == 'studioView'}">
								${image.studioImagePath} <c:set value="${image.studioImagePath}" var="imagePath"/>
							</c:if>
							</c:forEach>" onerror="this.src='/static/images/prepare.png'" alt="studio-view"></div>
			<input type="file" class="file" data-file-type="studioView" accept=".jpg,.gif,.jpeg,.png">
			<div class="d-flex justify-content-end">
				<button type="button" class="mr-2 btn btn-primary btn-sm">등록</button>
				<button type="button" class="delBtn mr-2 btn btn-danger btn-sm" data-image-path="${imagePath}">삭제</button>
			</div><c:remove var="imagePath" />
		</div>
	</div><br><hr class="studio_hr">
	

	<%--지점 예약 테이블 --%>
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
				alert("gif, png, jpg, jpeg 파일만 업로드 할 수 있습니다.");
				$(".file").val(""); 
				return;
			}
		}
	});
	
	//카테고리를 선택하면 사진이 나옵니다.
	$("#titleSelectBtn").on('change', function(e){
		let studioId = $(this).val();
		location.href="/admin/studio/main_view?studioId=" + studioId; 
	});
	
	//각 부분마다 사진 등록하기
	$(".file").on('change', function(e){
		let type = $(this).data("file-type");
		let studioId = $("#titleSelectBtn").val();
		let file = $(this).val();
		
		
		let formData = new FormData();
		formData.append("file", $(this)[0].files[0]);
		formData.append("type", type);
		formData.append("studioId", studioId);
		
		$.ajax({
			type: "POST"
			, url: "/admin/studio/studio_images_list"
			, data: formData 
			, enctype: "multipart/form-data" 
			, processData: false 
			, contentType: false 
			, success: function(data) {
				if (data.result == "success") {
					location.reload();
				} else if (data.result == "fail") {
					alert("사진 등록실패, 다시 시도해주세요.");
					location.reload();
				}
			}
			, error :function(e){
				alert("error");
			}
		});
		
	});
	
	// 각 사진마다 삭제하기
	$(".delBtn").on('click', function(e){
		let imagePath = $(this).data("image-path");

		$.ajax({
			type: "DELETE"
			, url: "/admin/studio/delete_studio_image"
			, data: {"imagePath":imagePath}
			, success: function(data) {
				if (data.result == "success"){
					location.reload();
				} else if (data.result == "fail") {
					alert("삭제실패, 다시 시도 후 관리자에게 문의하세요.");
					location.reload();
				}
			}
			, error: function(e) {
				alert("error");
			}
		});
	});
	
	//버튼을 누르면 표가 달라집니다.
	$(".btnType").on('click', function(e){
		e.preventDefault();
		let btnType = $(this).val();
		let visitorDate = $("#date").val();
		
		location.href="/admin/studio/main_view?btnType=" + btnType + "&&visitorDate=" + visitorDate;
	});
	
	//date의 datepicker
	$("#date").datepicker({
		changeMonth: true
		, dateFormat: "yy-mm-dd"
		, monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12']
		, dayNamesMin: ['일','월','화','수','목','금','토']
	});
	
});

</script>
</html>
