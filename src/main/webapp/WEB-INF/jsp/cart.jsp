<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%if(session.getAttribute("customer") != null){%>
	<div class="tieude">Giỏ hàng của bạn | <span>Xin chào bạn:<strong><em>${customer.name}</em></strong></div>

	<div class="box_giohang">
	<%if(session.getAttribute("listorder") != null){%>
		<table width="100%" border="1" style="border-collapse: collapse; margin: 5px; text-align: center;">
			<tr>
				<td>Tên SP</td>
				<td>Hình ảnh</td>
				<td>Giá sp</td>
				<td>SL</td>
				<td>Tổng tiền</td>
				<td>Quản lý</td>
			</tr>
				
		<c:forEach var="order" items="${listorder}">
			<tr>
				<td> ${order.product.name} </td>
				<td><img src="${order.product.imgurl}" width="100" height="100" /></td>
				<td> ${order.product.price} $</td>
				<td>
					<a href="#"style="margin-right: 2px;">
						<img src="/resources/imgs/plus.png" width="20" height="20">
					</a> 
					 ${order.numberproduct} 
					<a href="#" style="margin-left: 2px;">
						<img src="/resources/imgs/subtract.png" width="20" height="20">
					</a>
				</td>
				<td>
					<c:out value="${order.numberproduct*order.product.price}"/>
				</td>
				<td><a href="#"><img src="/resources/imgs/deletered.png" width="30" height="30"></a></td>
			</tr>
			<tr></tr>
		</c:forEach>
		
			<tr>
				<td colspan="4"><a href="#" style="text-decoration: none;">Xóa toàn bộ</a></td>
				<td>Thành tiền :  ${tongtien} $ </td>
			</tr>
			
		</table>
	
		<ul class="control">
			<p>
				<a href="/home">Tiếp tục mua hàng</a>
			</p>
			<p style="float: right; background: #FF0; text-decoration: none;">
				<a href="#" style="color: #000; margin: 5px;">Thanh toán</a>
			</p>
		</ul>
	<%} %>
	<%if(session.getAttribute("listorder") == null){%>
		<p>Giỏ hàng của bạn trống</p>
	
		<ul class="control">
			<p>
				<a href="/home">Tiếp tục mua hàng</a>
			</p>
		</ul>
	<% } %>
		
	</div>
<% } %>

<%if(session.getAttribute("customer") == null){%>
	<div class="tieude">Giỏ hàng của bạn </strong></div>
	
	<div class="box_giohang">
		<div class="thongbao">
			<p>Vui lòng đăng nhập để sử dụng chức năng này! </p>
		</div>
	
		<ul class="control">
			<p>
				<a href="/register">Đăng ký mới</a>
			</p>
			<p>
				<a href="/login">Bạn đã có tài khoản</a>
			</p>
		</ul>
	</div>
<% } %>