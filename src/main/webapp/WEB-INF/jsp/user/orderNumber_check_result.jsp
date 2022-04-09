<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="member_order_box">
	<table class="table text-center">
		<thead class="thead-light">
			<tr>
				<th>상품 이미지</th>
				<th>상품 명</th>
				<th>수량</th>
				<th>가격</th>
				<th>구매일자</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
				<c:forEach var="order" items="${orderProductViewList}">
    			<c:forEach var="orderProduct" items="${order.orderProduct}" varStatus="status">
				<tr>
					<td><img src="${order.productImage[status.index]}" alt="product-image" width="50"></td>
					<td>${order.product[status.index].productName}</td>
					<td>${orderProduct.count}</td>
					<td><fmt:formatNumber value="${orderProduct.price}"/>원</td>
					<td>
						<fmt:formatDate value="${orderProduct.createdAt}" pattern="yyyy-MM-dd"  />
					</td>
					<td>
						<a class="btn btn-primary text-white" href="/customer/review_create_view?productId=${order.product[status.index].id}&productName=${order.product[status.index].productName}&productImage=${order.productImage[status.index]}&productPrice=${orderProduct.count}">
						리뷰 작성하기</a>
					</td>
				</tr>
				</c:forEach>
				</c:forEach>
		</tbody>
	</table>
</div>

