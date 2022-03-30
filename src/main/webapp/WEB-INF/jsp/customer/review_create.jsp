<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="member_order_box">
	<div class="d-flex justify-content-begin align-items-center w-50">
		<div class="font-weight-bold col-3">상품명</div>
		<input type="text" id="productId" data-product-id="${product.id}" class="form-control col-8" value="${product.productName}" disabled>
	</div>

	<div class="d-flex justify-content-begin align-items-center w-50 mt-3">
		<div class="font-weight-bold col-3">작성자</div>
		<input type="text" id="memberLoginId" class="form-control col-8" value="${memberLoginId}" disabled>
	</div>
	
	<div class="d-flex justify-content-begin align-items-center w-50 mt-3">
		<div class="font-weight-bold col-3">제목</div>
		<input type="text" id="subject" class="form-control col-8">
	</div>
	
	<div class="mt-4">
		<div class="font-weight-bold mb-2">리뷰 내용</div>
		<textarea id="contentArea" class="form-control" rows="5" cols="50" placeholder="내용을 입력해주세요."></textarea>
	</div>
	
	<div class="mt-4 d-flex justify-content-begin align-items-center">
		<label class="file-upload" for="file">
			사진 업로드
		</label>
		<input type="file" id="file" class="d-none" accept=".jpg,.gif,.jpeg,.png">
		<div id="fileName" class="ml-3"></div>
	</div>
	
	
	<div class="mt-5 d-flex justify-content-center">
		<button id="uploadReviewBtn" class="btn btn-primary col-6">리뷰 업로드</button>
	</div>
</div>

<script>
$(document).ready(function(e){
	
	//사진선택시 확장자 체크
	$("#file").on('change', function(e){
		let fileName = $(this).val();
		
		if (fileName != "") {
			let ext = fileName.split('.').pop().toLowerCase(); 
			if ($.inArray(ext, ['jpg', 'gif', 'png', 'jpeg']) == -1) {
				alert("gif, png, jpg, jepg 파일만 업로드 할 수 있습니다.");
				$("#fileName").text(""); 
				return;
			} 
		}
		
		$("#fileName").text(fileName);
	});
	
	//리뷰 업로드
	$("#uploadReviewBtn").on('click', function(e){
		let productId = $("#productId").data("product-id");
		let productName = $("#productId").val();
		let memberLoginId = $("#memberLoginId").val();
		let subject = $("#subject").val();
		let content = $("textarea").val();
		
		if (subject == "") {
			alert("리뷰 제목을 입력하세요.");
			return;
		}
		
		if (content == "") {
			alert("리뷰 내용을 입력하세요.");
			return;
		}
		
		let formData = new FormData();
		formData.append("productId", productId);
		formData.append("productName", productName);
		formData.append("memberLoginId",memberLoginId );
		formData.append("subject", subject);
		formData.append("content", content);
		formData.append("file", $("#file")[0].files[0]);
		
		$.ajax({
			type: "POST"
			, url: "/customer/review_create"
			, data:formData 
			, enctype: "multipart/form-data" 
			, processData: false 
			, contentType: false
			, success: function(data){
				if (data.result == "success"){
					let memberLoginId = data.loginId;
					alert("리뷰를 작성해주셔서 감사합니다.");
					location.href="/user/member_page_view?memberLoginId=" + memberLoginId;
				} else if (data.result == "fail") {
					alert("리뷰 업로드에 실패했습니다. 다시 시도해주세요.");
					location.reload();
				}
			}
			, error: function(e){
				alert("error");
			}
		});
	});
	
});

</script>