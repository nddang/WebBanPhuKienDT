<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.model.Order" %>
<%if(session.getAttribute("customer") != null){%>
<div class="tieude">Đơn hàng của bạn | <span>Xin chào bạn: <strong><em>${customer.name}</em></strong></div>

<div class="box_giohang">

	<p>ID: ${bill.id}</p>
	<p>Ngày đặt: ${bill.createdAt}</p>
	<p>Địa chỉ nhận: ${bill.shipmentPlace}</p>
	<p>Ngày thanh toán: ${bill.paymentAt}</p>
	<p>Trạng thái thanh toán: ${bill.paymentStatus}</p>
	<p>Danh sách sản phẩm đặt:</p>
	<table width="100%" border="1"
		style="border-collapse: collapse; margin: 5px; text-align: center;">
		<tr>
			<td>Tên SP</td>
			<td>Hình ảnh</td>
			<td>Giá sp</td>
			<td>SL</td>
			<td>Tổng tiền</td>
		</tr>
		<c:forEach var="order" items="${listorder}">
			<tr>
				<td>${order.product.name}</td>
				<td><img src="${order.product.imgurl}" width="100" height="100" /></td>
				<td>${order.product.price} VND</td>
				<td> ${order.numberProduct}</td>
				<td><c:out value="${order.numberProduct*order.product.price}" /> VND</td>
			</tr>
			<tr></tr>
		</c:forEach>

		<tr>
			<td colspan="3"></td>

			<td>Thành tiền : ${bill.totalPrice} VND
			</td>
			<td colspan="4"></td>
		</tr>
	</table>
	
</div>
<% } %>
<%if(session.getAttribute("customer") == null){%>
	<div class="tieude">Đơn hàng của bạn </strong></div>
	
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