<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="product-box">
	<div class="d-flex justify-content-begin align-items-center w-50">
		<div class="font-weight-bold col-3">제목</div>
		<input type="text" id="subject" class="form-control col-8" value="${notice.subject}">
	</div>
	
	<div class="mt-4">
		<div class="font-weight-bold mb-2">리뷰 내용</div>
		<textarea id="contentArea" class="form-control" rows="5" cols="50">${notice.content}</textarea>
	</div>
	
	<div class="mt-4">
		<c:if test="${not empty notice.noticeImage}">
			<div class="font-weight-bold">현재 사진</div>
			<img src="${notice.noticeImage}"  alt="notice_image"><br>
		</c:if>
		<c:if test="${memberId == 951011}">
		<input type="file" id="file" accept=".jpg,.gif,.jpeg,.png">
		</c:if>
	</div>
	
	<c:if test="${memberId == 951011}">
	<div class="mt-4 d-flex justify-content-around">
		<button id="deleteBtn" class="btn btn-secondary col-5" >삭제하기</button>
		<button id="modifyBtn" class="btn btn-primary col-5" data-notice-id="${notice.id}">수정하기</button>
 	</div>
 	</c:if>
</div>

<script>
$(document).ready(function(e){
	
	//사진선택시 확장자 체크
	$("#file").on('change', function(e){
		let file = $(this).val();
		
		if (file != "") {
			let ext = file.split('.').pop().toLowerCase(); 
			if ($.inArray(ext, ['jpg', 'gif', 'png', 'jpeg']) == -1) {
				alert("gif, png, jpg, jepg 파일만 업로드 할 수 있습니다.");
				$("#file").val(""); 
				return;
			} 
		}
		
	});
	
	$("#modifyBtn").on('click', function(e){
		let subject = $("#subject").val();
		let content = $("#contentArea").val();
		let noticeId = $(this).data("notice-id");
		
		if (subject == "") {
			alert("제목을 입력하세요.");
			return;
		}
		
		if (content == "") {
			alert("내용을 입력하세요.");
			return;
		}
		
		let formData = new FormData();
		formData.append("subject", subject);
		formData.append("content", content);
		formData.append("noticeId", noticeId);
		formData.append("file", $("#file")[0].files[0]);
		
		$.ajax({
			type:"POST"
			, url: "/customer/notice_update"
			, data:formData 
			, enctype: "multipart/form-data" 
			, processData: false 
			, contentType: false
			, success: function(data) {
				if (data.result == "success") {
					alert("성공적으로 업로드 되었습니다.");
					location.href="/customer/notice_list_view"
				} else if(data.result == "fail") {
					alert("업로드에 실패했습니다. 다시 시도해주세요.");
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