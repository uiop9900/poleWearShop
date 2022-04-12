<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="member_order_box">

	<div class="d-flex justify-content-begin align-items-center w-50">
		<div class="font-weight-bold col-3">카테고리</div>
		<select id="category" class="form-control">
			<option <c:if test="${qna.category eq '상품문의'}" > selected </c:if> disabled> 상품문의</option>
			<option <c:if test="${qna.category eq '배송문의'}" > selected </c:if> disabled>배송문의</option>
			<option <c:if test="${qna.category eq '교환/환불문의'}" > selected </c:if> disabled>교환/환불문의</option>
			<option <c:if test="${qna.category eq '기타'}" > selected </c:if> disabled>기타</option>
		</select>
	</div>
	
	<div class="mt-2 d-flex justify-content-begin align-items-center w-50">
		<div class="font-weight-bold col-3">제목</div>
		<input type="text" id="subject" class="form-control col-8 bg-white" value="${qna.subject}" disabled>
	</div>
	
	<div class="mt-2 d-flex justify-content-begin align-items-center w-50">
		<div class="font-weight-bold col-3">작성자</div>
		<input type="text" id="name" class="form-control col-8 bg-white" value="${qna.name}" disabled>
	</div>
	<hr>
	
	<div id="isMember" class="d-flex justify-content-begin align-items-center w-50 mt-3">
		<label class="font-weight-bold col-3">회원<input 	<c:if test="${qna.type eq 'member'}" > checked </c:if> type="radio" class=" mr-2" value="member" name="isMember"></label>
		<label class="font-weight-bold col-3">비회원<input <c:if test="${qna.type eq 'nonMember'}" > checked </c:if>type="radio" value="nonMember" name="isMember"></label>
	</div>
	
	<div><input type="text" class="ml-2 form-control col-5 bg-white" value="${qna.userNumber}" disabled></div>
	
	<div class="mt-2 d-flex justify-content-begin align-items-center w-50">
		<div class="font-weight-bold col-3">상품명</div>
		<input type="text" id="productName" class="form-control col-8 bg-white" value="${qna.productName}" disabled>
	</div>
	
	<div class="mt-4">
		<div class="font-weight-bold mb-2">리뷰 내용</div>
		<textarea id="contentArea" class="form-control bg-white" rows="5" cols="50" disabled>${qna.content}</textarea>
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
	<div class="mt-4 d-flex justify-content-center">
		<button id="qnaDeleteBtn" class="btn btn-secondary col-3" data-qna-id="${qna.id}">삭제하기</button>
	</div>
	
	<c:if test="${memberId == 1}">
	<hr>
		<h5 class="mt-4">관리자 댓글</h5>
		<div class="mt-3 d-flex justify-content-begin">
			<input id="qnaComment" type="text" class="form-control col-7">
			<button id="qnaCommentUpload" class="btn btn-primary col-1 ml-5" data-qna-id="${qna.id}">게시</button>
		</div>
	</c:if>
	
</div>


<script>
$(document).ready(function(e){
	//QnA 삭제하기
	$("#qnaDeleteBtn").on("click", function(e){
		let qnaId = $(this).data("qna-id");
		
		$.ajax({
			type: "DELETE"
			, url: "/customer/qna_delete"
			, data: {"reviewId":reviewId}
			, success: function(data) {
				if(data.result == "success"){
					location.href="/customer/qna_list_view";
				} else if (data.result == "fail") {
					alert("QnA 삭제를 실패했습니다. 다시 시도해주세요.");
					location.reload();
				}
			}
			, error: function(e) {
				alert("error");
			}
		});
	});
	
	//관리자 댓글 
	$("#qnaCommentUpload").on('click', function(e){
		let qnaId = $(this).data("qna-id");
		let content = $("#qnaComment").val();
		
		$.ajax({
			type: "GET"
			, url: "/comment/comment_list"
			, data: {"type":"qna", "boardId":qnaId, "content":content}
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
	
	//admin의 댓글 삭제
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