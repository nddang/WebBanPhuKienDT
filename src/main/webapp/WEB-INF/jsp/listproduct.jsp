<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta charset="UTF-8">
<title>Danh Sach sp</title>
</head>
<c:forEach var="category" items="${listC}">
	<div class="tieude"> Sản phẩm <c:out value="${category.name}" /></div>
	<c:forEach var="product" items="${listP}">
		<c:if test="${product.category==category}">
		<ul class="product">
			<li><a href="/detailproduct/${product.id}"> <img src="<c:out value="${product.imgurl}" />" width="150" height="150" />
					<p style="color: skyblue">
						<c:out value="${product.name}" />
					</p>
					<p style="color: red; font-weight: bold; border: 1px solid #d9d9d9; width: 150px; height: 30px; line-height: 30px; margin-left: 35px; margin-bottom: 5px;">
						<c:out value="${product.price}" /> $
					</p>
			</a></li>
		</ul>
		</c:if>
	</c:forEach>
	<div class="clear"></div>
</c:forEach>