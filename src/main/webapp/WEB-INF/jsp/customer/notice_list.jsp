<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="member_order_box">
    <h1 class="text-center">Customer | Notice</h1>
    
     <table class="table text-center mt-5">
    	<thead class="thead-light">
    		<tr>
    			<th>No.</th>
    			<th>제목</th>
    			<th>작성자</th>
    			<th>작성일</th>
    		</tr>
    	</thead>
		<tbody>
			<c:forEach var="notice" items="${noticeList}">
			<tr>
				<td>
					NOTICE.
				</td>
				<td><a href="/customer/notice_detailed_view?noticeId=${notice.id}">
					${notice.subject}
				</a></td>
				<td>관리자</td>
				<td>
					<fmt:formatDate value="${notice.createdAt}" pattern="yyyy-MM-dd" />
				</td>
			</tr>
			</c:forEach>
		</tbody>    
    </table>
    
    <c:if test="${memberId == 1}" >
    	<div>
    		<a href="/customer/notice_create_view" class="btn btn-primary">글쓰기</a>
    	</div>
    
    </c:if>
    
</div>