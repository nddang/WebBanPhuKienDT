<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="menu">
    <ul>
    	<li><a href="/home">Trang chủ</a></li>
        <%if(session.getAttribute("customer") == null){%>
		<li><a href="/register">Đăng ký</a></li>
        <li><a href="/login">Đăng nhập</a></li>
		<%} %>
        <li><a href="/cart">Giỏ hàng</a></li>
        <li><a href="/contact">Liên hệ</a></li>
        <%if(session.getAttribute("customer") != null){%>
		<li><a href="/logout">Đăng xuất</a></li>
		<%} %>
    </ul>
</div>
