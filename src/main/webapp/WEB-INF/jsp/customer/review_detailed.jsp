<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<div class="member_order_box">
	<%--상품 정보 --%>
	<div class="d-flex justify-content-begin align-items-center review_detailed">
		<img src="${productImage}" alt="product_image" class="border">
		<div class="ml-4 mt-3">
			<h1>${productName}</h1>
			<h4 class="mt-2"><fmt:formatNumber value="${productPrice}" type="number"/>원</h4>
		</div>
	</div>
	<hr>
	
	<%--리뷰내용 --%>
	<h3 class="mt-4"><b>제목:</b> ${review.subject}</h3>
	<c:if test="${not empty review.reviewImage}" >
		<img src="${review.reviewImage}" alt="product_image" class="border mt-3">
	</c:if>
	<c:if test="${empty review.reviewImage}" >
		<img src="/static/images/prepare.png" alt="product_image" class="border mt-3" width="300">
	</c:if>
	<div class="mt-5 d-flex justify-content-begin align-items-center">
		<h4><b>솔직 리뷰:</b></h4>
		<h4 class="ml-4">${review.content}</h4>
	</div>
	
	<%--admin의 댓글--%>
	<c:forEach var="comment" items="${commentList}">
	<hr><br><br>
	<h4 class="text-success">관리자 - ${comment.content}</h4>
	<%--admin의 댓글삭제버튼--%>
	<c:if test="${memberId == 1}">
		<button class="delete_comment_btn btn btn-danger" data-comment-id="${comment.id}">댓글 삭제</button>
	</c:if>
	</c:forEach>	
	
	<%--본인이 쓴 리뷰만 삭제가능한 버튼 --%>
	<c:if test="${memberLoginId eq review.loginId}" >
		<div class="mt-4 d-flex justify-content-center">
			<button id="reviewDeleteBtn" class="btn btn-secondary col-3" data-review-id="${review.id}">삭제하기</button>
		</div>
	</c:if>
	
	<c:if test="${memberId == 1}">
	<hr>
		<h5 class="mt-4">관리자 댓글</h5>
		<div class="mt-3 d-flex justify-content-begin">
			<input id="reviewComment" type="text" class="form-control col-7">
			<button id="reviewCommentUpload" class="btn btn-primary col-1 ml-5" data-review-id="${review.id}">게시</button>
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
	
	$("#reviewCommentUpload").on('click', function(e){
		let reviewId = $(this).data("review-id");
		let content = $("#reviewComment").val();
		
		$.ajax({
			type: "GET"
			, url: "/comment/comment_list"
			, data: {"type":"review", "boardId":reviewId, "content":content}
			, success: function(data) {
				if (data.result == "success") {
					alert("게시완료");
					location.reload();
				} else if (data.result == "fail") {
					alert("게시실패, 다시 한번 시도 후 관리자에게 문의하세요.");
					location.reload();
				}
			}
			, error: function(e) {
				alert("error");
			}
		});
	});
	
	$(".delete_comment_btn").on('click', function(e){
		let commentId = $(this).data('comment-id');
		
		$.ajax({
			type: "DELETE"
			, url: "/comment/review_comment_delete"
			, data: {"commentId":commentId}
			, success: function(data) {
				if (data.result == "success") {
					location.reload();
				} else if (data.result == "fail") {
					alert("댓글 삭제 실패, 관리자에게 문의하세요.");
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