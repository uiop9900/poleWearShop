<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <meta charset='utf-8' />
    <link href='/static/fullcalendar/main.css' rel='stylesheet' />
    <script src='/static/fullcalendar/main.js'></script>
<script>

document.addEventListener('DOMContentLoaded', function() {
	let studioId = $("#studioId").data("studio-id");
	
    	  $(function () {
              var request = $.ajax({ 
        		  type:"get"
           		  , url:"/studio/reserve_calendar"
           		  , data: {"studioId":studioId}
           		  , dataType:"json"
              });
              
              request.done(function(data){
            	  console.log(data);
            	  
            	  var calendarEl = document.getElementById('calendar');
                  var calendar = new FullCalendar.Calendar(calendarEl, {
                    initialView: 'dayGridMonth'
                   , selectable: true //날짜 드래그해서 지정가능
                   , selectMirror: true
                   , displayEventEnd: {//시작시간, 끝나는 시간 다 보이게 하기
                        month: false
                       , basicWeek: true
                       , "default": true
                    }
                   , dayMaxEventRows: true //일정이 너무 많으면 more버튼으로 일정확인
                   , views: {
                      timeGrid: {
                        dayMaxEventRows: 6 // adjust to 6 only for timeGridWeek/timeGridDay
                      }
                    }
                    , events: data,

                  });
            	  
        calendar.render();
       	       });
      });
     });

    </script>
    
 <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>    
 
<div class="product-box">
	<h1 id="studioId" class="text-center" data-studio-id="${studio.id}">Studio | ${studio.title}점</h1>

	<%--nav --%>
	<div class="studio_box">
		<nav>
			<ul class="nav nav-fill pt-2">
				<li class="nav-item"><a href="/studio/facility_info_view?studioId=${studio.id}" class="nav-link text-dark border">시설안내</a></li>
				<li class="nav-item"><a href="/studio/use_info_view?studioId=${studio.id}" class="nav-link text-dark border">이용안내</a></li>
				<li class="nav-item"><a href="/studio/reserve_status_view?studioId=${studio.id}" class="nav-link text-dark font-weight-bold stdio-bg border border-dark">예약안내</a></li>
				<li class="nav-item"><a href="/studio/directions_view?studioId=${studio.id}" class="nav-link text-dark border">오시는길</a></li>
			</ul>
		</nav>	
	</div>
	
	<%--요금안내 --%>
	<div class="mt-5 studio_box">
		<h3 class="font-weight-bold">요금안내</h3>
		<table id="studioReserveTable" class="table border mt-3 ml-2 text-center">
			<thead class="thead-light">
				<tr>
					<th>대관/1인 기준</th>
					<th>일반가</th>
					<th>인원 추가(1인당)</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>06:00 ~ 12:00</td>				
					<td>15,000 원</td>				
					<td>5,000 원</td>				
				</tr>
				<tr>
					<td>12:00 ~24:00</td>				
					<td>20,000 원</td>				
					<td>5,000 원</td>				
				</tr>
				<tr>
					<td>24:00 ~ 06:00</td>				
					<td>10,000 원</td>				
					<td>5,000 원</td>				
				</tr>
			</tbody>
		</table>
		<div>
		- 가격은 1인 1시간 기준입니다.<br>
		- 대관시 빔 프로젝트 사용가능합니다.
		</div><hr>
	</div>
	
	<%--studio 예약 --%>
	<div class="mt-5 studio_box">
		<h3 class="font-weight-bold">스튜디오 예약</h3>
			<div class="d-flex align-items-center mt-3">
				<div class="font-weight-bold col-2">이름</div>
				<input type="text" id="visitorName" class="form-control col-6" placeholder="이름을 입력하세요.">
			</div>
			<div class="d-flex align-items-center mt-2">
				<div class="font-weight-bold col-2">전화번호</div>
				<input type="text" id="visitorPhoneNumber" class="form-control col-6" placeholder="예) 01012341234">
			</div>
			<div class="d-flex align-items-center mt-2">
				<div class="font-weight-bold col-2">지점</div>
				<input type="text" id="studioId" data-studio-id="${studio.id}" class="form-control col-6" value="${studio.title}점" disabled>
			</div>
			<div class="d-flex align-items-center mt-2">
				<div class="font-weight-bold col-2">예약날짜</div>
				<input type="text" id="visitorDate" class="datepicker form-control col-6" placeholder="예약날짜를 선택하세요.">
			</div>
			<div class="d-flex align-items-center mt-2">
				<div class="font-weight-bold col-2">예약시간</div>
				<input type="text" id="visitorTime" class="form-control col-6" placeholder="예) 14:00 - 16:00">
			</div>
			
			<div class="mt-4 d-flex justify-content-begin w-50">
				<button id="reserveBtn" class="btn btn-primary col-6" data-studio-id="${studio.id}">예약 신청하기</button>
			</div><br><br><hr>
	</div>
	
	<div class="mt-5">
		<h3 class="font-weight-bold text-center text-success">예약 현황</h3>
		<div id='calendar'></div>
	</div>

</div>
<script>
$(document).ready(function(e){
	
	//datepicker
	$(".datepicker").datepicker({
		changeMonth: true
		, dateFormat: "yy-mm-dd"
		, monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12']
		, dayNamesMin: ['일','월','화','수','목','금','토']
		, minDate: 0
	});
	
	
	//예약버튼
	$("#reserveBtn").on("click", function(e){
		let studioId= $(this).data("studio-id");
		let visitorName = $("#visitorName").val();
		let visitorPhoneNumber = $("#visitorPhoneNumber").val();
		let visitorDate = $("#visitorDate").val();
		let visitorTime = $("#visitorTime").val();
		
		//validation
		if (visitorName == "") {
			alert("이름을 입력하세요.");
			return;
		}
		
		if (visitorPhoneNumber == "") {
			alert("전화번호를 입력하세요.");
			return;
		}
		
		if (visitorDate == "") {
			alert("예약날짜를 선택하세요.");
			return;
		}
		
		if (visitorTime == "") {
			alert("예약시간을 입력하세요.");
			return;
		}
		
		$.ajax({
			type: "GET"
			, url: "/studio/studio_reserve"
			, data: {"studioId":studioId, "visitorName":visitorName, "visitorPhoneNumber":visitorPhoneNumber, 
					"visitorDate":visitorDate, "visitorTime":visitorTime}
			, success: function(data) {
				if (data.result == "success") {
					alert("성공적으로 예약되었습니다. 추후에 담당자가 연락할 예정이니 확인 부탁드립니다.");
					location.reload();
				} else if (data.result == "fail") {
					alert("예약이 실패했습니다. 다시 시도해주세요.");
					location.reload();
				}
			}
			, error: function(e){
				alert("error");
			}
		});
	});
	
	document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });
});

</script>