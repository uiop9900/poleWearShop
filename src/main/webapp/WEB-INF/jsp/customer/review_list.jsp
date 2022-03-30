<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
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
			<tr>
				<td>1</td>
				<td>a라인 원피스</td>
				<td>예뻐요</td>
				<td>이*아</td>
				<td>2022.03.30</td>
			</tr>
		</tbody>    
    </table>
    
    <div>
    	<a href="/customer/review_create_view" class="btn btn-primary">글쓰기</a>
    </div>
</div>

