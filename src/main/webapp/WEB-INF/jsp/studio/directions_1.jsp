<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b0ad6a4b17100d77a5df463056e93d04"></script>

<div class="product-box">
	<h1 id="studioId" class="text-center" data-studio-id="${studio.id}">Studio | ${studio.title}점</h1>
	<div class="studio_box">
		<nav>
			<ul class="nav nav-fill pt-2">
				<li class="nav-item"><a href="/studio/facility_info_view?studioId=${studio.id}" class="nav-link text-dark border">시설안내</a></li>
				<li class="nav-item"><a href="/studio/use_info_view?studioId=${studio.id}" class="nav-link text-dark border">이용안내</a></li>
				<li class="nav-item"><a href="/studio/reserve_status_view?studioId=${studio.id}" class="nav-link text-dark border">예약안내</a></li>
				<li class="nav-item"><a href="/studio/directions_view?studioId=${studio.id}" class="nav-link text-dark font-weight-bold stdio-bg border border-dark">오시는길</a></li>
			</ul>
		</nav>	
		
		<div class="mt-5 d-flex justify-content-center" >
			<div id="map" style="width:700px;height:500px;"></div>
		</div>
		
		<div class="mt-5">
			<small>모두다폴웨어 ${studio.title}점</small>
			<div class="font-weight-bold">${studio.address}</div>
		</div>
		<div class="d-flex justify-content-begin mt-2">
			<div class="font-weight-bold">오시는길:</div>
			<div class="ml-2">
						강남역 10번 출구 5분거리<br>
			            강남 GS25 맞은편 <br>
			            주차 불가
			</div>
		</div>
	</div>
	
</div>

<script>
$(document).ready(function(e){
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.499247, 127.028255), //강남지점
			level: 3 //지도의 레벨(확대, 축소 정도)
	};

	//지도에 마커 표시
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

	var position =  new kakao.maps.LatLng(37.499247, 127.028255);

	var marker = new kakao.maps.Marker({
		  position: position,
		  clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
		});
		
	marker.setMap(map);
	
});

</script>