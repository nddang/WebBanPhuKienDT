<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="button_themsp">
	<a href="/admin/product/list">Danh sách phụ kiện</a>
</div>
<div class="button_themsp">
	<a href="/admin/product/add">Thêm phụ kiện mới</a>
</div>
<form action="/admin/product/update/${product.id}" method="post"
	enctype="multipart/form-data">
	<h3>&nbsp;</h3>
	<table width="600" border="1">
		<tr>
			<td colspan="2" style="text-align: center; font-size: 25px;">Cập
				nhật phụ kiện</td>
		</tr>
		<tr>
			<td width="97">Tên phụ kiện</td>
			<td width="87"><input type="text" name="name"
				value="${product.name}"></td>
		</tr>
		<tr>
			<td>Hình ảnh</td>
			<td><input type="file" name="imgurl" /><img
				src="${product.imgurl}" width="80" height="80"></td>
		</tr>
		<tr>
			<td>Giá</td>
			<td><input type="number" step="any" name="price" min="0"
				value="${product.price}"></td>
		</tr>
		<tr>
			<td>Mô tả</td>
			<td><textarea name="des" cols="40" rows="10">${product.des}</textarea></td>
		</tr>
		<tr>
			<td>Số lượng</td>
			<td><input type="number" name="number" min="0"
				value="${product.number}"></td>
		</tr>
		<tr>
			<td>Loại</td>
			<td><select name="loaisp">
					<c:forEach var="category" items="${listC}">
						<c:if test="${product.category.id==category.id}">
							<option selected="selected" value="${category.id}">${category.name}</option>
						</c:if>
						<c:if test="${product.category.id!=category.id}">
							<option value="${category.id}">${category.name}</option>
						</c:if>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td>Phụ kiện điện thoại</td>
			<td><select name="loaidt" multiple>
					<c:forEach var="phone" items="${listPhone}">
						<c:if test="${phonename.contains(phone.name)}">
							<option selected="selected" value="${phone.name}">${phone.name}</option>
						</c:if>
						<c:if test="${!phonename.contains(phone.name)}">
							<option value="${phone.name}">${phone.name}</option>
						</c:if>
					</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td colspan="2"><div align="center">
					<input type="submit" name="sua" value="Cập nhật">
				</div></td>
		</tr>
	</table>
</form>


