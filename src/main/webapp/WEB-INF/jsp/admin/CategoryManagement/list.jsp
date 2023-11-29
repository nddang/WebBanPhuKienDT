<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="button_themsp">
	<a href="/admin/category/add">Thêm loại mới</a>
</div>

<table width="100%" border="1">
	<tr>
		<td>ID</td>
		<td>Tên loại</td>
		<td colspan="2"></td>
	</tr>

	<c:forEach var="category" items="${listC}">
		<tr>
			<td>${category.id}</td>
			<td>${category.name}</td>
			<td><a href="/admin/category/update/${category.id}"><center>
						<img src="/resources/imgs/edit.png" width="30" height="30" />
					</center></a></td>
			<td><a href="/admin/category/delete/${category.id}" class="delete_link"><center>
						<img src="/resources/imgs/delete.png" width="30" height="30" />
					</center></a></td>
		</tr>
	</c:forEach>
</table>
