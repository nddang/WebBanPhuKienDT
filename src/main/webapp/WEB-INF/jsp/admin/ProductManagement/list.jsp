<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="button_themsp">
	<a href="/admin/product/add">Thêm phụ kiện mới</a>
</div>

<table width="100%" border="1">
	<tr>
		<td>ID</td>
		<td>Tên phụ kiện</td>
		<td>Hình ảnh</td>
		<td>Giá</td>
		<td>Số lượng</td>
		<td>Loại</td>
		<td>Phụ kiện điện thoại</td>
		<td colspan="2"></td>
	</tr>
	<c:forEach var="product" items="${listP}">
		<tr>
			<td>${product.id}</td>
			<td>${product.name}</td>
			<td><img src="${product.imgurl}" width="80" height="80" /></td>
			<td>${product.price}</td>
			<td>${product.number}</td>
			<td>${product.category.name}</td>
			<td>${product.phonename}</td>
			<td><a href="/admin/product/update/${product.id}"><center>
						<img src="/resources/imgs/edit.png" width="30" height="30" />
					</center></a></td>
			<td><a href="/admin/product/delete/${product.id}" class="delete_link"><center>
						<img src="/resources/imgs/delete.png" width="30" height="30" />
					</center></a></td>
		</tr>
	</c:forEach>
</table>

<div class="pagination">
	<a href="/admin/product/list/page/1"> << </a>
	<c:if test="${pagenumber>1}">
		<a href="/admin/product/list/page/${pagenumber-1}"> < </a>
	</c:if>
	<c:if test="${pagenumber-1<1}">
		<a href="/admin/product/list/page/1"> < </a>
	</c:if>
	<a>${pagenumber}</a>
	<c:if test="${pagenumber+1>lastpage}">
		<a href="/admin/product/list/page/${lastpage}"> > </a>
	</c:if>
	<c:if test="${pagenumber<lastpage}">
		<a href="/admin/product/list/page/${pagenumber+1}"> > </a>
	</c:if>
	<a href="/admin/product/list/page/${lastpage}"> >> </a>
</div>