<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="button_themsp">
	<a href="/admin/category/list">Danh sách loại</a> 
</div>
<form action="/admin/category/add" method="post" enctype="multipart/form-data">
	<h3>&nbsp;</h3>
	<table width="200" border="1">
		<tr>
			<td colspan="2" style="text-align: center; font-size: 25px;">Thêm loại phụ kiện mới</td>
		</tr>
		<tr>
			<td width="97">Tên loại</td>
			<td width="87"><input type="text" name="name"></td>
		</tr>
		<tr>
			<td colspan="2">
				<div align="center">
					<input type="submit" name="them" value="Thêm">
				</div>
			</td>
		</tr>
	</table>
</form>


