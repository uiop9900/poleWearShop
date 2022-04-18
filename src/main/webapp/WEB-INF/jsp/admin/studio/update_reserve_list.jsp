<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update_not_fixed_Studio_Reserve</title>
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

	<section class="mt-5 ml-5 box2">
		<c:choose>
			<c:when test="${reserve.createdAt != reserve.updatedAt}" >
				<div class="display-4">확정 예약</div>
			</c:when>
			<c:when test="${reserve.createdAt == reserve.updatedAt}" >
				<div class="display-4">미확정 예약</div>
				<div class="text-success font-weight-bold">담당자는 예약자와 연락 후, 최종 금액을 기입하고 예약을 확정지으세요.</div>
			</c:when>
		</c:choose>
		<div class="mt-5">
		<b>카테고리</b>
			<select id="studioId">
				<option value="1" <c:if test="${reserve.studioId == 1}"> selected </c:if>>강남점</option>
				<option value="2" <c:if test="${reserve.studioId == 2}"> selected </c:if>>개봉점</option>
				<option value="3" <c:if test="${reserve.studioId == 3}"> selected </c:if>>부천점</option>
			</select>
		</div>
	
		<div class="mt-2"><b>예약자 성함</b>
			<input id="visitorName" class="ml-4" type="text" value="${reserve.visitorName}">
		</div>
		
		<div class="mt-2"><b>예약자 전화번호</b>
			<input id="visitorPhoneNumber" class="ml-4" type="text" value="${reserve.visitorPhoneNumber}">
		</div>
		
		<div class="mt-2"><b>예약 날짜</b>
			<input id="datepicker" class="visitorDate ml-4" type="text" value="${reserve.visitorDate}">
		</div>
		
		<div class="mt-2"><b>예약 시간</b>
			<input id="visitorTime" class="ml-4" type="text" value="${reserve.visitorTime}">
			<div class="text-danger font-weight-bold">!!시간양식 엄수해서 기입!! 띄어쓰기 불가하며 ~ 사용하기 <br>
			예) 09:00~12:00 / 14:30~16:00
			
			</div>
		</div>
		
		<div class="mt-2"><b>가격</b>
			<input id="price" class="ml-4" type="text" value="${reserve.price}">
		</div>
		
		<div class="mt-4">
			<a href="/admin/studio/main_view" class="btn btn-dark">목록</a>
			<button id="deleteReserveBtn" class="btn btn-secondary ml-4" data-stdio-reserve-id="${reserve.id}">예약 삭제하기</button>
			<button id="updateReserveBtn" class="btn btn-primary ml-4" data-stdio-reserve-id="${reserve.id}">예약 확정하기</button>
		</div>
	</section>
</body>

<script>
$(document).ready(function(e){
	//visitor날짜는 
	$("#datepicker").datepicker({
		changeMonth: true
		, dateFormat: "yy-mm-dd"
		, monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12']
		, dayNamesMin: ['일','월','화','수','목','금','토']
	});
	
	//예약확정하기
	$("#updateReserveBtn").on('click', function(e){
		let studioReserveId = $(this).data("stdio-reserve-id");
		let studioId = $("#studioId").val();
		let visitorName = $("#visitorName").val();
		let visitorPhoneNumber = $("#visitorPhoneNumber").val();
		let visitorDate = $(".visitorDate").val();
		let visitorTime = $("#visitorTime").val();
		let price = $("#price").val();
		
		//validation
		if (visitorName == "") {
			alert("예약자 이름을 기입하세요.");
			return;
		}
		
		if (visitorPhoneNumber == "") {
			alert("예약자 번호를 기입하세요.");
			return;
		}
		
		if (visitorDate == "") {
			alert("예약일자를 기입하세요.");
			return;
		}
		
		if (visitorTime == "") {
			alert("예약시간을 기입하세요.");
			return;
		}
		
		if (price == "") {
			alert(visitorTime.length);
			alert("금액을 기입하세요.");
			return;
		}
		
		$.ajax({
			type: "PUT"
			, url: "/admin/studio/update_studio_reserve"
			, data: {"studioId":studioId, "studioReserveId":studioReserveId, "visitorName":visitorName, "visitorDate":visitorDate
				,"visitorPhoneNumber":visitorPhoneNumber, "visitorTime":visitorTime, "price":price}
			, success: function(data){
				if (data.result == "success") {
					alert("예약이 확정되었습니다.");
					location.href="/admin/studio/main_view"
				} else if (data.result == "fail") {
					alert("예약확정이 실패했습니다. 다시 시도해주세요.");
					location.reload();
				}
			}
			,error: function(e){
				alert("error");
			}
		});
	});
	
	//예약 삭제
	$("#deleteReserveBtn").on('click', function(e){
		let reserveId = $(this).data("stdio-reserve-id");

		$.ajax({
			type: "DELETE"
			,url: "/admin/studio/delete_studio_reserve"
			, data: {"reserveId":reserveId}
			, success: function(data){
				if (data.result == "success") {
					alert("삭제되었습니다.");
					location.href="/admin/studio/main_view";
				} else if (data.result == "fail") {
					alert("삭제실패, 다시 시도해주세요.");
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