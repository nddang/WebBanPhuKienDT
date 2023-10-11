<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="menu">
    <ul>
    	<li><a href="/home">Trang chủ</a></li>
        <li><a href="/cart">Giỏ hàng</a></li>
        <li><a href="/history">Lịch sử đơn hàng</a></li>
        <%if(session.getAttribute("customer") == null){%>
		<li><a href="/register">Đăng ký</a></li>
        <li><a href="/login">Đăng nhập</a></li>
		<%} %>
        <%if(session.getAttribute("customer") != null){%>
		<li><a href="/logout">Đăng xuất</a></li>
		<li style="float: right; margin-right:20px"><p>Xin chào <strong>${customer.name}</strong></p></li>
		<%} %>
    </ul>
</div>
