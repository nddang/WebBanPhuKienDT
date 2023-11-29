<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/Email.js"></script>

<div class="tieude">HOAN NGHÊNH QUÝ BẠN ĐẶT HÀNG TẠI XƯỞNG PHỤ
	KIỆN</div>
<c:if test="${mess!=null}">
	<div class="thongbao">
		<p>${mess}</p>
	</div>
</c:if>
<div class="dangky">
	<p style="font-size: 18px; color: red; margin: 5px;">Các mục dấu *
		là bắt buộc tối thiểu. Vui lòng điền đầy đủ và chính xác (Số nhà, Ngõ,
		thôn xóm/ấp, Phường/xã, huyện/quận, tỉnh, TP)</p>
	<form name="formRegister" action="register" method="post"
		onsubmit="return validate(document.formRegister.email,document.formRegister.phone)">
		<table width="100%" border="1" style="border-collapse: collapse;">
			<tr>
				<td width="40%">Họ tên người mua <strong style="color: red;">(*)</strong></td>
				<td width="60%"><input type="text" name="name" size="50"
					required></td>
			</tr>
			<tr>
				<td>Email <strong style="color: red;"> (*)</strong></td>
				<td width="60%"><input type="text" name="email" size="50"
					required></td>
			</tr>
			<tr>
				<td>Mật khẩu <strong style="color: red;"> (*)</strong></td>
				<td width="60%"><input type="password" name="password"
					size="50" required></td>
			</tr>
			<tr>
				<td>Điện thoại <strong style="color: red;"> (*)</strong></td>
				<td width="60%"><input type="text" name="phone" size="50"
					required></td>
			</tr>
			<tr>
				<td>Địa chỉ <strong style="color: red;"> (*)</strong></td>
				<td width="60%"><input type="text" name="location" size="50"
					required></td>
			</tr>
			<tr>
				<td colspan="2">
					<p>
						<input style="cursor: pointer;" type="submit" value="Đăng kí" />
					</p>
				</td>
			</tr>
		</table>
	</form>
</div>
<h3>
	<a href="/login"
		style="text-decoration: none; color: #FFF; margin: 10px; border-radius: 10px; padding: 5px;; background: #F00; float: right;">Đăng
		nhập</a>
</h3>