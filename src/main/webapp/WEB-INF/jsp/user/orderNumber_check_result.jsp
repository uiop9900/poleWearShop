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
				<c:forEach items="${orderProductViewList}" var="basket">
			<tr>
					<td>${basket.product.productName}</td>
					<td>${basket.basket.count}</td>
					<td><fmt:formatNumber value="${basket.basket.price}"/>원</td>
					<td>
						<fmt:formatDate value="${basket.basket.createdAt}" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초"  />
					</td>
			</tr>
				</c:forEach>
		</tbody>
	</table>
</div>

