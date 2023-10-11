<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="tieude">HOAN NGHÊNH QUÝ BẠN ĐẶT HÀNG TẠI XƯỞNG PHỤ KIỆN</div>

<c:if test="${mess!=null}">
<div class="thongbao">
	<p>${mess}</p>
</div>
</c:if>

<div class="dangky">
	<form action="/login" method="post">
		<table width="100%" border="1" style="border-collapse: collapse;">
			<tr>
				<td width="40%">Tài Khoản : <strong style="color: red;">(*)</strong></td>
				<td width="60%"><input type="text" name="username" size="50"required></td>
			</tr>
				<td>Mật khẩu : <strong style="color: red;"> (*)</strong></td>
				<td width="60%"><input type="password" name="password" size="50"required></td>
			</tr>
			<tr>
				<td colspan="2">
					<p>
						<input style="cursor: pointer;" type="submit" value="Đăng nhập" />
					</p>
				</td>
			</tr>
		</table>
	</form>
</div>
<h3>
	<a href="/register"style="text-decoration: none; color: #FFF; margin: 10px; border-radius: 10px; padding: 5px;; background: #F00; float: right;">Đăng ký tài khoản để mua hàng.</a>
</h3>