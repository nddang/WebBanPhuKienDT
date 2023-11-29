<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<table width="100%" border="1">
	<tr>
		<td>ID</td>
		<td>Khách hàng</td>
		<td>Thanh toán</td>
		<td>Trạng thái</td>
		<td>Chi tiết</td>
	</tr>
	<c:forEach var="bill" items="${listbill}">
		<tr>
			<td>${bill.id}</td>
			<td>${bill.customer.name}</td>
			<td>
				<c:if test="${bill.paymentStatus=='Đã thanh toán'}">
					<p style="color: green">${bill.paymentStatus}</p>
				</c:if> <c:if test="${bill.paymentStatus!='Đã thanh toán'}">
					<p style="color: red">${bill.paymentStatus}</p>
				</c:if>
			</td>
			<td>
				<c:if test="${bill.shipmentStatus=='Đã nhận'}">
					<p style="color: green">${bill.shipmentStatus}</p>
				</c:if> <c:if test="${bill.shipmentStatus!='Đã nhận'}">
					<p style="color: red">${bill.shipmentStatus}</p>
				</c:if>
			</td>
			<td><a href="/admin/bill/update/${bill.id}"><center>
						<img src="/resources/imgs/bacham.jpg" width="30" height="30" />
					</center></a></td>
		</tr>
	</c:forEach>
</table>
