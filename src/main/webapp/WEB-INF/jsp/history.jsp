<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.example.demo.model.Order"%>
<%if(session.getAttribute("customer") != null){%>
<div class="tieude">
	Đơn hàng của bạn | <span>Xin chào bạn: <strong><em>${customer.name}</em></strong>
</div>

<div class="box_giohang">
	<%if(session.getAttribute("listbill") != null){%>
	<table width="100%" border="1"
		style="border-collapse: collapse; margin: 5px; text-align: center;">
		<tr>
			<td>ID</td>
			<td>Ngày đặt</td>
			<td>Địa chỉ nhận</td>
			<td>Thanh toán</td>
			<td>Ngày thanh toán</td>
			<td>Trạng thái</td>
			<td>Chi tiết</td>
		</tr>
		<c:forEach var="bill" items="${listbill}">
			<tr>
				<td>${bill.id}</td>
				<td>${bill.createdAt}</td>
				<td>${bill.shipmentPlace}</td>
				<td>
				<c:if test="${bill.paymentStatus=='Đã thanh toán'}">
					<p style="color: green">${bill.paymentStatus}</p>
				</c:if>
				<c:if test="${bill.paymentStatus!='Đã thanh toán'}">
					<p style="color: red">${bill.paymentStatus}</p>
				</c:if>
				</td>
				<td>${bill.paymentAt}</td>
				<td>
				<c:if test="${bill.shipmentStatus=='Đã nhận'}">
					<p style="color: green">${bill.shipmentStatus}</p>
				</c:if>
				<c:if test="${bill.shipmentStatus!='Đã nhận'}">
					<p style="color: red">${bill.shipmentStatus}</p>
				</c:if>
				</td>
				<td>
					<form action="/history/detail/${bill.id}" method="get">
						<button class="button_edit">
							<img src="/resources/imgs/bacham.jpg" width="30" height="30">
						</button>
					</form>
				</td>
			</tr>
			<tr></tr>
		</c:forEach>
	</table>

	<%} %>

	<%if(session.getAttribute("listbill") == null){%>
	<p>Giỏ hàng của bạn trống</p>
	<% } %>

</div>
<% } %>

<%if(session.getAttribute("customer") == null){%>
<div class="tieude">
	Đơn hàng của bạn </strong>
</div>

<div class="box_giohang">
	<div class="thongbao">
		<p>Vui lòng đăng nhập để sử dụng chức năng này!</p>
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