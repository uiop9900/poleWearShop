<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="member_order_box">
    <h1 class="text-center">My Page</h1>

    <div class="d-flex mt-5 align-items-center justify-content-center">
    	<div class="col-2 user_page_font">이름*</div>
    	<input id="name" type="text" class="form-control col-7" value="${user.name}">
    </div>
    
    <div class="d-flex mt-3 align-items-center justify-content-center">
    	<div class="col-2 user_page_font">전화번호*</div>
    	<input id="phoneNumber" type="text" class="form-control col-7" value="${user.phoneNumber}">
    </div>
    
     <div class="d-flex mt-3 align-items-center justify-content-center">
    	<div class="col-2 user_page_font">이메일*</div>
    	<input id="email" type="text" class="form-control col-7" value="${user.email}">
    </div>
    
    <div class="d-flex mt-3 align-items-center justify-content-center">
    	<div class="col-2 user_page_font">주소</div>
    	<input id="address" type="text" class="form-control col-7" value="${user.address}">
    </div>
    <div class="mt-5 d-flex justify-content-center">
   		<button id="updateBtn" type="button" class="btn btn-primary col-6" data-member-id="${user.id}">수정하기</button>
    </div>
</div>

<script>
$(document).ready(function(e){
	$("#updateBtn").on('click', function(e){
		let memberId = $(this).data("member-id");
		let name = $("#name").val();
		let address = $("#address").val();
		let phoneNumber = $("#phoneNumber").val();
		let email = $("#email").val();
		
		// validation
		if (name == "") {
			alert("이름을 입력하세요.");
			return;
		}
		
		if (phoneNumber == "") {
			alert("전화번호를 입력하세요.");
			return;
		}
		
		if (email == "") {
			alert("이메일을 입력하세요.");
			return;
		}
		
		$.ajax({
			type: "GET"
			, url: "/user/member_update"
			, data: {"address":address, "name":name, "email":email, "phoneNumber":phoneNumber, "memberId":memberId}
			, success: function(data){
				if (data.result == "success"){
					let loginId = data.loginId;
					alert("성공적으로 수정되었습니다.");
					location.href= "/user/member_page_view?memberLoginId=" + loginId;
				} else if (data.result == "fail") {
					alert("수정이 실패했습니다. 다시 시도해주세요.");
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