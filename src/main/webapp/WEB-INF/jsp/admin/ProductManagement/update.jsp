<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="button_themsp">
	<a href="/admin/product/list">Danh sách phụ kiện</a> 
</div>
<div class="button_themsp">
	<a href="/admin/product/add">Thêm phụ kiện mới</a> 
</div>
<form action="/admin/product/update" method="post" enctype="multipart/form-data">
	<h3>&nbsp;</h3>
	<table width="600" border="1">
		<tr>
			<td colspan="2" style="text-align: center; font-size: 25px;">Cập nhật phụ kiện</td>
		</tr>
		<tr>
			<td width="97">Tên phụ kiện</td>
			<td width="87"><input type="text" name="tensp"
				value="ten"></td>
		</tr>
		<tr>
			<td>Hình ảnh</td>
			<td><input type="file" name="hinhanh" /><img
				src="#"
				width="80" height="80"></td>
		</tr>
		<tr>
			<td>Giá</td>
			<td><input type="number" step="any" name="gia" min="0"
				value="100"></td>
		</tr>
		<tr>
			<td>Mô tả</td>
			<td><textarea name="noidung" cols="40" rows="10">mô tả</textarea></td>
		</tr>
		<tr>
			<td>Số lượng</td>
			<td><input type="number" name="soluong" min="1"
				value="1"></td>
		</tr>
		<tr>
			<td>Loại</td>
			<td><select name="loaisp">
				<option selected="selected" value="1">ten 1</option>
				<option value="2">ten 2</option>
			</select></td>
		</tr>
		<tr>
			<td>Phụ kiện điện thoại</td>
			<td><select name="loaisp">
				<option selected="selected" value="1">ten 1</option>
				<option value="2">ten 2</option>
			</select></td>
		</tr>
		<tr>
			<td colspan="2"><div align="center">
					<input type="submit" name="sua" value="Cập nhật">
				</div></td>
		</tr>
	</table>
</form>


