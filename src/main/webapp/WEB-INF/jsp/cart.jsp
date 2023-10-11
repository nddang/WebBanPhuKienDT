<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.model.Order" %>
<%if(session.getAttribute("customer") != null){%>
<div class="tieude">Giỏ hàng của bạn | <span>Xin chào bạn: <strong><em>${customer.name}</em></strong></div>

<div class="box_giohang">
	<%if(session.getAttribute("listorder") != null){%>
		<table width="100%" border="1" style="border-collapse: collapse; margin: 5px; text-align: center;">
			<tr>
				<td>Tên SP</td>
				<td>Hình ảnh</td>
				<td>Giá sp</td>
				<td>SL</td>
				<td>Tổng tiền</td>
				<td>Xóa</td>
			</tr>
		<c:forEach var="order" items="${listorder}">
			<tr>
				<td> ${order.product.name} </td>
				<td><img src="${order.product.imgurl}" width="100" height="100" /></td>
				<td> ${order.product.price} $</td>
				<td>
					<form action="/cart/plus/${order.product.id}" method="post">
						<button class="button_edit"><img src="/resources/imgs/plus.png" width="10" height="10"></button>
					</form>
					 ${order.numberProduct} 
					<form action="/cart/subtract/${order.product.id}" method="post">
						<button class="button_edit"><img src="/resources/imgs/subtract.png" width="10" height="10"></button>
					</form>
				</td>
				<td>
					
					<c:out value="${order.numberProduct*order.product.price}"/>
				</td>
				<td>
					<form action="/cart/delete/${order.product.id}" method="post">
						<button  class="button_edit"><img src="/resources/imgs/deletered.png" width="30" height="30"></button>
					</form>
				</td>
			</tr>
			<tr></tr>
		</c:forEach>
		
			<tr>
				<td colspan="4"></td>
				
				<td>Thành tiền : 
				<%
					List<Order> listorder = (List<Order>) session.getAttribute("listorder");
					double tongtien=0;
					for(Order x: listorder) {
						tongtien+=x.getProduct().getPrice()*x.getNumberProduct();
					}
					out.print(tongtien);
				%>
				 $ </td>
				<td colspan="4">
				</td>
			</tr>
		</table>
		<div class="button_dathang">
			<form action="/cart/save" method="post">
				<table>
				<tr>
					<td>Địa chỉ nhận hàng<strong style="color: red;"> (*)</strong></td>
					<td><input type="text" name="shipmentplace" size="50" required></td>
					<td><button>Đặt hàng</button></td>
				</tr>
				</table>
			</form>
		</div>
	<%} %>
	
	<%if(session.getAttribute("listorder") == null){%>
		<p>Giỏ hàng của bạn trống</p>
	<% } %>
		
		<ul class="control">
			<p>
				<a href="/home">Tiếp tục mua hàng</a>
			</p>
		</ul>
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