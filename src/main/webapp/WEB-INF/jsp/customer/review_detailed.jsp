<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<div class="member_order_box">
	<%--상품 정보 --%>
	<div class="d-flex justify-content-begin align-items-center review_detailed">
		<img src="${product.productImagePath}" alt="product_image" class="border">
		<div class="ml-4 mt-3">
			<h1>${product.product.productName}</h1>
			<h4 class="mt-2"><fmt:formatNumber value="${product.product.price}" type="number"/>원</h4>
		</div>
	</div>
	<hr>
	
	<%--리뷰 --%>
	<h3 class="mt-4"><b>제목:</b> ${review.subject}</h3>
	<img src="${review.reviewImage}" alt="product_image" class="border mt-3">
	<div class="mt-5 d-flex justify-content-begin align-items-center">
		<h3><b>내용:</b></h3>
		<h4 class="ml-4">${review.content}</h4>
	</div>
	
	<c:if test="${memberLoginId eq review.loginId}" >
		<div class="mt-4 d-flex justify-content-center">
			<button id="reviewDeleteBtn" class="btn btn-secondary col-3" data-review-id="${review.id}">삭제하기</button>
		</div>
	</c:if>
</div>

<script>
$(document).ready(function(e){
	$("#reviewDeleteBtn").on("click", function(e){
		let reviewId = $(this).data("review-id");
		
		$.ajax({
			type: "DELETE"
			, url: "/customer/review_delete"
			, data: {"reviewId":reviewId}
			, success: function(data) {
				if(data.result == "success"){
					location.href="/customer/review_list_view";
				} else if (data.result == "fail") {
					alert("리뷰 삭제를 실패했습니다. 다시 시도해주세요.");
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