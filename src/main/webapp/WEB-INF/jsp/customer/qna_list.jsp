<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<div class="member_order_box">
    <h1 class="text-center">Customer | QnA</h1>
    
    <table class="table text-center mt-5">
    	<thead class="thead-light">
    		<tr>
    			<th>No.</th>
    			<th>카테고리</th>
    			<th>제목</th>
    			<th>작성자</th>
    			<th>작성일</th>
    		</tr>
    	</thead>
		<tbody>
			<c:forEach var="qna" items="${qnaList}" varStatus="status">
			<tr>
				<td>
					${fn:length(qnaList) -status.index}
				</td>
				<td>${qna.category}</td>
				
				<%--admin은 비밀번호 하지않고 qna에 들어간다. --%>
				<c:choose>
					<c:when test="${memberId == 951011}">
						<td><a class="qna" href="/customer/qna_detailed_view?qnaId=${qna.id}">${qna.subject}</a></td>
					</c:when>
					<c:otherwise>
						<td><a class="qna" href="#" data-toggle="modal" data-qna-id="${qna.id}" data-target="#moreModal" >
						${qna.subject}
						</a></td>
					</c:otherwise>
				</c:choose>
				<td>${qna.name}</td>
				<td>
					<fmt:formatDate value="${qna.createdAt}" pattern="yyyy-MM-dd" />
				</td>
			</tr>
			</c:forEach>
		</tbody>    
    </table>
	
	<div class="mt-4">
		<a href="/customer/qna_create_view" class="btn btn-primary">글쓰기</a>
	</div>
	
<!-- Modal -->
<div class="modal fade" id="moreModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Log out</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        작성시, 기입한 비밀번호 숫자 4자리를 입력하세요.
        <input id="password" type="number" class="form-control mt-2">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" id="checkPasswordBtn" class="btn btn-primary" data-qna-id="${qna.id}">확인</button>
      </div>
    </div>
  </div>
</div>

</div>

<script>
$(document).ready(function(e){
	$(".qna").on('click', function(e){
		let qnaId = $(this).data("qna-id");
		$("#checkPasswordBtn").data('qna-id', qnaId);
	});
	
	$("#checkPasswordBtn").on('click', function(e){
		let password = $("#password").val();
		let qnaId = $(this).data("qna-id");
		
		$.ajax({
			type:"POST"
			,url: "/customer/qna_check_password"
			, data: {"qnaId":qnaId, "password":password}
			, success: function(data) {
				if (data.result == "success") {
					let qnaId = data.qnaId;
					location.href="/customer/qna_detailed_view?qnaId=" + qnaId;
				} else if(data.result == "fail") {
					alert("비밀번호가 틀렸습니다. 다시 한번 확인해주세요.");
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