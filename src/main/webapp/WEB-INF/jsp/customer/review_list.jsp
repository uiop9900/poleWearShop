<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<div class="member_order_box">
    <h1 class="text-center">Customer | Review</h1>
    
    <table class="table text-center mt-5">
    	<thead class="thead-light">
    		<tr>
    			<th>No.</th>
    			<th>상품명</th>
    			<th>제목</th>
    			<th>작성자</th>
    			<th>작성일</th>
    		</tr>
    	</thead>
		<tbody>
			<c:forEach var="review" items="${reviewList}" varStatus="status">
			<tr>
				<td>
					${fn:length(reviewList) -status.index}
				</td>
				<td>${review.productName}</td>
				<td><a href="/customer/review_detailed_view?reviewId=${review.id}">
					${review.subject}
				</a></td>
				<td>${review.loginId}</td>
				<td>
					<fmt:formatDate value="${review.createdAt}" pattern="yyyy-MM-dd" />
				</td>
			</tr>
			</c:forEach>
		</tbody>    
    </table>

</div>

