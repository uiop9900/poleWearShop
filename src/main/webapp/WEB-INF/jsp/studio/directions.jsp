<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="product-box">
	<h1 class="text-center">Studio | ${studio.title}점</h1>
	<h1>directions</h1>
	<div class="studio_box">
		<nav>
			<ul class="nav nav-fill pt-2">
				<li class="nav-item"><a href="/studio/facility_info_view?studioId=${studio.id}" class="nav-link text-dark border">시설안내</a></li>
				<li class="nav-item"><a href="/studio/use_info_view?studioId=${studio.id}" class="nav-link text-dark border">이용안내</a></li>
				<li class="nav-item"><a href="/studio/reserve_status_view?studioId=${studio.id}" class="nav-link text-dark border">예약안내</a></li>
				<li class="nav-item"><a href="/studio/directions_view?studioId=${studio.id}" class="nav-link text-dark font-weight-bold stdio-bg border border-dark">오시는길</a></li>
			</ul>
		</nav>	
	</div>
	
</div>