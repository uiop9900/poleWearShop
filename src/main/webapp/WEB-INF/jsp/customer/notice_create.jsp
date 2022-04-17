<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="member_order_box">
	<div class="d-flex justify-content-begin align-items-center w-50">
		<div class="font-weight-bold col-3">제목</div>
		<input type="text" id="subject" class="form-control col-8">
	</div>
	
	<div class="mt-4">
		<div class="font-weight-bold mb-2">Notice 내용</div>
		<textarea id="contentArea" class="form-control" rows="5" cols="50" placeholder="내용을 입력해주세요."></textarea>
	</div>
	
	<div class="mt-4">
		<input type="file" id="file" accept=".jpg,.gif,.jpeg,.png">
	</div>
	
	<div class="mt-4 w-25">
		<button id="uploadBtn" class="btn btn-primary w-100">업로드</button>
	</div>
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
	
	$("#uploadBtn").on('click', function(e){
		let subject = $("#subject").val();
		let content = $("#contentArea").val();
		
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
		formData.append("file", $("#file")[0].files[0]);
		
		$.ajax({
			type:"POST"
			, url: "/customer/notice_create"
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