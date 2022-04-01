<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="product-box">
	<h1 class="text-center">Studio | ${studio.title}점</h1>
	
	<div class="studio_box">
		<nav>
			<ul class="nav nav-fill pt-2">
				<li class="nav-item"><a href="/studio/facility_info_view?studioId=${studio.id}" class="nav-link text-dark border">시설안내</a></li>
				<li class="nav-item"><a href="/studio/use_info_view?studioId=${studio.id}" class="nav-link text-dark font-weight-bold stdio-bg border border-dark">이용안내</a></li>
				<li class="nav-item"><a href="/studio/reserve_status_view?studioId=${studio.id}" class="nav-link text-dark border">예약안내</a></li>
				<li class="nav-item"><a href="/studio/directions_view?studioId=${studio.id}" class="nav-link text-dark border">오시는길</a></li>
			</ul>
		</nav>
		
		<div class="mt-5">
			<h3 class="font-weight-bold">예약안내</h3>
			<div class="pt-2">
				1. '예약현황' 페이지에서 예약 현황을 확인하세요<br>
				2. '예약현황' 페이지에서 원하는 예약날짜/시간/이름/전화번호를 남겨주세요.<br>
				3.  관리자가 확인 후, <br>&nbsp;&nbsp;연락을 드리면 국민 123-111-123-123123 이지아(모두다폴웨어 스튜디오)로 입금부탁드립니다.<br>
				4. '예약현황' 페이지 확정된 예약 확인하세요.<br>
			</div><hr>
		
			<h3 class="font-weight-bold">공지사항</h3>
			<div class="pt-2">
				1. 예약 취소<br>
				- 사용 72시간 전 100% 환불<br>
				- 사용 24~72시간 이내 50% 환불<br>
				- 사용 24시간 이내 환불 불가<br><br>
				
				2. 이용 시간을 지켜주세요.<br>
				- 이용 시간은 입, 퇴장 시간과 준비, 정리 시간을 모두 포함한 시간입니다.<br>
				- 이용 시간 이후 10분에 5000원의 요금이 부과됩니다. <br><br>
				
				3. 스튜디오 내에선 '물, 음료'만 섭취해주세요.<br>
				- 쓰레기는 분리수거 휴지통에 버려주시고, 뒷정리 꼭 확인 부탁 드립니다. <br>
				-연습이 끝난 후 폴은 폴클리너 매트는 소독용 물티슈로 정리 부탁 드립니다.<br><br>
				
				4. 사용하신 전기 제품의 전원을 모두 꺼주시기 바랍니다.<br>
				- 난방기, 에어컨 등 전자기기를 끄지 않고 가실 경우 시간 당 요금이 부과됩니다.<br><br>
				
				5. 위험한 동작 시 꼭 안전 매트를 깔아 주세요. 개인 안전에 대한 책임은 스튜디오에서 지지 않습니다.<br><br>
				
				6. 퇴실 시 문 잠금 상태 확인 부탁 드립니다. <br><br>
			</div>
			
		</div>	
	</div>
	
</div>