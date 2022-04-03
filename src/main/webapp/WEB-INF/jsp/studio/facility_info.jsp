<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="product-box">
	<h1 class="text-center">Studio | ${studio.title}점</h1>
	
	<div class="studio_box">
		<nav>
			<ul class="nav nav-fill pt-2">
				<li class="nav-item"><a href="/studio/facility_info_view?studioId=${studio.id}" class="nav-link text-dark font-weight-bold stdio-bg border border-dark">시설안내</a></li>
				<li class="nav-item"><a href="/studio/use_info_view?studioId=${studio.id}" class="nav-link text-dark border">이용안내</a></li>
				<li class="nav-item"><a href="/studio/reserve_status_view?studioId=${studio.id}" class="nav-link text-dark border">예약안내</a></li>
				<li class="nav-item"><a href="/studio/directions_view?studioId=${studio.id}" class="nav-link text-dark border">오시는길</a></li>
			</ul>
		</nav>	
	</div>
	
	<div class="product-box mt-5 d-flex justify-content-between align-items-center">
		<div>
			<div class="font-weight-bold">탈의실</div>
				<div class="border">
					<img src="	<c:forEach var="image" items="${studioImages}">
								<c:if test="${image.type == 'fittingRoom'}">
									${image.studioImagePath} 
								</c:if>
								</c:forEach>" 
					onerror="this.src='/static/images/prepare.png'" alt="fitting-room">
			</div>
		</div>
		
		<div>
			<div class="font-weight-bold">수납장</div>
			<div class="border">
				<img src="	<c:forEach var="image" items="${studioImages}">
							<c:if test="${image.type == 'closet'}">
								${image.studioImagePath} 
							</c:if>
							</c:forEach>" 
						onerror="this.src='/static/images/prepare.png'" alt="closet" >
			</div>
		</div>
		
		<div>
			<div class="font-weight-bold">요가도구</div>
			<div class="border">
				<img src="	<c:forEach var="image" items="${studioImages}">
							<c:if test="${image.type == 'yogaTool'}">
								${image.studioImagePath} 
							</c:if>
							</c:forEach>" 
						onerror="this.src='/static/images/prepare.png'" alt="yoga-tool" ></div>
		</div>
	</div>
	
	<div class="product-box mt-5 d-flex justify-content-between align-items-center">
		<div>
			<div class="font-weight-bold">촬영도구</div>
				<div class="border">
					<img src="	<c:forEach var="image" items="${studioImages}">
								<c:if test="${image.type == 'photoTool'}">
									${image.studioImagePath} 
								</c:if>
								</c:forEach>" 
					onerror="this.src='/static/images/prepare.png'" alt="photoTool">
			</div>
		</div>
		
		<div>
			<div class="font-weight-bold">빔프로젝터1</div>
			<div class="border">
				<img src="	<c:forEach var="image" items="${studioImages}">
							<c:if test="${image.type == 'beamProject1'}">
								${image.studioImagePath} 
							</c:if>
							</c:forEach>" 
						onerror="this.src='/static/images/prepare.png'" alt="beamProject1" >
			</div>
		</div>
		
		<div>
			<div class="font-weight-bold">빔프로젝터2</div>
			<div class="border">
				<img src="	<c:forEach var="image" items="${studioImages}">
							<c:if test="${image.type == 'beamProject2'}">
							${image.studioImagePath} 
							</c:if>
							</c:forEach>" 
						onerror="this.src='/static/images/prepare.png'" alt="beamProject2" ></div>
		</div>
	</div>
	
		<div class="product-box mt-5 d-flex justify-content-around align-items-center">
		<div>
			<div class="font-weight-bold">조명</div>
				<div class="border">
					<img src="	<c:forEach var="image" items="${studioImages}">
								<c:if test="${image.type == 'lighting'}">
									${image.studioImagePath} 
								</c:if>
								</c:forEach>" 
					onerror="this.src='/static/images/prepare.png'" alt="lighting">
			</div>
		</div>
		
		<div>
			<div class="font-weight-bold">스튜디오 전경</div>
			<div class="border">
				<img src="	<c:forEach var="image" items="${studioImages}">
							<c:if test="${image.type == 'studioView'}">
								${image.studioImagePath} 
							</c:if>
							</c:forEach>" 
						onerror="this.src='/static/images/prepare.png'" alt="studioView" >
			</div>
		</div>
		
	</div>
	
</div>
