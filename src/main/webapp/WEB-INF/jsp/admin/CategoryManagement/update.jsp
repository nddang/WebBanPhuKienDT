<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="button_themsp">
	<a href="/admin/category/list">Danh sách loại</a>  
</div>
<div class="button_themsp">
	<a href="/admin/category/add">Thêm loại mới</a> 
</div>
<form action="/admin/category/update/${category.id}" method="post" enctype="multipart/form-data">
	<h3>&nbsp;</h3>
	<table width="200" border="1">
		<tr>
			<td colspan="2" style="text-align: center; font-size: 25px;">Cập nhật thông tin loại phụ kiện</td>
		</tr>
		<tr>
			<td width="97">Tên loại</td>
			<td width="87"><input type="text" name="name"
				value="${category.name}"></td>
		</tr>
		
		<tr>
			<td colspan="2">
				<div align="center">
					<input type="submit" name="sua" value="Cập nhật">
				</div>
			</td>
		</tr>
	</table>
</form>


