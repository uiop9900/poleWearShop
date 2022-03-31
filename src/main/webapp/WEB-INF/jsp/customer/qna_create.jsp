<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="member_order_box">

	<div class="d-flex justify-content-begin align-items-center w-50">
		<div class="font-weight-bold col-3">카테고리</div>
		<select id="category" class="form-control">
			<option>상품문의</option>
			<option>배송문의</option>
			<option>교환/환불문의</option>
			<option>기타</option>
		</select>
	</div>
	
	<div class="mt-2 d-flex justify-content-begin align-items-center w-50">
		<div class="font-weight-bold col-3">제목</div>
		<input type="text" id="subject" class="form-control col-8" >
	</div>
	
	<div class="mt-2 d-flex justify-content-begin align-items-center w-50">
		<div class="font-weight-bold col-3">작성자</div>
		<input type="text" id="name" class="form-control col-8" >
	</div>
	<hr>
	
	<%--회원/비회원에 따른 userNumber 받기 --%>
	<div id="isMember" class="d-flex justify-content-begin align-items-center w-50 mt-3">
		<label class="font-weight-bold col-3">회원<input type="radio" class=" mr-2" value="member" name="isMember"></label>
		<label class="font-weight-bold col-3">비회원<input type="radio" value="nonMember" name="isMember"></label>
	</div>
	<div><input type="text" id="memberLoginId"  class="userNumber ml-2 form-control col-5 d-none" placeholder="아이디를 기입하세요.">
	<input type="text" id="orderNumber"  class="userNumber ml-2 form-control col-5 d-none" placeholder="주문번호를 기입하세요."></div>

	<div class="mt-2 d-flex justify-content-begin align-items-center w-50">
		<div class="font-weight-bold col-3">상품명</div>
		<input type="text" id="productName" class="form-control col-8" >
	</div>
	
	<div class="mt-4">
		<div class="font-weight-bold mb-2">리뷰 내용</div>
		<textarea id="contentArea" class="form-control" rows="5" cols="50" placeholder="내용을 입력해주세요."></textarea>
	</div>
	
	<div class="mt-2 d-flex justify-content-begin align-items-center w-50">
		<div class="font-weight-bold col-3">비밀번호</div>
		<input type="number" id="password" class="form-control col-8"/>
	</div>
	<small class="text-danger font-weight-bold ml-2">비밀번호는 4자리의 숫자로만 가능합니다.</small>
	
	<div class="d-flex justify-content-center mt-5">
		<button id="qnaUploadBtn" class="btn btn-primary col-3">등록하기</button>
	</div>
</div>

<script>
$(document).ready(function(e){
	// 회원,비회원 userNumber
	$("#isMember").on('change', function(e){
		let type = $('input[name="isMember"]:checked').val();
		
		if (type == "member") {
			$("#memberLoginId").removeClass('d-none');
			$("#orderNumber").addClass('d-none');
			$("#orderNumber").val("");
		} else if(type == "nonMember") {
			$("#orderNumber").removeClass('d-none');
			$("#memberLoginId").addClass('d-none');
			$("#memberLoginId").val("");
		}
		
	});
	
	//Qna 패스워드
	$("#password").on('keydown', function(e){
		let password = $(this).val();
		if (password.length > 4) {
			alert("4자리까지만 가능합니다.");
			password = password.substring(0,3)
			$(this).val(password);
			return;
		}
	});

	//등록하기 버튼
	$("#qnaUploadBtn").on('click', function(e){
		
		//userNumber
		let memberLoginid = $("#memberLoginId").val();
		let orderNumber = $("#orderNumber").val();
		
		if (memberLoginid == "" && orderNumber == "") {
			alert("주문번호 혹은 아이디를 입력하세요.");
			return;
		}
		
		let userNumber = 0;
		if (memberLoginid != "") {
			userNumber = memberLoginid;
		} 
		if(orderNumber != "") {
			userNumber = orderNumber;
		}
		
		//값들 가지고 validation
		let type = $('input[name="isMember"]:checked').val();
		let category = $("#category").val();
		let subject = $("#subject").val();
		let name = $("#name").val();
		let productName = $("#productName").val();
		let content = $("#contentArea").val();
		let password = $("#password").val();
		
		if (subject == "") {
			alert("제목을 입력하세요.");
			return;
		}
		
		if (name == "") {
			alert("이름을 입력하세요.");
			return;
		}
		
		if (productName == "") {
			alert("상품명을 입력하세요.");
			return;
		}
		
		if (content == "") {
			alert("내용을 입력하세요.");
			return;
		}
		
		if (password == "") {
			alert("비밀번호를 입력하세요.");
			return;
		}
		
		if (password.length != 4) {
			alert("비밀번호는 숫자 4자리로 입력하세요.");
			return;
		}
		
		$.ajax({
			type: "GET"
			, url: "/customer/qna_create"
			, data: {"category":category, "subject": subject, "name":name, "type":type, "userNumber":userNumber,
				"productName":productName, "content":content, "password":password}
			, success: function(data) {
				if (data.result == "success") {
					alert("QnA가 등록되었습니다.");
					location.href="/customer/qna_list_view"
				} else if (data.result == "fail") {
					alert("QnA 등록에 실패했습니다. 다시 시도해주세요.");
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