<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="button_themsp">
	<a href="/admin/bill/list">Danh sách đơn hàng</a>
</div>

<form action="/admin/bill/update/${bill.id}" method="post"
	enctype="multipart/form-data">
	<h3>&nbsp;</h3>
	<table width="600" border="1">
		<tr>
			<td colspan="2" style="text-align: center; font-size: 25px;">Đơn hàng</td>
		</tr>
		<tr>
			<td>
			<p>ID: ${bill.id}</p>
			<p>Khách hàng: ${bill.customer.name}</p>
			<p>SĐT: ${bill.customer.phoneNumber}  -  Email: ${bill.customer.email}</p>
			<p>Ngày đặt: ${bill.createdAt}</p>
			<p>Địa chỉ nhận: ${bill.shipmentPlace}</p>
			<c:if test="${bill.paymentStatus=='Đã thanh toán'}">
				<p style="color: green">Trạng thái thanh toán:
					${bill.paymentStatus}</p>
				<p>Ngày thanh toán: ${bill.paymentAt}</p>
			</c:if>
			<c:if test="${bill.paymentStatus!='Đã thanh toán'}">
				<p>Trạng thái thanh toán:
					<select name="paymentStatus" >
						<option value="Đã thanh toán">Đã thanh toán</option>
						<option selected="selected" value="Chưa thanh toán">Chưa thanh toán</option>
					</select>
				</p>
			</c:if>
			
			<c:if test="${bill.shipmentStatus=='Đã nhận'}">
				<p style="color: green">Trạng thái giao hàng:
					${bill.shipmentStatus}</p>
			</c:if>
			<c:if test="${bill.shipmentStatus!='Đã nhận'}">
				<p>Trạng thái giao hàng:
					<select name="shipmentStatus" >
						<option selected="selected" value="${bill.shipmentStatus}">${bill.shipmentStatus}</option>
						<option value="Chưa giao">Chưa giao</option>
						<option value="Đang giao">Đang giao</option>
						<option value="Đã nhận">Đã nhận</option>
					</select>
				</p>
			</c:if>
			</td>
		</tr>
	</table>
	
	<table width="100%" border="1">
		<tr>
			<td colspan="5" style="text-align: center; font-size: 25px;">Danh sách sản phẩm đặt</td>
		</tr>
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
				<td>${order.product.price}VND</td>
				<td>${order.numberProduct}</td>
				<td><c:out value="${order.numberProduct*order.product.price}" />
					VND</td>
			</tr>
			<tr></tr>
		</c:forEach>

		<tr>
			<td colspan="3"></td>
			<td>Thành tiền : ${bill.totalPrice} VND</td>
			<td colspan="4"></td>
		</tr>
		<tr>
			<td colspan="5"><div align="center">
					<input type="submit" name="sua" value="Cập nhật">
				</div></td>
		</tr>
	</table>
	
</form>


