<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="member_order_box">
	<table class="table text-center">
		<thead class="thead-light">
			<tr>
				<th>상품 명</th>
				<th>수량</th>
				<th>가격</th>
				<th>구매일자</th>
			</tr>
		</thead>
		<tbody>
				<c:forEach var="order" items="${orderProductViewList}">
    			<c:forEach var="orderProduct" items="${order.orderProduct}" varStatus="status">
				<tr>
					<td>${order.product[status.index].productName}</td>
					<td>${orderProduct.count}</td>
					<td><fmt:formatNumber value="${orderProduct.price}"/>원</td>
					<td>
						<fmt:formatDate value="${orderProduct.createdAt}" pattern="yyyy-MM-dd"  />
					</td>
				</tr>
				</c:forEach>
				</c:forEach>
		</tbody>
	</table>
</div>

